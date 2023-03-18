`timescale 1ns/1ps
`include "include.v"

module weight_Memory #(parameter numWeight = 3, neuronNo = 5, layerNo = 1, addressWidth = 10, dataWidth = 16, weigthFile = "w_1_15.mif")(

    input clk, //Clock signal
    input wen, //Write enable
    input ren, //Read enable
    input [addressWidth-1 : 0] wadd, //Write address
    input [addressWidth-1 : 0] radd, //Read address
    input [dataWidth-1 : 0] win, //Write in
    input [dataWidth-1 : 0] wout //Write out
 );

    reg [dataWidth-1 : 0] mem [numWeight-1 : 0];

    `ifdef pretrained
        initial begin
        
            $readmemb(weightFile, mem);
        end
    `else
        always @(posedge clk ) begin

            if(wen) begin

                mem[wadd] <= win;
            end
        end
    `endif

    always @(posedge clk ) begin
    
        if(ren) begin
        
            wout <= mem[radd];
        end
    end
endmodule