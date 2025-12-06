case (state)
    WAIT: begin
        ls_counter <= 0;
        hs_counter <= 0;
        fp_counter <= 0;
        st_counter <= 0;
        bp_counter <= 0;
    end
    LOW_SYNC: begin
        ls_counter <= ls_counter + 1;
        hs_counter <= 0;
        fp_counter <= 0;
        st_counter <= 0;
        bp_counter <= 0;
    end
    HIGH_SYNC: begin
        ls_counter <= 0;
        hs_counter <= hs_counter + 1;
        fp_counter <= 0;
        st_counter <= 0;
        bp_counter <= 0;
    end
    FRONT_PORCH: begin
        ls_counter <= 0;
        hs_counter <= 0;
        fp_counter <= fp_counter + 1;
        st_counter <= 0;
        bp_counter <= 0;
    end
    SYNC_TIP: begin
        ls_counter <= 0;
        hs_counter <= 0;
        fp_counter <= 0;
        st_counter <= st_counter + 1;
        bp_counter <= 0;
    end
    BACK_PORCH: begin
        ls_counter <= 0;
        hs_counter <= 0;
        fp_counter <= 0;
        st_counter <= 0;
        bp_counter <= bp_counter + 1;
    end
endcase