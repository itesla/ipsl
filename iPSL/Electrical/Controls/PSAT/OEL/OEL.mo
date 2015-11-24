within iPSL.Electrical.Controls.PSAT.OEL;
model OEL "PSAT Over Excitation Limiter"

  Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage (pu)"
                                                               annotation(Placement(transformation(extent = {{-90, 68}, {-70, 88}}), iconTransformation(extent = {{-90, 66}, {-62, 98}})));
  Modelica.Blocks.Interfaces.RealInput p "Active power (pu)"
                                                  annotation(Placement(transformation(extent = {{-90, 36}, {-70, 56}}), iconTransformation(extent = {{-90, 32}, {-62, 62}})));
  Modelica.Blocks.Interfaces.RealInput q "Reactive power (pu)"
                                                   annotation(Placement(transformation(extent = {{-90, 4}, {-70, 24}}), iconTransformation(extent = {{-90, -6}, {-62, 24}})));
  FieldCurrent field_current(xd = xd, xq = xq) annotation(Placement(transformation(extent = {{-62, 32}, {-26, 66}})));
  iPSL.NonElectrical.Math.ImSetPoint iflimitation(V=iflim)
    annotation (Placement(transformation(extent={{-58,14},{-30,36}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-28,38},{-8,58}})));
  Switch switch annotation(Placement(transformation(extent = {{8, 22}, {64, 72}})));
  iPSL.NonElectrical.Math.ImSetPoint set(V=0)
    annotation (Placement(transformation(extent={{-18,26},{10,48}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup imLimitedIntegrator(
    Ymin=0,
    nStartValue=0,
    Ymax=vOELmax,
    K=1/T0) annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  Modelica.Blocks.Interfaces.RealInput vref0 annotation(Placement(transformation(extent = {{-90, -24}, {-70, -4}}), iconTransformation(extent = {{-90, -44}, {-60, -16}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{40,36},{60,56}})));
  Modelica.Blocks.Interfaces.RealOutput vref annotation(Placement(transformation(extent = {{60, 28}, {80, 48}}), iconTransformation(extent = {{66, 6}, {94, 38}})));
  parameter Real T0 "Integrator time constant (s)";
  parameter Real xd "d-axis estimated generator reactance (pu)";
  parameter Real xq "q-axis estimated generator reactance (pu)";
  parameter Real iflim "Maximum filed current (pu)";
  parameter Real vOELmax "Maximum output signal (pu)";
equation
  connect(v, field_current.v) annotation(Line(points = {{-80, 78}, {-66, 78}, {-66, 57.33}, {-55.88, 57.33}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(p, field_current.p) annotation(Line(points = {{-80, 46}, {-64, 46}, {-64, 50.19}, {-55.7, 50.19}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(q, field_current.q) annotation(Line(points = {{-80, 14}, {-64, 14}, {-64, 42.71}, {-55.7, 42.71}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(field_current.ifield, imSum2_1.p1) annotation(Line(points = {{-30.68, 50.19}, {-26.34, 50.19}, {-26.34, 50}, {-23.1, 50}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(iflimitation.n1, imSum2_1.p2) annotation(Line(points = {{-37.14, 25}, {-26, 25}, {-26, 46}, {-23.1, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, switch.y) annotation(Line(points = {{-13.1, 48}, {-10, 48}, {-10, 47.5}, {19.76, 47.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(set.n1, switch.V_input) annotation(Line(points = {{2.86, 37}, {6.43, 37}, {6.43, 43.5}, {19.76, 43.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator.n0, switch.if_in) annotation(Line(points = {{4.9, 70}, {6, 70}, {6, 52}, {19.76, 52}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator.p1, switch.y) annotation(Line(points = {{-5.1, 70}, {-8, 70}, {-8, 47.5}, {19.76, 47.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(switch.n1, imSum2_2.p1) annotation(Line(points = {{40.48, 48.25}, {43.24, 48.25}, {43.24, 48}, {44.9, 48}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(vref0, imSum2_2.p2) annotation(Line(points = {{-80, -14}, {44.9, -14}, {44.9, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, vref) annotation(Line(points = {{54.9, 46}, {58, 46}, {58, 38}, {70, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})),                                                                                     Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, 92}, {68, -48}}, lineColor = {0, 0, 255}), Text(extent = {{-68, 100}, {-30, 64}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "v"), Text(extent = {{-64, 64}, {-30, 30}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "p"), Text(extent = {{-62, 24}, {-34, -10}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "q"), Text(extent = {{-52, -16}, {-16, -48}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "vref0"), Text(extent = {{26, 46}, {60, 12}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "vref"), Text(extent = {{-18, 102}, {44, 24}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "OXL")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Over Excitation Limiter, PSAT manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end OEL;
