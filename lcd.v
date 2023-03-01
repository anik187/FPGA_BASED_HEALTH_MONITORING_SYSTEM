module lcd(clk, lcd_rs,lcd_rw,lcd_en, lcd_data,data_inc);
	input clk;
	input [9:0] data_inc;
	
	//input done;
	output lcd_rs, lcd_rw,lcd_en, lcd_data;
	reg [7:0] lcd_data;
	reg lcd_rs,lcd_en;
	wire lcd_rw;
	assign lcd_rw = 1'b0;
	
	//integer data_int = data_inc;
	//integer data_temp; 
	reg [7:0] data [15:0];
//	initial begin
	
//	 end
//	assign data[0] = 8'h38;
//	  assign data[1] = 8'h0C;
//	  assign data[2] = 8'h06;
//      assign data[3] = 8'h01;
//	  assign data[4] = 8'h80;
//	  assign data[5] = "T";
//	 assign data[6] = "e";
//	 assign data[7] = "m";
//	 assign data[8] = "p";
//	 assign data[9] = ":";
//	 assign data[10] = " ";
//	  assign data[11] = "1";
//	  assign data[12] = "0";
//	
//	assign data[13] = 8'hC0;
//	assign data[14] = "D";
//	assign data[15] = "D";
	//assign data[16] = "D";
	//assign data[17] = "2";
	//assign data[18] = "7";
	//assign data[19] = ".";
	//assign data[20] = "0";
	//assign data[21] = 
	//assign data[22] = " ";
	//assign data[23] = " ";
	//assign data[24] = " ";
	//assign data[25] = " ";
	//assign data[26] = "F";
	//assign data[27] = "A";
	//assign data[28] = "Y";
	//assign data[29] = "S";
	//assign data[30] = "A";
	//assign data[31] = "L";
	
	//reg [7:0] digit = 8'h0;
	//reg [7:0] digit1 = 8'h0;
	//integer last_d = 0;
	//integer tenth = 0;
	reg [3:0] addr = 4'b0000;
	
	reg[10:0] count1 = 0;
	//reg [3:0] state = 4'b0000;
//	initial begin
//	data[11] = "0";
//	 data[12] = "3";
//	 end
	always@(posedge clk)
	begin
		//data_temp = data_inc*9'd500/11'd1024;
		data[0] = 8'h38;
	   data[1] = 8'h0C;
	  data[2] = 8'h06;
       data[3] = 8'h01;
	   data[4] = 8'h80;
	   data[5] = "T";
	  data[6] = "e";
	  data[7] = "m";
	  data[8] = "p";
	  data[9] = ":";
	  data[10] = " ";
	  //assign data[11] = "0";
	  //assign data[12] = "0";
	 data[11] = "2";
	 data[12] = "8";
	 data[13] = 8'hC0;
	 data[14] = "B";
	 data[15] = "P";
	 //data_inc = data_inc>>1;
			//if(done)
//			begin
//	 		case((data_inc>>1)%10)
//			0: data[12] <= "0";
//			1: data[12] <= "1";
//			2: data[12] <= "2";
//			3: data[12] <= "3";
//			4: data[12] <= "4";
//			5: data[12] <= "5";
//			6: data[12] <= "6";
//			7: data[12] <= "7";
//			8: data[12] <= "8";
//			9: data[12] <= "9";
//			//default: digit <= "0";	
//			endcase
//			end
//			//if(done)
//			begin
//			case(((data_inc>>1)/10))
//			0: data[11]  <= "0";
//			1: data[11]  <= "1";
//			2: data[11]  <= "2";
//			3: data[11]  <= "3";
//			4: data[11]  <= "4";
//			5: data[11]  <= "5";
//			6: data[11]  <= "6";
//			7: data[11]  <= "7";
//			8: data[11]  <= "8";
//			9: data[11]  <= "9";
//			//default: digit1 <= "0";	
//			endcase
//			end
	end
	
	
//	always@(posedge clk)
//	begin
//		//if(done)
//		//begin
//		last_d = data_temp % 10;

//		//end
//		data[12] <= digit;
//	end
	
//	
//	always@(posedge clk)
//	begin
//		//if(done)
//		//begin
//		tenth = data_temp / 10;
//		case(tenth)
//			0: digit1 <= "0";
//			1: digit1 <= "1";
//			2: digit1 <= "2";
//			3: digit1 <= "3";
//			4: digit1 <= "4";
//			5: digit1 <= "5";
//			6: digit1 <= "6";
//			7: digit1 <= "7";
//			8: digit1 <= "8";
//			9: digit1 <= "9";
//			//default: digit1 <= "0";	
//		endcase
//		//end
//		data[11] <= digit1;
//	end
	
	
	
	always@(posedge clk)
	begin
		
			//lcd_rw = 1'b0;
			count1 <= count1 + 1;
			//if(addr == 4'b1101) addr <= 4'b0000;
			if (count1 <= 989)
			begin
			lcd_en <= 1;
			lcd_data <= data[addr];
			end
			
			else if ((count1 > 989) & (count1 < 1978))
			begin
			lcd_en <= 0;
			end
			
			else if (count1 == 1978)
			begin
			count1 <= 0;
			addr <= addr + 4'b0001;
			end
			
			if(addr < 4'b0101 | addr == 4'b1101) lcd_rs <= 0;
			else lcd_rs <= 1;
			
			//if (addr == 3'b111) addr <= 3'b000;		
	end
	
endmodule
	