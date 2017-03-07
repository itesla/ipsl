within iPSL.Electrical.Loads.Eurostag;
class PwLoadPQ "Constant Power load defined by active power P and reactive power Q.
              2013"

  iPSL.Connectors.PwPin p(vr(start= Vo_real), vi(start= Vo_img), ir(start=1), ii(start=0))   annotation(Placement(transformation(extent = {{-56, -10}, {-36, 10}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  parameter Real P "Active Power p.u.";
  parameter Real Q "Reactive Power in p.u.";
  parameter Real V_0=1 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real angle_0=0 "Voltage angle (deg)" annotation (Dialog(group="Power flow data"));
  parameter Real Vo_real = V_0 * cos(angle_0 * Modelica.Constants.pi / 180) "Initial voltage at node in p.u. (Real part)";
  parameter Real Vo_img = V_0 * sin(angle_0 * Modelica.Constants.pi / 180) "Initial voltage at node in p.u. (Imaginary part)";
  Complex V(re = p.vr, im = p.vi);
  Complex I(re = p.ir, im = p.ii);
  protected
  parameter Complex S(re = P, im = Q); 
equation
   I =  S/V
   
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
<td>Eurostag/Model Editor User's Manual</td>
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
end PwLoadPQ;
