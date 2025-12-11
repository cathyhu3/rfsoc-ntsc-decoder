/*
two types of hsync:
1. long hsync period after new frame (low sync, high sync, low sync)
2. singular hsync period before each new line (front porch, sync tip, back porch)
*/

module hsync_detector_axis_old #(
    parameter integer C_S00_AXIS_TDATA_WIDTH = 16,
    parameter integer C_M00_AXIS_TDATA_WIDTH = 32
)
(
    // Ports of Axis Slave Bus Interface S00_AXIS: 
    // s00_axis_tdata = {[14:0] magnitude in}
    input wire s00_axis_aclk, s00_axis_aresetn,
    input wire s00_axis_tlast, s00_axis_tvalid,
    input wire [C_S00_AXIS_TDATA_WIDTH-1:0] s00_axis_tdata,
    input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1:0] s00_axis_tstrb,
    output logic s00_axis_tready,

    // Ports of Axis Master Bus Interface M00_AXIS
    // m00_axis_tdata = {hsync, colorburst, [15:0] colorburst_val}
    // input wire m00_axis_aclk, m00_axis_aresetn,
    input wire m00_axis_tready,
    output logic m00_axis_tvalid,
    // output logic m00_axis_tvalid, m00_axis_tlast,
    // output logic [C_M00_AXIS_TDATA_WIDTH-1:0] m00_axis_tdata,
    // output logic [(C_M00_AXIS_TDATA_WIDTH/8)-1:0] m00_axis_tstrb,

    // pulses at falling edge of hsync and cb
    output logic hsync_pulse,
    output logic cb_pulse,
    output logic [15:0] colorburst_val,
    output logic hsync, // high for the whole hsync

    // hsync_thresholds
    input wire [7:0] lower_ls,
    input wire [7:0] upper_ls,
    input wire [7:0] lower_hs,
    input wire [7:0] upper_hs,
    input wire [7:0] lower_vd,
    input wire [7:0] upper_vd,
    input wire [7:0] lower_fp,
    input wire [7:0] upper_fp,
    input wire [7:0] lower_st,
    input wire [7:0] upper_st,
    input wire [7:0] lower_bp,
    input wire [7:0] upper_bp,
    input wire [7:0] lower_eq,
    input wire [7:0] upper_eq 
);

// assign s00_axis_tready = m00_axis_tready; // input ready: simple back pressure propogation
assign s00_axis_tready = 1;
enum {WAIT, LOW_SYNC, HIGH_SYNC, VIDEO, FRONT_PORCH, SYNC_TIP, BACK_PORCH} state;

localparam LOWER_LS = 128;
localparam UPPER_LS = 136;
localparam LOWER_HS = 184;
localparam UPPER_HS = 190;
localparam LOWER_VD = 75;
localparam UPPER_VD = 100;
localparam LOWER_FP = 133;
localparam UPPER_FP = 138;
localparam LOWER_ST = 184;
localparam UPPER_ST = 192;
localparam LOWER_BP = 134;
localparam UPPER_BP = 142;
localparam LOWER_EQ = 135;
localparam UPPER_EQ = 142;
logic in_ls_range;
logic in_hs_range;
logic in_vd_range;
logic in_fp_range;
logic in_st_range;
logic in_bp_range;
logic in_eq_range;

// localparam LS_SAMPLES = 37;
// localparam HS_SAMPLES = 34;
// localparam FP_SAMPLES = 8;
// localparam ST_SAMPLES = 35;
// localparam BP_SAMPLES = 30;
// lower bound of samples
localparam LS_SAMPLES_L = 34;
localparam HS_SAMPLES_L = 35;
localparam FP_SAMPLES_L = 5;
localparam ST_SAMPLES_L = 33;
localparam BP_SAMPLES_L = 27;
// upper bound of samples
localparam LS_SAMPLES_U = 43;
localparam HS_SAMPLES_U = 45;
localparam FP_SAMPLES_U = 12;
localparam ST_SAMPLES_U = 40;
localparam BP_SAMPLES_U = 34;
logic [5:0] ls_counter;
logic [5:0] hs_counter;
logic [5:0] fp_counter;
logic [5:0] st_counter;
logic [5:0] bp_counter;
logic [5:0] eq_counter;
logic in_lsc_range;
logic in_hsc_range;
logic in_fpc_range;
logic in_stc_range;
logic in_bpc_range;

logic [15:0] magnitude;
assign magnitude = s00_axis_tdata;

