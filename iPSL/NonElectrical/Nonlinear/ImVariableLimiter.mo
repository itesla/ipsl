within iPSL.NonElectrical.Nonlinear;
model ImVariableLimiter "Limit the range of a signal with variable limits.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, 20}, {-41, 40}}), iconTransformation(extent = {{-61, 20}, {-41, 40}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-61, -40}, {-41, -20}}), iconTransformation(extent = {{-61, -40}, {-41, -20}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
equation
  n1 = if p2 > p1 then p1 elseif p2 < p3 then p3 else p2;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Line(points = {{-30, -20}, {-10, -20}, {12, 20}, {32, 20}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{20, 30}, {20, 10}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{18, 26}, {20, 30}, {22, 26}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{18, 14}, {20, 10}, {22, 14}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-22, -14}, {-20, -10}, {-18, -14}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-20, -10}, {-20, -30}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points = {{-22, -26}, {-20, -30}, {-18, -26}}, color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5)}), Diagram(graphics),
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
end ImVariableLimiter;
