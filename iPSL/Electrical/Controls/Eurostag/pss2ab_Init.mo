within iPSL.Electrical.Controls.Eurostag;
model pss2ab_Init "Initialization model of PSS2AB stabilizer model"
//PSS2AB PSS2AB_1(KS1=12.,KS2=0.208,KS3=1.,M=2.,N=1.,T1=0.22,T2=0.03,T3=.2600000,T4=0.027,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_2(KS1=10.,KS2=0.1538,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_3(KS1=10.,KS2=0.162,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_4(KS1=10.,KS2=0.1666,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_5(KS1=10.,KS2=0.1587,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_6(KS1=10.,KS2=0.2,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_7(KS1=10.,KS2=.1633000,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_8(KS1=10.,KS2=0.1564,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_9(KS1=10.,KS2=0.149,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_10(KS1=10.,KS2=0.1742,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_11(KS1=10.,KS2=0.1804,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
  parameter Real KS1;
  parameter Real KS2;
  parameter Real KS3;
  parameter Real M;
  parameter Real N;
  parameter Real T1;
  parameter Real T2;
  parameter Real T3;
  parameter Real T4;
  parameter Real T7;
  parameter Real TW1;
  parameter Real TW2;
  parameter Real TW3;
  parameter Real VSTMAX;
  parameter Real VSTMIN;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  Modelica.Blocks.Math.Gain Gain_2 (k = 1); //Eurostag Block number: 2
  Modelica.Blocks.Interfaces.RealInput pin_ActivePowerSN;
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_AP; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_IN; //isInitValue
equation
  connect(pin_OMEGA, Gain_2.u);
  connect(pin_AP, pin_ActivePowerSN);
  connect(pin_IN, Gain_2.y);
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
end pss2ab_Init;
