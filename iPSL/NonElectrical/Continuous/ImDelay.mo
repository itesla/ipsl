within iPSL.NonElectrical.Continuous;
model ImDelay "Delay block.
              2014/03/10"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  Real x1(start = pStartValue * T ^ 2 / 12);
  Real x2(start = 0);
  parameter Real T "Delay";
  parameter Real T1 = T / 2;
  parameter Real T2 = T * T / 12;
  parameter Real pStartValue = 1 "Input start value";
equation
  // 2nd order Pade approximation of e^(-Ts)
  der(x1) = x2;
  der(x2) = (-12 / T ^ 2 * x1) - 6 / T * x2 + p1;
  n1 = (-12 / T * x2) + p1;
  annotation(Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-20, 26}, {20, 10}}, lineColor = {0, 0, 255}, textString = "Delay", textStyle = {TextStyle.Bold}), Text(extent = {{-18, -6}, {42, -20}}, lineColor = {0, 0, 255},
            horizontalAlignment =                                                                                                   TextAlignment.Left, textString = "e^(-Ts) ", textStyle = {TextStyle.Bold})}), Diagram(graphics),
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
end ImDelay;
