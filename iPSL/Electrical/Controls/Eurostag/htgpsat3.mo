within iPSL.Electrical.Controls.Eurostag;
model htgpsat3
//HTGPSAT3 HTGPSAT3_1(A11=0.5,A13=1.,A21=1.5,A23=1.,DELTA=.3000000,PMAX=1.,PMIN=0.,SIGMA=0.04,TG=0.2,TP=0.04,TR=5.,TW=1.,UC=-0.1,UO=0.1);
  parameter Real init_2=0.;
  parameter Real init_7=0;
  parameter Real init_8=init_CM;
  parameter Real init_5=0;
  parameter Real init_12=init_PREF;
  parameter Real A11;
  parameter Real A13;
  parameter Real A21;
  parameter Real A23;
  parameter Real DELTA;
  parameter Real PMAX;
  parameter Real PMIN;
  parameter Real SIGMA;
  parameter Real TG;
  parameter Real TP;
  parameter Real TR;
  parameter Real TW;
  parameter Real UC;
  parameter Real UO;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  parameter Real init_T1;
  parameter Real init_OMEGREF;
  parameter Real init_CM;
  parameter Real init_PREF;
  Modelica.Blocks.Math.MultiSum MultiSum_1 (nu =2, k={1., -1.}); //Eurostag Block number: 1
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_2 (K=1/TG, T=TP, y_start=init_2, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 2
  Modelica.Blocks.Nonlinear.Limiter Limiter_3 (uMax=UO, uMin=UC); //Eurostag Block number: 3
  Modelica.Blocks.Math.Gain Gain_6 (k=SIGMA); //Eurostag Block number: 6
  Modelica.Blocks.Continuous.Derivative Derivative_7 (k=DELTA*TR, T=TR, y_start=0, x_start=init_7, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 7
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_8 (K=A23, T1=init_T1, T2=A11*TW, y_start=init_8); //Eurostag Block number: 8
  Modelica.Blocks.Math.MultiSum MultiSum_9 (nu =2, k={1., 1.}); //Eurostag Block number: 9
  Modelica.Blocks.Math.MultiSum MultiSum_10 (nu =2, k={-1., init_OMEGREF}); //Eurostag Block number: 10
  Modelica.Blocks.Continuous.Integrator Integrator_5 (k=1, y_start=init_5); //Eurostag Block number: 5
  Modelica.Blocks.Math.MultiSum MultiSum_4 (nu =2, k={1, 1}); //Eurostag Block number: 4
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_12 (V=init_12); //Eurostag Block number: 12
  Modelica.Blocks.Math.MultiSum MultiSum_14 (nu =2, k={-1, PMIN}); //Eurostag Block number: 14
  Modelica.Blocks.Math.MultiSum MultiSum_15 (nu =2, k={-1, PMAX}); //Eurostag Block number: 15
  Modelica.Blocks.Math.MinMax Max_11 (nu = 2); //Eurostag Block number: 11
  Modelica.Blocks.Math.MinMax Min_13 (nu = 2); //Eurostag Block number: 13
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_CM; //CM
  Modelica.Blocks.Interfaces.RealOutput pin_At_PREF;
  Modelica.Blocks.Interfaces.RealOutput pin_At_DGMIN;
  Modelica.Blocks.Interfaces.RealOutput pin_At_DGMAX;
  Modelica.Blocks.Interfaces.RealOutput pin_At_DG;
  iPSL.Interfaces.AddedConnector setPointModification_12;
equation
  connect(Gain_6.y, MultiSum_9.u[1]);
  connect(Derivative_7.y, MultiSum_9.u[2]);
  connect(MultiSum_1.y, SimpleLag_2.u);
  connect(MultiSum_10.y, MultiSum_1.u[1]);
  connect(MultiSum_9.y, MultiSum_1.u[2]);
  connect(SimpleLag_2.y, Limiter_3.u);
  connect(Limiter_3.y, Integrator_5.u);
  connect(MultiSum_14.y, Max_11.u[1]);
  connect(Integrator_5.y, Max_11.u[2]);
  connect(MultiSum_15.y, Min_13.u[1]);
  connect(Max_11.yMax, Min_13.u[2]);
  connect(Min_13.yMin, MultiSum_4.u[2]);
  connect(ImSetPoint_12.y, MultiSum_4.u[1]);
  connect(ImSetPoint_12.setPointModification, setPointModification_12); 
  connect(Min_13.yMin, Gain_6.u);
  connect(Min_13.yMin, Derivative_7.u);
  connect(MultiSum_4.y, LeadLag_8.u);
  connect(pin_OMEGA, MultiSum_10.u[1]);
  connect(pin_At_PREF, MultiSum_14.u[1]);
  connect(pin_At_PREF, MultiSum_15.u[1]);
  connect(pin_CM, LeadLag_8.y);
  connect(pin_At_PREF, ImSetPoint_12.y);
  connect(pin_At_DGMIN, MultiSum_14.y);
  connect(pin_At_DGMAX, MultiSum_15.y);
  connect(pin_At_DG, Min_13.yMin);
  MultiSum_10.u[2] =1;
  MultiSum_14.u[2] =1;
  MultiSum_15.u[2] =1;
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
end htgpsat3;
