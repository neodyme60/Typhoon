module full_adder
(
	input logic a,
	input logic b,
	input logic Cin,
	output logic Cout,
	output logic s

);

	always_comb begin
	
	s = a ^ b ^ Cin;
	Cout = (a & b) | (a & Cin) | ( b & Cin);
	
	end
	
endmodule