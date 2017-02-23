within iPSL.Electrical.Loads.Eurostag;
model PwLoadwithVariation "Load with a power variation event.
              2014/03/10"
  extends iPSL.Electrical.Essentials.pfComponent;
  iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  parameter Real Po = P_0/S_b "Initial Active Power in p.u.";
  parameter Real Qo = Q_0/S_b "Initial Reactive Power in p.u.";
  parameter Real startTime "Time of Load variation";
  parameter Real P2 "Active load variation in p.u.";
  parameter Real Q2 "Reactive load variation in p.u";
  Real Vo;
  Real P;
  Real Q;
  Real R;
  Real X;
  Real a;
equation
  Vo = V_0;
  if time > startTime then
    P = Po + P2;
    Q = Qo + Q2;
  else
    P = Po;
    Q = Qo;
  end if;
  a = P / Q;
  R = abs(Vo) * abs(Vo) / P * a * a / (1 + a * a);
  X = R / a;
  p.vr = R * p.ir - X * p.ii;
  p.vi = X * p.ir + R * p.ii;
  annotation(Diagram(graphics), Icon(graphics={  Rectangle(extent = {{-60, 60}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-40, 40}, {20, -20}}, lineColor = {0, 0, 255}), Line(points = {{-40, 40}, {20, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-40, -20}, {20, 40}}, color = {0, 0, 255}, smooth = Smooth.None)}), Documentation(info="<html>
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
<td></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>RTE-AIA</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
</tr>
</table>
</HTML>"));
end PwLoadwithVariation;
