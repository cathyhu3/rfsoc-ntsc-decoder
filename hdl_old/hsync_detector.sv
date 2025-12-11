/*
two types of hsync:
1. long hsync period after new frame (low sync, high sync, low sync)
2. singular hsync period before each new line (front porch, sync tip, back porch)
*/

module hsync_detector #(
    parameter integer MAG_WIDTH = 16
)
(
    input wire clk,
    input wire resetn,
    input wire valid_in,
    input wire [MAG_WIDTH-1:0] magnitude,

    output logic valid_out,
    output logic hsync,
    output logic colorburst,
    output logic [MAG_WIDTH-1:0] colorburst_val
);


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

// making sure transition from one state to another is valid by magnitude value
always_comb begin
    in_ls_range = (magnitude > LOWER_LS && magnitude < UPPER_LS);
    in_hs_range = (magnitude > LOWER_HS && magnitude < UPPER_HS);
    in_fp_range = (magnitude > LOWER_FP && magnitude < UPPER_FP);
    in_st_range = (magnitude > LOWER_ST && magnitude < UPPER_ST);
    in_bp_range = (magnitude > LOWER_BP && magnitude < UPPER_BP);
    in_vd_range = (magnitude > LOWER_VD && magnitude < UPPER_VD);
    in_eq_range = (magnitude > LOWER_EQ && magnitude < UPPER_EQ);
end

// making sure transition from one state to another is valid by sample count
always_comb begin
    in_lsc_range = (ls_counter > LS_SAMPLES_L && ls_counter < LS_SAMPLES_U);
    in_hsc_range = (hs_counter > HS_SAMPLES_L && hs_counter < HS_SAMPLES_U);
    in_fpc_range = (fp_counter > FP_SAMPLES_L && fp_counter < FP_SAMPLES_U);
    in_stc_range = (st_counter > ST_SAMPLES_L && st_counter < ST_SAMPLES_U);
    in_bpc_range = (bp_counter > BP_SAMPLES_L && bp_counter < BP_SAMPLES_U);
end

always_ff @(posedge clk) begin
    if (!resetn) begin
        ls_counter <= 0;
        hs_counter <= 0;
        fp_counter <= 0;
        st_counter <= 0;
        bp_counter <= 0;
        eq_counter <= 0;
    end else begin
        if (valid_in) begin
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
always_ff @(posedge clk) begin
    if (!resetn) begin
        state <= WAIT;
    end else begin
        if (valid_in) begin
            valid_out <= 1;
            case (state)
                WAIT: begin
                    if (in_vd_range) begin // hsync type 2
                        state <= VIDEO;
                    end else if (in_ls_range) begin // hysnc type 1
                        state <= LOW_SYNC;
                    end
                end
                LOW_SYNC: begin
                    // if we've entered the HIGH_SYNC region in a reasonable amt of time
                    if (in_hs_range && in_lsc_range) begin
                        state <= HIGH_SYNC;
                    // GO BACK: if we've been in the LOW_SYNC or EQUILIZER region for too long
                    end else if (ls_counter > LS_SAMPLES_U || eq_counter > 8) begin
                        state <= WAIT;
                    end
                end
                HIGH_SYNC: begin
                    // exiting the HIGH_SYNC region and re-entering the LOW_SYNC region
                    if (in_ls_range && in_hsc_range) begin
                        state <= LOW_SYNC;
                    // GO BACK: we've been in HIGH_SYNC region for too long or exited both potential regions
                    end else if (hs_counter > HS_SAMPLES_U) begin
                        state <= WAIT;
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
                    end else if (fp_counter > FP_SAMPLES_U) begin
                        state <= WAIT;
                    end
                end
                SYNC_TIP: begin
                    if (in_bp_range) begin
                        state <= BACK_PORCH;
                    // GO BACK: we've been in ST for too long, or not in either potential section
                    end else if (st_counter > ST_SAMPLES_U) begin
                        state <= WAIT;
                    end
                end
                BACK_PORCH: begin
                    if (bp_counter > BP_SAMPLES_L && !in_bp_range) begin
                        state <= WAIT;
                    end
                end
            endcase
        end else begin
            valid_out <= 0;
        end
    end
end

// OUTPUT DATA
// m00_axis_tdata = {hsync, colorburst, [14:0] synctip_val, [14:0] colorburst_val}
always_comb begin
    if (!resetn) begin
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

endmodule