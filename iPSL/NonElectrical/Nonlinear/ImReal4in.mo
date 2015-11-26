within iPSL.NonElectrical.Nonlinear;
model ImReal4in

  Modelica.Blocks.Interfaces.RealInput in1 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {-40, 46})));
  Modelica.Blocks.Interfaces.RealInput in2 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {-14, 46})));
  Modelica.Blocks.Interfaces.RealInput in3 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {14, 46}), iconTransformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {14, 46})));
  Modelica.Blocks.Interfaces.RealInput in4 annotation(Placement(transformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {38, 46}), iconTransformation(extent = {{-5, -6}, {5, 6}}, rotation = -90, origin = {40, 46})));
  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-50, 14}, {-40, 26}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-50, -26}, {-40, -14}})));
  Modelica.Blocks.Interfaces.RealOutput n annotation(Placement(transformation(extent = {{39, -6}, {49, 6}}), iconTransformation(extent = {{39, -6}, {49, 6}})));
equation
  n = if in1 == 0 and in2 == 1 and in3 == 0 and in4 == 0 then p1 else p2;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Line(points=  {{-34, 20}, {-6, 20}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Line(points=  {{-34, -20}, {-6, -20}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Ellipse(extent=  {{-6, 23}, {0, 17}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Ellipse(extent=  {{-6, -17}, {0, -23}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Line(points=  {{0, 16}, {12, 0}, {40, 0}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5)}),
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
end ImReal4in;
