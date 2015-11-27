within iPSL.NonElectrical.Logical;
model IF_comparisor

  Modelica.Blocks.Interfaces.RealInput p annotation(Placement(transformation(extent = {{-84, 4}, {-64, 24}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{48, 44}, {68, 64}})));
  Modelica.Blocks.Interfaces.RealOutput n2 annotation(Placement(transformation(extent = {{48, 10}, {68, 30}}), iconTransformation(extent = {{48, 10}, {68, 30}})));
  parameter Real HighCurrentLimit = 1.5;
  parameter Real MediumCurrentLimit = 1.2;
  parameter Real LowCurrentLimit = 1.1;
  parameter Real LL = 1 - HighCurrentLimit;
  parameter Real ML = 1 - MediumCurrentLimit;
  parameter Real HL = 1 - LowCurrentLimit;
  Modelica.Blocks.Interfaces.RealOutput n3 annotation(Placement(transformation(extent = {{48, -28}, {68, -8}})));
  Modelica.Blocks.Interfaces.RealOutput n4 annotation(Placement(transformation(extent = {{48, -60}, {68, -40}})));
equation
  if p >= HL then
    n1 = 100;
    n2 = 0;
    n3 = 0;
    n4 = 0;
  elseif p >= ML and p < HL then
    n1 = 0;
    n2 = -0.1;
    n3 = 0;
    n4 = 0;
  elseif p >= LL and p < ML then
    n1 = 0;
    n2 = 0;
    n3 = -0.2;
    n4 = 0;
  else
    n1 = 0;
    n2 = 0;
    n3 = 0;
    n4 = -0.5;
  end if;
  connect(n1, n1) annotation(Line(points = {{58, 54}, {58, 54}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-64, 64}, {48, -62}}, lineColor = {0, 0, 255}), Text(extent = {{12, -10}, {56, -44}}, lineColor = {0, 0, 255}, textString = ">"), Text(extent = {{10, 52}, {54, 18}}, lineColor = {0, 0, 255}, textString = "<"), Line(points = {{-60, 14}, {-34, 14}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-14, 38}, {20, 38}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-12, -20}, {22, -20}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-34, 14}, {-18, -8}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-18, -8}, {-14, -12}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-18, 40}, {-14, 36}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-16, -18}, {-12, -22}}, lineColor = {0, 0, 255}), Line(points = {{-12, 16}, {22, 16}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-16, 18}, {-12, 14}}, lineColor = {0, 0, 255}), Line(points = {{-12, -46}, {22, -46}}, color = {0, 0, 255}, smooth = Smooth.None), Ellipse(extent = {{-16, -44}, {-12, -48}}, lineColor = {0, 0, 255})}),
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
end IF_comparisor;
