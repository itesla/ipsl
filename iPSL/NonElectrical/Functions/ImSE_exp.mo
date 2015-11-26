within iPSL.NonElectrical.Functions;
model ImSE_exp "Block for Saturation function of Exc "

  Modelica.Blocks.Interfaces.RealInput  VE_IN "Unsaturated Input" annotation(Placement(transformation(extent = {{-110, -6}, {-100, 4}}), iconTransformation(extent = {{-110, -6}, {-100, 4}})));
  Modelica.Blocks.Interfaces.RealOutput  VE_OUT "Saturated Output"
                                                                  annotation(Placement(transformation(extent = {{100, -2}, {110, 8}}), iconTransformation(extent = {{100, -6}, {110, 4}})));
  parameter Real SE1 "Saturation at E1";
  parameter Real SE2 "Saturation at E2";
  parameter Real E1;
  parameter Real E2;

equation
  VE_OUT = iPSL.NonElectrical.Functions.SE_exp(
    VE_IN,
    SE1,
    SE2,
    E1,
    E2);
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-98, 62}, {100, -68}}, lineColor = {0, 0, 255}), Text(extent = {{-86, 42}, {84, -38}}, lineColor = {0, 0, 255}, textString = "SE(Efd)")}),
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
end ImSE_exp;
