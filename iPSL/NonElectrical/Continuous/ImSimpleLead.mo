within iPSL.NonElectrical.Continuous;
class ImSimpleLead "First order transfer function block (= 1 pole)"

  Modelica.Blocks.Interfaces.RealOutput p1 "output" annotation(Placement(transformation(extent = {{53, -10}, {73, 10}}), iconTransformation(extent = {{55, -8}, {62, 4}})));
  Modelica.Blocks.Interfaces.RealInput n1 "input" annotation(Placement(transformation(extent = {{-63, -12}, {-43, 8}}), iconTransformation(extent = {{-21, -12}, {-12, 4}})));
  parameter Real K "Gain";
  parameter Real T "Lead time constant";
  //   parameter Real nStartValue "output start value";
  // initial equation
  //   p1=nStartValue;
equation
  T * der(n1) = K * p1 - n1;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-20, 40}, {60, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{10, -4}, {28, -22}}, lineColor=  {0, 0, 255}, textString=  "K"), Text(extent=  {{0, 26}, {38, -6}}, lineColor=  {0, 0, 255}, textString=  "1 + Ts"), Line(points=  {{4, 0}, {36, 0}}, color=  {0, 0, 255}, smooth=  Smooth.Bezier, thickness=  0.5)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics),
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
end ImSimpleLead;
