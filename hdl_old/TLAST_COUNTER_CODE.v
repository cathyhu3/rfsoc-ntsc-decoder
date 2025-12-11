// ADD THIS TO TOP.V WRAPPER IN IP MODULE
// Add user logic here
    reg tlast_reg;
    assign m00_axis_tlast = tlast_reg;
                            
    reg [18:0] count;
    wire [18:0] curr_count;
    assign curr_count = 19'd262143  // 2^18 - 1
    
    
    assign s00_axis_tready = 1;
    assign m00_axis_tvalid = s00_axis_tvalid;
    
    
    always @(posedge s00_axis_aclk)begin
       if (s00_axis_aresetn==0)begin
           count <= 0;
           tlast_reg <= 0;
       end else begin
           tlast_reg <= 0;
           if (m00_axis_tvalid) begin
               if (count == (curr_count - 1)) begin
                   tlast_reg <= 1;
                   count <= count + 1;
               end else if (count == curr_count) begin
                   count <= 0;
               end else begin
                   count <= count + 1;
               end
           end
       end
    end
