`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:27:04 01/13/2021
// Design Name:   RegisterFile
// Module Name:   C:/Xilinx/Proyectos/RISCV/RegisterFile_tb.v
// Project Name:  RISCV
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

//Objetivo de la prueba//
// Se realiza un test del bloque Register File para verificar que se logre tanto leer de registros de memoria como escribir un dato en ellos.


//Estímulos//
//Primero se prueba poder leer el registro en la direccion 10
//Luego se intenta escribir el dato "11" en el registro de direccion 10 (teniendo en cuenta que no deberia de hacerlo sin que RegWrite_D este en alto)
//Se verifica el registro con direccion 10 para asegurarse de que no se escribierian los datos
//Se pone la señal RegWrite_D en alto para poder escribir en el registro
//Se verifica si se escribieron los datos en el registro ya que ahora si debio de haberlo hecho
//Se pone la señal RegWrite_D en bajo para dejar de escribir
//Se escribe el dato ¨1111¨ en el registro de direccion 01
//Se verifica que se pueda leer en ambos registros (que ambas salidas tengan los datos que les corresponden)

//Resultados esperados//
//Se espera poder leer los datos de la direccion 10
//Se espera poder escribir en el registro 10 y 01
//Se espera poder leer ambos registros a la vez


module RegisterFile_tb;

	// Inputs
	reg [4:0] ReadRegister1; //Se designan las 6 entradas de las cuales ReadRegister1, ReadRegister2 y WriteRegister son de 5 bits; la entrada Writedata es de 32 bits y las entradas RegWrite_D y Clk son señales logicas
	reg [4:0] ReadRegister2;
	reg [4:0] WriteRegister;
	reg [31:0] Writedata;
	reg RegWrite_D;
	reg Clk;

	// Outputs
	wire [31:0] Readdata1; //Se designan las salidas del modulo que en el caso del RegisterFile ambas son de 32 bits
	wire [31:0] Readdata2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.Writedata(Writedata), 
		.Readdata1(Readdata1), 
		.Readdata2(Readdata2), 
		.RegWrite_D(RegWrite_D), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		ReadRegister1 = 0; //Se inicializan todas las entradas para que al empezar obtengan un valor de 0
		ReadRegister2 = 0;
		WriteRegister = 0;
		Writedata = 0;
		RegWrite_D = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 ReadRegister1 = 10;
		// Primero se prueba poder leer el registro en la direccion 10
		
		#10 Writedata = 11;
		#10 WriteRegister = 10;
		//Luego se intenta escribir el dato "11" en el registro de direccion 10 (teniendo en cuenta que no deberia de hacerlo sin que RegWrite_D este en alto)
	
		#10 ReadRegister1 = 10;
		//Se verifica el registro con direccion 10 para asegurarse de que no se escribierian los datos
		
		#20 RegWrite_D = 1;
		// Se pone la señal RegWrite_D en alto para poder escribir en el registro
		
		#10 ReadRegister1 = 10;
		//Se verifica si se escribieron los datos en el registro ya que ahora si debio de haberlo hecho
		
		#10 RegWrite_D = 0;
		//Se pone la señal RegWrite_D en bajo para dejar de escribir
		
		#10 Writedata = 1111;
		WriteRegister = 01;
		#20 RegWrite_D = 1;
		//Se escribe el dato ¨1111¨ en el registro de direccion 01
		
		#10 ReadRegister1 = 10;
		#10 ReadRegister2 = 01;
		//Se verifica que se pueda leer en ambos registros (que ambas salidas tengan los datos que les corresponden)
		
		#10 RegWrite_D = 0;
		
		//Como todo esto se observa en la simulacion se puede decir que el modulo del register file funciona correctamente
		end
	
	always #10 Clk = ~Clk;
      
endmodule
