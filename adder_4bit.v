// A 4-bit ripple carry adder module
module adder_4bit (
    input [3:0] a,      // 4-bit input A
    input [3:0] b,      // 4-bit input B
    input cin,          // Carry-in
    output [3:0] sum,   // 4-bit sum output
    output cout         // Carry-out
);

    // Internal carry signals for the full adders
    wire c1, c2, c3;

    // Instantiate 4 full adders (or use a behavioral description)
    // Using a behavioral description for the 4-bit addition
    assign {cout, sum} = a + b + cin;

endmodule