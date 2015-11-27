within iPSL.NonElectrical.Nonlinear;
model ImRelay4 "input dependent output"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-54, -40}, {-41, -26}}), iconTransformation(extent = {{-54, -40}, {-41, -26}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-54, 26}, {-41, 40}}), iconTransformation(extent = {{-54, 26}, {-41, 40}})));
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-54, 4}, {-41, 18}}), iconTransformation(extent = {{-54, 2}, {-41, 18}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, 6}, {59, 26}}), iconTransformation(extent = {{39, 6}, {59, 26}})));
  parameter Real E1 "p.u";
  parameter Real E2 "p.u";
  Modelica.Blocks.Interfaces.RealInput p4 annotation(Placement(transformation(extent = {{-54, -18}, {-40, -4}}), iconTransformation(extent = {{-54, -18}, {-42, -4}})));
equation
  n1 = if p1 < E1 then p2 elseif p1 >= E1 and p1 < E2 then p3 else p4;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Line(points = {{-34, 34}, {-14, 34}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-34, 14}, {-14, 14}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-2, 28}, {14, 18}, {34, 18}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-14, 36}, {-10, 32}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-14, 16}, {-10, 12}}, lineColor = {0, 0, 255}), Text(extent = {{-40, -24}, {6, -38}}, lineColor = {0, 0, 255}, textString = "- Input", textStyle = {TextStyle.Bold}), Line(points = {{-34, -10}, {-14, -10}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-14, -8}, {-10, -12}}, lineColor = {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end ImRelay4;
