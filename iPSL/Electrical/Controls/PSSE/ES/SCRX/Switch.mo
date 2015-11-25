within iPSL.Electrical.Controls.PSSE.ES.SCRX;
class Switch "input dependent output"

  Modelica.Blocks.Interfaces.RealInput Et annotation(Placement(transformation(extent = {{-61, 18}, {-41, 38}}), iconTransformation(extent = {{-61, 18}, {-41, 38}})));
  Modelica.Blocks.Interfaces.RealOutput Vd annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  Modelica.Blocks.Interfaces.RealInput VR annotation(Placement(transformation(extent = {{-61, -46}, {-41, -26}}), iconTransformation(extent = {{-61, -38}, {-41, -18}})));
  parameter Real switch;
equation
  Vd = if switch == 0 then Et * VR else VR;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-16, 32}, {-6, 22}}, lineColor = {0, 0, 255}), Line(points = {{-8, 30}, {-14, 24}, {-14, 24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-14, 30}, {-8, 24}, {-8, 24}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-40, 28}, {-16, 28}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-42, -28}, {-28, -28}, {-10, -28}, {-10, 22}, {-10, 6}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-6, 28}, {6, 28}, {6, 4}, {12, 4}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-10, -28}, {6, -28}, {6, 0}, {12, 0}, {12, -2}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{12, 6}, {14, 4}}, lineColor = {0, 0, 255}), Ellipse(extent = {{12, 0}, {14, 2}}, lineColor = {0, 0, 255}), Line(points = {{26, 2}, {32, 2}, {40, 2}, {40, 2}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{18, 6}, {26, 2}, {26, 2}}, color = {0, 0, 255}, smooth = Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end Switch;