/// SIGNALS FOR SIMULATION ///
// m00_axis_tdata = {hsync, colorburst, [15:0] colorburst_val}

// logic hsync;
logic colorburst;
// logic [15:0] synctip_val;
// logic [15:0] colorburst_val;

// assign hsync = m00_axis_tdata[17];
// assign colorburst = m00_axis_tdata[16];
// assign synctip_val = m00_axis_tdata[29:15];
// assign colorburst_val = m00_axis_tdata[15:0];

// making sure transition from one state to another is valid by magnitude value
// always_comb begin
//     in_ls_range = (magnitude > LOWER_LS && magnitude < UPPER_LS);
//     in_hs_range = (magnitude > LOWER_HS && magnitude < UPPER_HS);
//     in_fp_range = (magnitude > LOWER_FP && magnitude < UPPER_FP);
//     in_st_range = (magnitude > LOWER_ST && magnitude < UPPER_ST);
//     in_bp_range = (magnitude > LOWER_BP && magnitude < UPPER_BP);
//     in_vd_range = (magnitude > LOWER_VD && magnitude < UPPER_VD);
//     in_eq_range = (magnitude > LOWER_EQ && magnitude < UPPER_EQ);
// end
always_comb begin
    in_ls_range = (magnitude > lower_ls && magnitude < upper_ls);
    in_hs_range = (magnitude > lower_hs && magnitude < upper_hs);
    in_fp_range = (magnitude > lower_fp && magnitude < upper_fp);
    in_st_range = (magnitude > lower_st && magnitude < upper_st);
    in_bp_range = (magnitude > lower_bp && magnitude < upper_bp);
    in_vd_range = (magnitude > lower_vd && magnitude < upper_vd);
    in_eq_range = (magnitude > lower_eq && magnitude < upper_eq);
end

// making sure transition from one state to another is valid by sample count
always_comb begin
    in_lsc_range = (ls_counter > LS_SAMPLES_L && ls_counter < LS_SAMPLES_U);
    in_hsc_range = (hs_counter > HS_SAMPLES_L && hs_counter < HS_SAMPLES_U);
    in_fpc_range = (fp_counter > FP_SAMPLES_L && fp_counter < FP_SAMPLES_U);
    in_stc_range = (st_counter > ST_SAMPLES_L && st_counter < ST_SAMPLES_U);
    in_bpc_range = (bp_counter > BP_SAMPLES_L && bp_counter < BP_SAMPLES_U);
end

always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        ls_counter <= 0;
        hs_counter <= 0;
        fp_counter <= 0;
        st_counter <= 0;
        bp_counter <= 0;
        eq_counter <= 0;
    end else begin
        if (s00_axis_tvalid && s00_axis_tready) begin
            if (in_ls_range || state == LOW_SYNC) begin
                ls_counter <= ls_counter + 1;
            end else begin
                ls_counter <= 0;
            end

            if (in_hs_range || state == HIGH_SYNC) begin
                hs_counter <= hs_counter + 1;
            end else begin
                hs_counter <= 0;
            end

            if (in_fp_range || state == FRONT_PORCH) begin
                fp_counter <= fp_counter + 1;
            end begin
                fp_counter <= 0;
            end

            if (in_st_range || state == SYNC_TIP) begin
                st_counter <= st_counter + 1;
            end else begin
                st_counter <= 0;
            end

            if (in_bp_range || state == BACK_PORCH) begin
                bp_counter <= bp_counter + 1;
            end else begin
                bp_counter <= 0;
            end

            if (in_eq_range) begin
                eq_counter <= eq_counter + 1;
            end else begin
                eq_counter <= 0;
            end
        end
    end
end

