within iPSL.NonElectrical.Nonlinear;
model ImRelaySCRX "input dependent output"

  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-61, 10}, {-41, 30}}), iconTransformation(extent = {{-61, 10}, {-41, 30}})));
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-61, -28}, {-41, -8}}), iconTransformation(extent = {{-61, -28}, {-41, -8}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real switch;
equation
  n1 = if switch == 0 then p2 else p3;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Line(points = {{-32, 20}, {-12, 20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-32, -20}, {-12, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-2, 8}, {14, -2}, {34, -2}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-12, 22}, {-8, 18}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-12, -18}, {-8, -22}}, lineColor = {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end ImRelaySCRX;
