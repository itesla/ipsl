within iPSL.Electrical.Loads.Eurostag;
model PwLoadVDepwithVariation
  "Load with voltage dependence.Developed by AIA. 2014/03/10"
 extends iPSL.Electrical.Essentials.pfComponent;
 inner iPSL.Electrical.SystemBase SysData;
  iPSL.Connectors.PwPin p(vr(start=Vo_real),  vi(start=Vo_img),  ir(start=1), ii(start=0)) annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  parameter Real Vo_real = V_0*cos(angle_0*Modelica.Constants.pi/180)
    "Initial voltage at node in p.u. (Real part)";
  parameter Real Vo_img = V_0*sin(angle_0*Modelica.Constants.pi/180)
    "Initial voltage at node in p.u. (Imaginary part)";
  parameter Real startTime= 999 "Time of Load variation";
  parameter Real P_1 = 0 "New Active reference power";
  parameter Real Q_1 = 0 "New Reactive reference power";
  parameter Real vo = sqrt(Vo_real ^ 2 + Vo_img ^ 2);
  Real v(start = vo);
  Real a(start = 1) "auxiliary variable. Voltage division";
  parameter Real alpha = 0;
  parameter Real beta = 0;
  Real P(start = P_0/S_b);
  Real Q(start = Q_0/S_b);

equation
  a = v / vo;
  if time > startTime then
 (P_1/S_b) * a ^ alpha = p.vr * p.ir + p.vi * p.ii;
 (Q_1/S_b)* a ^ beta = (-p.vr * p.ii) + p.vi * p.ir;
  else
 (P_0/S_b) * a ^ alpha = p.vr * p.ir + p.vi * p.ii;
 (Q_0/S_b)* a ^ beta = (-p.vr * p.ii) + p.vi * p.ir;
  end if;

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
          smooth=Smooth.None)}),
    Documentation( Documentation(info="<HTML>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag</td>
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
This model is a load voltage dependence in witch it allow a variation of the Load P,Q.
</p>

</HTML>")));
end PwLoadVDepwithVariation;
