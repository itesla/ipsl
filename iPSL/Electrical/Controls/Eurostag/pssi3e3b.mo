within iPSL.Electrical.Controls.Eurostag;
model pssi3e3b "PSS13E3B stabilizer model"
//PSSI3E3B PSSI3E3B_1(A1=0.359,A2=.5860000,A3=.4290000,A4=.5640000,A5=0.,A6=0.,A7=0.031,A8=0.000001,KS1=-0.602,KS2=30.12000,T1=0.012,T2=0.012,TW1=.3000000,TW2=.3000000,TW3=.6000000,VSTMAX=0.1,VSTMIN=-0.1);
  parameter Real init_3=init_P;
  parameter Real init_2=init_P;
  parameter Real init_15=0;
  parameter Real init_4=0;
  parameter Real init_7=0;
  parameter Real init_10=0;
  parameter Real init_5=0;
  parameter Real init_6=0;
  parameter Real A1;
  parameter Real A2;
  parameter Real A3;
  parameter Real A4;
  parameter Real A5;
  parameter Real A6;
  parameter Real A7;
  parameter Real A8;
  parameter Real KS1;
  parameter Real KS2;
  parameter Real T1;
  parameter Real T2;
  parameter Real TW1;
  parameter Real TW2;
  parameter Real TW3;
  parameter Real VSTMAX;
  parameter Real VSTMIN;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  parameter Real init_P;
  Modelica.Blocks.Continuous.Derivative Derivative_3 (k=KS1*TW1, T=TW1, y_start=0, x_start=init_3, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 3
  Modelica.Blocks.Math.MultiSum MultiSum_16 (nu =2, k={1, -1}); //Eurostag Block number: 16
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_2 (K=1, T=T1, y_start=init_2, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 2
  Modelica.Blocks.Continuous.Derivative Derivative_15 (k=KS2*TW2, T=TW2, y_start=0, x_start=init_15, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 15
  Modelica.Blocks.Math.MultiSum MultiSum_20 (nu =2, k={1, 1}); //Eurostag Block number: 20
  Modelica.Blocks.Continuous.Derivative Derivative_4 (k=TW3, T=TW3, y_start=0, x_start=init_4, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 4
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_7 (K=1, T=T2, y_start=init_7, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 7
  Modelica.Blocks.Nonlinear.Limiter Limiter_10 (uMax=VSTMAX, uMin=VSTMIN); //Eurostag Block number: 10
  Modelica.Blocks.Continuous.TransferFunction TransferFunction_5 (b={A2, A1, 1}, a={A4, A3, 1}, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 5
  Modelica.Blocks.Continuous.TransferFunction TransferFunction_6 (b={A6, A5, 1}, a={A8, A7, 1}, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 6
  Modelica.Blocks.Math.MultiSum MultiSum_8 (nu =2, k={1, 1}); //Eurostag Block number: 8
  Modelica.Blocks.Interfaces.RealInput pin_ActivePowerSN;
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_VS;//Start = 0
equation
  connect(MultiSum_20.y, Derivative_4.u);
  connect(Derivative_4.y, TransferFunction_5.u);
  connect(Derivative_3.y, MultiSum_20.u[1]);
  connect(Derivative_15.y, MultiSum_20.u[2]);
  connect(SimpleLag_2.y, Derivative_3.u);
  connect(SimpleLag_7.y, Derivative_15.u);
  connect(MultiSum_8.y, Limiter_10.u);
  connect(TransferFunction_5.y, TransferFunction_6.u);
  connect(TransferFunction_6.y, MultiSum_8.u[2]);
  connect(pin_ActivePowerSN, SimpleLag_2.u);
  connect(MultiSum_16.y, SimpleLag_7.u);
  connect(pin_OMEGA, MultiSum_16.u[1]);
  connect(pin_VS, Limiter_10.y);
  MultiSum_16.u[2] =1;
  MultiSum_8.u[1] = 0;
  annotation(Documentation(info="<HTML>
   <table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
   <td align=center  width=50%><p>Development level</p></td>
   <td align=center width=25% bgcolor= #00FF00><p> 4 </p></td>
   </tr> 
   </table> 
   <p></p>  
	<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
	<tr>
	<td><p>Reference</p></td>
	<td></td>
	</tr>
	<tr>
	<td><p>Last update</p></td>
	<td>Unknown</td>
	</tr>
	<tr>
	<td><p>Author</p></td>
	<td><p>AIA</p></td>
	</tr>
	<tr>
	<td><p>Contact</p></td>
	<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
	</tr>
	</table>
	<p> 
	</p>
	</HTML>")); 
end pssi3e3b;
