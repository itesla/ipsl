within iPSL.Electrical.Controls.Eurostag;
model cmconst
	parameter Real init_CM = -0.01818525272777948;
	parameter Real  SN;
	parameter Real  PN;
	parameter Real PNALT;  
	Modelica.Blocks.Sources.Constant CM_Cosntant(k = init_CM);
	Modelica.Blocks.Interfaces.RealOutput pin_CM;
	
equation
	connect(CM_Cosntant.y, pin_CM);
end cmconst;
