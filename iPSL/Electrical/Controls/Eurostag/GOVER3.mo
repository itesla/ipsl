within iPSL.Electrical.Controls.Eurostag;
model GOVER3 "Voltage governor. Developed by AIA. 2013"
  parameter Real init_V1;
  parameter Real init_V2;
  parameter Real init_V3;
  parameter Real init_V4;
  parameter Real init_V5;
  parameter Real init_V6;
  parameter Real init_V7;
  parameter Real T5;
  parameter Real PN;
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint1(V=init_V1)
    annotation (Placement(transformation(extent={{-40,12},{-2,50}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    nStartValue=init_V2,
    K=25.0,
    T1=4.0,
    T2=1.0) annotation (Placement(transformation(extent={{-48,38},{18,86}})));
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput pin_CM annotation(Placement(transformation(extent = {{59, -11}, {78, 11}}), iconTransformation(extent = {{59, -10}, {80, 10}})));
  iPSL.NonElectrical.Math.ImSum1 imSum1_1(a0=1.0, a1=-1.0)
    annotation (Placement(transformation(extent={{-82,40},{-30,84}})));
  iPSL.NonElectrical.Nonlinear.ImLimiter imLimiter(Ymin=0.0, Ymax=1.05)
    annotation (Placement(transformation(extent={{42,30},{100,82}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1.0,
    T=0.1,
    nStartValue=init_V3)
    annotation (Placement(transformation(extent={{74,32},{128,80}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1.0,
    T=0.5,
    nStartValue=init_V4)
    annotation (Placement(transformation(extent={{-22,-64},{32,-16}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag1(
    K=1.0,
    T2=T5,
    nStartValue=init_V5,
    T1=0.3*T5)
    annotation (Placement(transformation(extent={{20,-64},{86,-16}})));
  iPSL.NonElectrical.Math.ImDiv2 imDiv2_1(
    a0=0.0,
    a1=1.0,
    a2=1.0,
    nStartValue=init_V7)
    annotation (Placement(transformation(extent={{72,-70},{126,-20}})));
  iPSL.NonElectrical.Math.ImSumStart2 imSumStart2_1(
    a0=0.0,
    a1=1.0,
    a2=1/PN,
    nStartValue=init_V6)
    annotation (Placement(transformation(extent={{6,34},{56,80}})));
equation
  connect(pin_OMEGA, imSum1_1.p1) annotation(Line(points = {{-51, 0}, {-80, 0}, {-80, 62}, {-69.26, 62}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSum1_1.n1, imLeadLag.p1) annotation(Line(points = {{-43.26, 62}, {-31.83, 62}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imLimiter.n1, imSimpleLag.p1) annotation(Line(points = {{85.21, 56}, {92.63, 56}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSimpleLag.n1, imSimpleLag1.p1) annotation(Line(points={{119.9,56},{124,
          56},{124,16},{-12,16},{-12,-40},{-3.37,-40}},                                                                                        color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSimpleLag1.n1, imLeadLag1.p1) annotation(Line(points={{23.9,-40},{36.17,
          -40}},                                                                                 color = {0, 0, 255}, smooth = Smooth.None));
  connect(imLeadLag1.n1, imDiv2_1.p1) annotation(Line(points = {{69.17, -40}, {85.23, -40}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pin_OMEGA, imDiv2_1.p2) annotation(Line(points = {{-51, 0}, {-86, 0}, {-86, -56}, {85.23, -56}, {85.23, -50}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imDiv2_1.n1, pin_CM) annotation(Line(points = {{112.23, -45}, {134, -45}, {134, 0}, {68.5, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSumStart2_1.p2, imSetPoint1.n1) annotation(Line(points = {{18.25, 52.4}, {18.25, 31}, {-11.69, 31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSumStart2_1.p1, imLeadLag.n1) annotation(Line(points = {{18.25, 61.6}, {2, 61.6}, {2, 62}, {1.17, 62}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSumStart2_1.n1, imLimiter.p1) annotation(Line(points = {{43.25, 57}, {43.25, 56}, {56.21, 56}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(extent = {{-120, -100}, {180, 100}}, preserveAspectRatio = true), graphics), Icon(coordinateSystem(extent = {{-120, -100}, {180, 100}}, preserveAspectRatio = true), graphics={  Rectangle(extent = {{-40, 40}, {60, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-20, -6}, {38, 8}}, lineColor = {0, 0, 255}, textString = "GOVER3")}),
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
end GOVER3;
