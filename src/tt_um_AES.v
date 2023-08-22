module tt_um_AES(input wire ena,
            input wire clk,
            input wire rst_n,
            input wire [7:0] ui_in,
            input wire [7:0] uio_in,
            output wire [7:0] uo_out,
            output wire [7:0] uio_out,
            output wire [7:0] uio_oe
            );

wire [127:0] in;

// The plain text used as input
wire[119:0] fixed_in = 120'h_00112233445566778899aabbccddee;
assign in = {fixed_in, ui_in[7:0]};

// The different keys used for testing (one of each type)
wire[127:0] key128 = 128'h_000102030405060708090a0b0c0d0e0f;

// The result of the encryption module for every type
wire[127:0] encrypted128;
wire[127:0] decrypted128;

AES_Encrypt a(in,key128,.out(encrypted128));
AES_Decrypt a2(encrypted128,key128,.out(decrypted128));

assign uo_out[7:0] = encrypted128[127:120];

endmodule