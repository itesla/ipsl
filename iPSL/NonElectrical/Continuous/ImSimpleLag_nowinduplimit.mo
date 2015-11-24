within iPSL.NonElectrical.Continuous;
model ImSimpleLag_nowinduplimit "Simple Lag with limited value of the output"

  input Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  output Modelica.Blocks.Interfaces.RealOutput n0 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real Ymin "Min limit";
  parameter Real Ymax "Max limit";
  parameter Real K "Gain";
  parameter Real T "Lag Time Constant";
  parameter Real nStartValue "Output start value";
initial equation
  n0 = nStartValue;
equation
  if not (T == 0) then
  if n0 > Ymin and n0 < Ymax then
      der(n0) = (-1 * n0 / T) + K * p1 / T;
  elseif n0 <= Ymin and K * p1 / T - n0 / T > 0 then
      der(n0) = (-1 * n0 / T) + K * p1 / T;
  elseif n0 >= Ymax and K * p1 / T - n0 / T < 0 then
      der(n0) = (-1 * n0 / T) + K * p1 / T;
  else
      der(n0) = 0;
    end if;
  elseif K*p1 <= Ymin then
    n0 = Ymin;
  elseif K*p1 >= Ymax then
    n0 = Ymax;
  else
     n0 = K*p1;
  end if;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-28, 14}, {-20, 0}}, lineColor = {0, 0, 255}, textString = "K", textStyle = {TextStyle.Bold}), Text(extent = {{-38, 0}, {-6, -12}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "1+Ts"), Line(points = {{-32, 0}, {-14, 0}}, color = {0, 0, 255}, smooth = Smooth.Bezier), Line(points = {{-12, -20}, {0, -20}, {10, 20}, {24, 20}}, color = {0, 0, 255}, smooth = Smooth.None)}), Diagram(graphics),
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
end ImSimpleLag_nowinduplimit;