// TYPE 1 state transition logic
always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        state <= WAIT;
        cb_pulse <= 0;
        hsync_pulse <= 0;
    end else begin
        if (s00_axis_tvalid && s00_axis_tready) begin // new data handshake
            case (state)
                WAIT: begin
                    cb_pulse <= 0;
                    hsync_pulse <= 0;
                    if (in_vd_range) begin // hsync type 2
                        state <= VIDEO;
                    end else if (in_ls_range) begin // hysnc type 1
                        state <= LOW_SYNC;
                    end
                end
                LOW_SYNC: begin
                    hsync_pulse <= 0;
                    // if we've entered the HIGH_SYNC region in a reasonable amt of time
                    if (in_hs_range && in_lsc_range) begin
                        state <= HIGH_SYNC;
                    // GO BACK: if we've been in the LOW_SYNC or EQUILIZER region for too long
                    // end else if (ls_counter > LS_SAMPLES_U || eq_counter > 8) begin
                    end else if (ls_counter > upper_ls || eq_counter > 8) begin
                        state <= WAIT;
                    end
                end
                HIGH_SYNC: begin
                    // exiting the HIGH_SYNC region and re-entering the LOW_SYNC region
                    if (in_ls_range && in_hsc_range) begin
                        state <= LOW_SYNC;
                        hsync_pulse <= 1;
                    // GO BACK: we've been in HIGH_SYNC region for too long or exited both potential regions
                    // end else if (hs_counter > HS_SAMPLES_U) begin
                    end else if (hs_counter > upper_hs) begin
                        state <= WAIT;
                        hsync_pulse <= 0;
                    end
                end
                VIDEO: begin
                    if (in_fp_range) begin
                        state <= FRONT_PORCH;
                    end
                end
                FRONT_PORCH: begin
                    if (in_st_range) begin
                        state <= SYNC_TIP;
                    // GO BACK: we've been in FP for too long, or not in either potential section
                    // end else if (fp_counter > FP_SAMPLES_U) begin
                    end else if (fp_counter > upper_fp) begin
                        state <= WAIT;
                    end
                end
                SYNC_TIP: begin
                    if (in_bp_range) begin
                        state <= BACK_PORCH;
                        hsync_pulse <= 1;
                    // GO BACK: we've been in ST for too long, or not in either potential section
                    // end else if (st_counter > ST_SAMPLES_U) begin
                    end else if (st_counter > upper_st) begin
                        state <= WAIT;
                    end
                end
                BACK_PORCH: begin
                    hsync_pulse <= 0;
                    if (bp_counter > BP_SAMPLES_L && !in_bp_range) begin
                        state <= WAIT;
                        cb_pulse <= 1;
                    end else begin
                        cb_pulse <= 0;
                    end
                end
            endcase
        end
    end
end

// OUTPUT DATA
// m00_axis_tdata = {hsync, colorburst, [14:0] synctip_val, [14:0] colorburst_val}
// always_comb begin
//     if (!s00_axis_aresetn) begin
//         m00_axis_tdata = 0;
//     end else begin

//         case (state)
//             WAIT: m00_axis_tdata = 0;
//             LOW_SYNC: m00_axis_tdata = 0;
//             HIGH_SYNC: m00_axis_tdata = {1'b1, 1'b0, 16'b0};
//             VIDEO: m00_axis_tdata = 0;
//             FRONT_PORCH: m00_axis_tdata = 0;
//             SYNC_TIP: m00_axis_tdata = {1'b1, 1'b0, 16'b0};
//             BACK_PORCH: m00_axis_tdata = {1'b0, 1'b1, magnitude};
//         endcase
//     end
// end

always_comb begin
    if (!s00_axis_aresetn) begin
        hsync = 0;
        colorburst = 0;
        colorburst_val = 0;
    end else begin

        case (state)
            WAIT: begin
                hsync = 0;
                colorburst = 0;
                colorburst_val = 0;
            end
            LOW_SYNC: begin
                hsync = 0;
                colorburst = 0;
                colorburst_val = 0;
            end
            HIGH_SYNC: begin
                hsync = 1;
                colorburst = 0;
                colorburst_val = 0;
            end
            VIDEO: begin
                hsync = 0;
                colorburst = 0;
                colorburst_val = 0;
            end
            FRONT_PORCH:  begin
                hsync = 0;
                colorburst = 0;
                colorburst_val = 0;
            end
            SYNC_TIP: begin
                hsync = 1;
                colorburst = 0;
                colorburst_val = 0;
            end
            BACK_PORCH:  begin
                hsync = 0;
                colorburst = 1;
                colorburst_val = magnitude;
            end
        endcase
    end
end

// AXIS HANDSHAKE STUFF
always_ff @(posedge s00_axis_aclk) begin
    if (!s00_axis_aresetn) begin
        // m00_axis_tstrb = 0;
        m00_axis_tvalid = 0;
        // m00_axis_tlast = 0;
    end else begin
        if (s00_axis_tvalid && s00_axis_tready) begin // input handshake
            m00_axis_tvalid <= 1;
            // m00_axis_tlast <= s00_axis_tlast;
            // m00_axis_tstrb <= s00_axis_tstrb;
        end else if (m00_axis_tvalid && m00_axis_tready) begin // output handshake (data has been transferred)
            m00_axis_tvalid <= 0;
        end
    end
end

endmodule