within iPSL.Electrical.Loads.Eurostag;
model PwLoadVoltFreqDependence
  "Load with voltage and frequency dependence.Developed by AIA. 2016/12/10"
  extends iPSL.Electrical.Essentials.pfComponent; 
  iPSL.Connectors.PwPin p(vr(start=Vo_real),  vi(start=Vo_img)) annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  Modelica.Blocks.Interfaces.RealInput omegaRef;
  parameter Real Vo_real = V_0*cos(angle_0*Modelica.Constants.pi/180)
    "Initial voltage at node in p.u. (Real part)";
  parameter Real Vo_img = V_0*sin(angle_0*Modelica.Constants.pi/180)
    "Initial voltage at node in p.u. (Imaginary part)";
  parameter Real vo = sqrt(Vo_real ^ 2 + Vo_img ^ 2);
  parameter Real omega0 = 1;
  Real v(start = vo);
  Real a(start = 1) "auxiliary variable. Voltage division";
  Real b(start = 1) "auxiliary variable. Frequency division";
  parameter Real omega_0 = 1; 
  parameter Real alpha = 0;
  parameter Real beta = 0;
  parameter Real delta = 0;
  parameter Real gamma = 0;
  Real P(start = P_0/S_b);
  Real Q(start = Q_0/S_b);
initial equation
   (P_0/S_b) = p.vr * p.ir + p.vi * p.ii;
   (Q_0/S_b)  = (-p.vr * p.ii) + p.vi * p.ir;
equation
  a = v / vo;
  b = omegaRef/omega_0;
  (P_0/S_b) * (a ^ alpha) * (b ^ gamma) = p.vr * p.ir + p.vi * p.ii;
  (Q_0/S_b)* (a ^ beta) * (b ^ delta)  = (-p.vr * p.ii) + p.vi * p.ir;
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  P = p.vr * p.ir + p.vi * p.ii;
  Q = (-p.vr * p.ii) + p.vi * p.ir;
  annotation (
    Placement(transformation(extent={{-56,-10},{-36,10}}), iconTransformation(extent={{-80,0},{-60,20}})),
    Diagram(graphics),
    Icon(graphics={Rectangle(extent={{-60,60},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-40,40},{20,-20}}, lineColor={0,0,255}),Line(
          points={{-40,40},{20,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,-20},{20,40}},
          color={0,0,255},
          smooth=Smooth.None)}), Documentation(info="<HTML>
   <table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
   <td align=center  width=50%><p>Development level</p></td>
   <td align=center width=25% bgcolor= #00FF00><p> 4 </p></td>
   </tr> 
   </table> 
   <p></p>  
	<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
	<tr>
	<td><p>Reference</p></td>
	<td>Eurostag/User's Manual</td>
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
end PwLoadVoltFreqDependence;
