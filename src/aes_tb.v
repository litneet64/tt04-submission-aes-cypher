
`timescale 1ns/1ns

module aes_tb;
    reg ena;
    reg rst_n;
    reg clk;
    reg [7:0] uio_in;
    reg [7:0] ui_in;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    
    
    parameter CP = 20;

    //Two test vectors
    //Simple example
    //CT = 0x69c4e0d86a7b0430d8cdb78070b4c55a
    parameter kin = 128'h000102030405060708090a0b0c0d0e0f;
    parameter din = 128'h00112233445566778899aabbccddeeff;

    //Example in FIPS-197
    //CT = 0x3925841d02dc09fbdc118597196a0b32
    //parameter kin = 128'h2b7e151628aed2a6abf7158809cf4f3c;
    //parameter din = 128'h3243f6a8885a308d313198a2e0370734;

    aes_8_bit test (ui_in, uo_out, uio_in, uio_out, uio_oe, ena, clk, rst_n);

    always # (CP/2)
    begin
        clk = ~ clk;
    end
    
    initial begin
        
        rst_n = 1'b0;
        clk = 1'b1;
        ena= 1;
        
        #CP
        rst_n = 1'b1;
        //uio_in = kin[127:120];
        //ui_in = din[127:120];
        
        
        uio_in = kin[127:120];
        ui_in = din[127:120];

        #CP
        uio_in = kin[119:112];
        ui_in = din[119:112];

        #CP
        uio_in = kin[111:104];
        ui_in = din[111:104];

        #CP
        uio_in = kin[103:96];
        ui_in = din[103:96];

        #CP
        uio_in = kin[95:88];
        ui_in = din[95:88];

        #CP
        uio_in = kin[87:80];
        ui_in = din[87:80];

        #CP
        uio_in = kin[79:72];
        ui_in = din[79:72];

        #CP
        uio_in = kin[71:64];
        ui_in = din[71:64];

        #CP
        uio_in = kin[63:56];
        ui_in = din[63:56];

        #CP
        uio_in = kin[55:48];
        ui_in = din[55:48];

        #CP
        uio_in = kin[47:40];
        ui_in = din[47:40];

        #CP
        uio_in = kin[39:32];
        ui_in = din[39:32];

        #CP
        uio_in = kin[31:24];
        ui_in = din[31:24];

        #CP
        uio_in = kin[23:16];
        ui_in = din[23:16];

        #CP
        uio_in = kin[15:8];
        ui_in = din[15:8];

        #CP
        uio_in = kin[7:0];
        ui_in = din[7:0];/**/

        // ESTE AES ES SIEMPRE DE 128 bits
        // SI SOLO SE LE DA 8 bits, asume que esto se repite 16 veces, sacando una salida en consecuencia
        // Comprobar con: 
        // https://cyberchef.org/#recipe=AES_Encrypt(%7B'option':'Hex','string':'01010101010101010101010101010101'%7D,%7B'option':'Hex','string':''%7D,'ECB','Hex','Hex',%7B'option':'Hex','string':''%7D)&input=MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE

    end
endmodule
