within iPSL.NonElectrical.Continuous;
class ImIntegratorFollower "2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, 20}, {-41, 40}}), iconTransformation(extent = {{-61, 20}, {-41, 40}})));
  Modelica.Blocks.Interfaces.RealInput p2 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealInput p3 annotation(Placement(transformation(extent = {{-61, -40}, {-41, -20}}), iconTransformation(extent = {{-61, -40}, {-41, -20}})));
  Modelica.Blocks.Interfaces.RealOutput n1(start = nStartValue) annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real nStartValue;
  parameter Real K;
  parameter Real T;
equation
  if p1 > 0 then
    der(n1) = K * p2;
  else
    der(n1) = 1 / T * (p3 - n1);
  end if;
  //assert(T == 0, "T must be different of 0");
  annotation(Icon(graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{30, 30}, {20, 20}}, lineColor=  {0, 0, 255}, textString=  "K"), Text(extent=  {{31, 17}, {19, 7}}, lineColor=  {0, 0, 255}, textString=  "S"), Line(points=  {{16, 18}, {36, 18}, {36, 18}}, color=  {0, 0, 255}, smooth=  Smooth.None), Text(extent=  {{30, -12}, {20, -22}}, lineColor=  {0, 0, 255}, textString=  "1"), Text(extent=  {{31, -25}, {19, -35}}, lineColor=  {0, 0, 255}, textString=  "1+Ts"), Line(points=  {{16, -24}, {36, -24}, {36, -24}}, color=  {0, 0, 255}, smooth=  Smooth.None), Text(extent=  {{-36, 6}, {-16, -6}}, lineColor=  {0, 0, 255}, textString=  "K"), Text(extent=  {{-36, -8}, {-16, -20}}, lineColor=  {0, 0, 255}, textString=  "T"), Text(extent=  {{-36, -22}, {-16, -34}}, lineColor=  {0, 0, 255}, textString=  "-/0")}), Diagram(graphics),
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
end ImIntegratorFollower;
