within iPSL.Electrical.Controls.Simulink.PSS;
model PSS "Power system stabilizer"
  parameter Real Kp "Washout gain";
  parameter Real Tw "Washout time constant";
  parameter Real T1 "Lead-lag filter time constant";
  parameter Real T2 "Lead-lag filter time constant";
  parameter Real C "PSS output limiation";
  parameter Real init_PSS_Leadlag1 = 0 "initial output value";
  parameter Real init_PSS_Leadlag2 = 0 "initial output value";
  Modelica.Blocks.Interfaces.RealInput omega "Speed" annotation(Placement(transformation(extent = {{-100, 8}, {-88, 20}})));
  iPSL.NonElectrical.Continuous.ImLeadLag Leadlag1(
    K=1,
    T1=T1,
    T2=T2,
    nStartValue=init_PSS_Leadlag1)
    annotation (Placement(transformation(extent={{-38,-2},{0,28}})));
  iPSL.NonElectrical.Continuous.ImLeadLag Leadlag2(
    K=1,
    T1=T1,
    T2=T2,
    nStartValue=init_PSS_Leadlag2)
    annotation (Placement(transformation(extent={{-10,-2},{22,28}})));
  Modelica.Blocks.Interfaces.RealOutput Upss "PSS output" annotation(Placement(transformation(extent = {{56, 6}, {68, 18}}), iconTransformation(extent = {{56, 6}, {68, 18}})));
  iPSL.NonElectrical.Continuous.ImLimited limit(Ymin=-C, Ymax=C)
    annotation (Placement(transformation(extent={{12,-8},{54,34}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=Kp/Tw)
    annotation (Placement(transformation(extent={{-90,4},{-70,24}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=Tw,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-80,-4},{-44,30}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{-48,2},{-28,22}})));
equation
  connect(omega, imGain.p1) annotation(Line(points = {{-94, 14}, {-85.1, 14}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imSimpleLag.p1) annotation(Line(points = {{-75.1, 14}, {-68, 14}, {-68, 13}, {-67.58, 13}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSimpleLag.n1, imSum2_1.p1) annotation(Line(points={{-49.4,13},{-46,13},
          {-46,14},{-43.1,14}},                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(Leadlag1.p1, imSum2_1.n1) annotation(Line(points = {{-28.69, 13}, {-30, 13}, {-30, 12}, {-33.1, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.p2, imSimpleLag.p1) annotation(Line(points = {{-43.1, 10}, {-50, 10}, {-50, -2}, {-70, -2}, {-70, 13}, {-67.58, 13}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Leadlag1.n1, Leadlag2.p1) annotation(Line(points = {{-9.69, 13}, {-2.16, 13}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Leadlag2.n1, limit.p1) annotation(Line(points = {{13.84, 13}, {17.92, 13}, {17.92, 13}, {22.29, 13}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(limit.n1, Upss) annotation(Line(points = {{43.29, 13}, {51.645, 13}, {51.645, 12}, {62, 12}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-88, 44}, {56, -18}}, lineColor=  {0, 0, 255}), Text(extent=  {{-44, 28}, {22, -2}}, lineColor=  {0, 0, 255}, textString=  "PSS"), Text(extent=  {{-86, 24}, {-62, 4}}, lineColor=  {0, 0, 255}, textString=  "omega"), Text(extent=  {{34, 20}, {54, 0}}, lineColor=  {0, 0, 255}, textString=  "Upss")}),
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
end PSS;
