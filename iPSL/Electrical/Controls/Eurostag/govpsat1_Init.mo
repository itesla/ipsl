within iPSL.Electrical.Controls.Eurostag;
model govpsat1_Init "Initialization model of govern GOVPSAT1"
//GOVPSAT1 GOVPSAT1_1(PMAX=.9500000,PMIN=0.,RD=0.04,T3=5.,T4=0.01,T5=6.,TC=0.2,TS=5.);
//GOVPSAT1 GOVPSAT1_2(PMAX=.9500000,PMIN=-0.5,RD=0.04,T3=5.,T4=0.01,T5=6.,TC=0.2,TS=5.);
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
  Modelica.Blocks.Math.Gain Gain_1 (k = 1); //Eurostag Block number: 1
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_OMREF; //isInitValue
equation
  connect(pin_OMEGA, Gain_1.u);
  connect(pin_OMREF, Gain_1.y);
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
end govpsat1_Init;
