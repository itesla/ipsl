within iPSL.NonElectrical.Continuous;
model ImIntegratorvarnonwindup

  Modelica.Blocks.Interfaces.RealInput p annotation(Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n annotation(Placement(transformation(extent = {{40, -10}, {60, 10}})));
  parameter Real K "Integrator Gain";
  parameter Real initValue "Initialized output value";
  Modelica.Blocks.Interfaces.RealInput max "Max limit" annotation(Placement(transformation(extent = {{5, 54}, {25, 74}})));
  Modelica.Blocks.Interfaces.RealInput min "Min limit" annotation(Placement(transformation(extent = {{-7, -74}, {-27, -54}})));

Real n1;
initial equation
  n = initValue;
equation
  if n > min and n < max then
    der(n) = K * p;
  elseif n <= min and K * p > 0 then
    der(n) = K * p;
  elseif n >= max and K * p < 0 then
    der(n) = K * p;
  else
    der(n) = 0;
  end if;

   if n1 <= min then
    n = min;
  elseif n1 >= max then
    n = max;
  else
    n = n1;
  end if;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-39, 40}, {41, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-7, 18}, {11, 0}}, lineColor = {0, 0, 255}, textString = "K"), Text(extent = {{-7, 0}, {11, -18}}, lineColor = {0, 0, 255}, textString = "s"), Line(points = {{-13, 0}, {19, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Line(points = {{10, 40}, {26, 64}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{26, 64}, {46, 64}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-10, -40}, {-28, -64}}, color = {0, 0, 255}, smooth = Smooth.None), Line(points = {{-28, -64}, {-48, -64}}, color = {0, 0, 255}, smooth = Smooth.None)}),
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
end ImIntegratorvarnonwindup;
