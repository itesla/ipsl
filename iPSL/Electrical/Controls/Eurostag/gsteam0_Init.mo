within iPSL.Electrical.Controls.Eurostag;


model gsteam0_Init "Initialiation model of GSTEAM0 regulator "
//GSTEAM0 GSTEAM0_1(DT=0.,RR=0.05,T1=0.5,T2=3.,T3=10.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_2(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_3(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_4(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_5(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_6(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_7(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_8(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_9(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_10(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_11(DT=0.,RR=0.011,T1=.4900000,T2=2.730000,T3=9.990000,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_12(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_13(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_14(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_15(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_16(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_17(DT=0.,RR=0.011,T1=.4900000,T2=2.730000,T3=9.990000,VMAX=1.,VMIN=.3000000);
//GSTEAM0 GSTEAM0_18(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=0.25);
//GSTEAM0 GSTEAM0_19(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_20(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.,VMAX=1.,VMIN=.2900000);
//GSTEAM0 GSTEAM0_21(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=.2700000);
//GSTEAM0 GSTEAM0_22(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=.3000000);
//GSTEAM0 GSTEAM0_23(DT=.3000000,RR=0.04,T1=.3000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_24(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_25(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_26(DT=.3000000,RR=0.06,T1=0.05,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_27(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_28(DT=.3000000,RR=0.04,T1=.3000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_29(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//GSTEAM0 GSTEAM0_30(DT=.3000000,RR=0.08,T1=0.05,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
  parameter Real DT;
  parameter Real RR;
  parameter Real T1;
  parameter Real T2;
  parameter Real T3;
  parameter Real VMAX;
  parameter Real VMIN;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  Modelica.Blocks.Math.Gain Gain_1( k=RR); //Eurostag Block number: 1
  iPSL.NonElectrical.Eurostag.Math.ImMult5 ImMult5_2( nu= 2, a={1, 1}); //Eurostag Block number: 2
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealInput pin_CM;
  Modelica.Blocks.Interfaces.RealOutput pin_REF; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_PMECH; //isInitValue
equation
  connect(ImMult5_2.y, Gain_1.u);
  connect(pin_OMEGA, ImMult5_2.u[1]);
  connect(pin_CM, ImMult5_2.u[2]);
  connect(pin_REF, Gain_1.y);
  connect(pin_PMECH, ImMult5_2.y);
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
end gsteam0_Init;
