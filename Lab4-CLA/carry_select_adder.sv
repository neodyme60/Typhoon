module carry_select_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a carry select.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  
	logic[4:0] carries;
	logic dummies[2];
	
	CRA_4bit unit_0(A[3:0], B[3:0], carries[0], carries[1], Sum[3:0]);
	
	genvar i;
	generate
	
		for(i = 1; i < 4; i = i+1) begin: genloop
			CSA_unit unit_i(A[i*4+3:i*4], B[i*4+3:i*4], carries[i], Sum[i*4+3:i*4], carries[i+1]);
		end
	endgenerate
	
	always_comb begin
	carries[0] = 1'b0;
	CO = carries[4];
	end
endmodule
