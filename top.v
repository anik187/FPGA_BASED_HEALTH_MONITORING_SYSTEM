module top(clk,adc_out,adc_in,conv,clk_out,lcd_rs,lcd_rw,lcd_en, lcd_data,dataOut);
	input clk;
	input wire adc_out;
	//reg adc_out;
	output wire clk_out;
	output wire adc_in;
	output reg[9:0] dataOut;
	wire [9:0] data_out;
	wire done;
	output wire conv;
	//output reg [9:0] dataOut;
	output wire lcd_rs,lcd_en;
	output wire lcd_rw;
	output wire [7:0] lcd_data;
	Clock_divider clk1(.clock_in(clk),.clock_out(clk_out));
	adc adcAnik(.clk(clk_out),.conv(conv), .done(done), .ADC_in(adc_in), .ADC_out(adc_out), .data_out(data_out));
	lcd LCD(.clk(clk_out), .lcd_rs(lcd_rs),.lcd_rw(lcd_rw),.lcd_en(lcd_en),.lcd_data(lcd_data),.data_inc(data_out));
	//assign adcOut = adc_out;
	always@(posedge clk)
	begin
	if(done) dataOut <= data_out;
	end
endmodule
