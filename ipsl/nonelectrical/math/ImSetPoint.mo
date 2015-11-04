within iPSL.NonElectrical.Math;
class ImSetPoint "Generate constant signal of type Real.
              2014/03/10"
  parameter Real V;
  parameter Boolean setPointWithModification = false;
  parameter Real t1 = 0;
  parameter Real V_t1 = 0;
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{-61, 10}, {-41, 30}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
equation
  if setPointWithModification then
    if time < t1 then
      n1 = V;
    else
      n1 = V_t1;
    end if;
  else
    n1 = V;
  end if;
  annotation(Icon(graphics={  Rectangle(extent=  {{-60, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{-32, 20}, {10, -6}}, lineColor=  {0, 0, 255}, textString=  "Set", textStyle=  {TextStyle.Bold}), Line(points=  {{-40, -20}, {20, -20}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{14, -14}, {20, -20}, {14, -26}}, color=  {0, 0, 255}, smooth=  Smooth.None)}), Diagram(graphics),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ImSetPoint;
