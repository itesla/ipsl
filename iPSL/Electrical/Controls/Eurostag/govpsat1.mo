within iPSL.Electrical.Controls.Eurostag;
model govpsat1 "Turbine-Governor model GOVPSAT1"
//GOVPSAT1 GOVPSAT1_1(PMAX=.9500000,PMIN=0.,RD=0.04,T3=5.,T4=0.01,T5=6.,TC=0.2,TS=5.);
//GOVPSAT1 GOVPSAT1_2(PMAX=.9500000,PMIN=-0.5,RD=0.04,T3=5.,T4=0.01,T5=6.,TC=0.2,TS=5.);
  parameter Real init_11 = init_CM;
  parameter Real init_8 = init_CM;
  parameter Real init_9 = init_CM;
  parameter Real init_3 = init_CM;
  parameter Real PMAX;
  parameter Real PMIN;
  parameter Real RD;
  parameter Real T3;
  parameter Real T4;
  parameter Real T5;
  parameter Real TC;
  parameter Real TS;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  parameter Real init_OMREF;
  parameter Real init_CM;
  Modelica.Blocks.Math.MultiSum MultiSum_1 (nu = 2, k = {-1, init_OMREF}); //Eurostag Block number: 1
  Modelica.Blocks.Math.MultiSum MultiSum_4 (nu = 2, k = {1.0, 1.0}); //Eurostag Block number: 4
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_11 (K=1.0, T=TS, y_start=init_11, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 11
  Modelica.Blocks.Math.Gain Gain_6 (k=1/RD); //Eurostag Block number: 6
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_8 (K=1, T1=T3, T2=TC, y_start=init_8); //Eurostag Block number: 8
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_9 (K=1, T1=T4, T2=T5, y_start=init_9); //Eurostag Block number: 9
  Modelica.Blocks.Nonlinear.Limiter Limiter_2 (uMax=PMAX, uMin=PMIN); //Eurostag Block number: 2
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_3 (V=init_3); //Eurostag Block number: 3
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_CM; //CM
  Modelica.Blocks.Interfaces.RealOutput pin_At_PREF; //At_CM
equation
  connect(MultiSum_1.y, Gain_6.u);
  connect(Gain_6.y, MultiSum_4.u[2]);
  connect(LeadLag_8.y, LeadLag_9.u);
  connect(MultiSum_4.y, Limiter_2.u);
  connect(Limiter_2.y, SimpleLag_11.u);
  connect(SimpleLag_11.y, LeadLag_8.u);
  connect(ImSetPoint_3.y, MultiSum_4.u[1]);
  connect(pin_OMEGA, MultiSum_1.u[1]);
  connect(pin_CM, LeadLag_9.y);
  connect(pin_At_PREF, ImSetPoint_3.y);
  MultiSum_1.u[2] = 1;
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
end govpsat1;
