within iPSL.Electrical.Controls.Simulink.TG;
model Governor "Speed governor model for hydro turbines"

  Modelica.Blocks.Interfaces.RealInput Omega "Rotor speed in p.u" annotation(Placement(transformation(extent = {{-96, 20}, {-86, 32}}), iconTransformation(extent = {{-14, 30}, {-4, 40}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{-78,16},{-56,38}})));
  iPSL.NonElectrical.Math.ImSetPoint Omega_n(V=1) "Nominal rotor speed in p.u"
    annotation (Placement(transformation(extent={{-94,2},{-74,22}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-56,16},{-36,36}})));
  iPSL.NonElectrical.Math.ImGain Gain1(K=2)
    annotation (Placement(transformation(extent={{8,10},{32,36}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{48,10},{68,30}})));
  iPSL.NonElectrical.Math.ImGain Gain2(K=0.4)
    annotation (Placement(transformation(extent={{8,-6},{32,20}})));
  iPSL.NonElectrical.Continuous.ImIntegrator Integrator(K=1, nStartValue=p0)
    annotation (Placement(transformation(extent={{28,-4},{48,16}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{70,8},{90,28}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_5(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-54,-10})));
  iPSL.NonElectrical.Math.ImGain Droop(K=D) "Permanent speed droop" annotation (
     Placement(transformation(
        extent={{12,-13},{-12,13}},
        rotation=270,
        origin={-54,7})));
  iPSL.NonElectrical.Math.ImGain Gain3(K=5)
    annotation (Placement(transformation(extent={{86,4},{110,30}})));
  iPSL.NonElectrical.Continuous.ImLimited Limited(Ymin=-0.1, Ymax=0.1)
    annotation (Placement(transformation(extent={{104,2},{132,30}})));
  NonElectrical.Continuous.ImIntegratornonwindup            imLimitedIntegrator(Ymax = 1, K = 1, Ymin = 0, nStartValue = p0) annotation(Placement(transformation(extent = {{124, 2}, {152, 30}})));
  Modelica.Blocks.Interfaces.RealOutput z "Gate opening" annotation(Placement(transformation(extent = {{148, 12}, {158, 22}})));
  parameter Real D "Permanent speed droop, g19=g20=0.08, all others=0.04";
  parameter Real p0 "Initialization, initial electrical power";
  Modelica.Blocks.Interfaces.RealInput Pm_set annotation(Placement(transformation(extent = {{5, -6}, {-5, 6}}, rotation = 180, origin = {-90, -17}), iconTransformation(extent = {{5, -6}, {-5, 6}}, rotation = 180, origin = {-10, 14})));
  Modelica.Blocks.Interfaces.RealInput Pe annotation(Placement(transformation(extent = {{5, -6}, {-5, 6}}, rotation = 180, origin = {-90, -33}), iconTransformation(extent = {{5, -6}, {-5, 6}}, rotation = 180, origin = {-10, -8})));
  iPSL.NonElectrical.Continuous.ImSimpleLag SimpleLag1(
    K=1,
    T=2,
    nStartValue=p0)
    annotation (Placement(transformation(extent={{-82,-46},{-52,-18}})));
equation
  connect(Omega, imSum2_1.p1) annotation(Line(points = {{-91, 26}, {-80.5, 26}, {-80.5, 29.2}, {-72.61, 29.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Omega_n.n1, imSum2_1.p2) annotation(Line(points = {{-79.1, 12}, {-74, 12}, {-74, 24.8}, {-72.61, 24.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imSum2_2.p1) annotation(Line(points = {{-61.61, 27}, {-56.805, 27}, {-56.805, 28}, {-51.1, 28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain1.n1, imSum2_3.p1) annotation(Line(points = {{25.88, 23}, {31.94, 23}, {31.94, 22}, {52.9, 22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain2.n1, Integrator.p1) annotation(Line(points = {{25.88, 7}, {30.94, 7}, {30.94, 6}, {32.9, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Integrator.n1, imSum2_3.p2) annotation(Line(points = {{42.9, 6}, {48, 6}, {48, 18}, {52.9, 18}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.n1, imSum2_4.p1) annotation(Line(points = {{62.9, 20}, {74.9, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_5.n1, Droop.p1) annotation(Line(points = {{-54, -5.1}, {-54, 0.88}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Droop.n1, imSum2_2.p2) annotation(Line(points = {{-54, 12.88}, {-54, 24}, {-51.1, 24}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.n1, Gain3.p1) annotation(Line(points = {{84.9, 18}, {88.39, 18}, {88.39, 17}, {91.88, 17}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain3.n1, Limited.p1) annotation(Line(points = {{103.88, 17}, {106.94, 17}, {106.94, 16}, {110.86, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Limited.n1, imLimitedIntegrator.p1) annotation(Line(points = {{124.86, 16}, {130.86, 16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pm_set, imSum2_5.p2) annotation(Line(points = {{-90, -17}, {-90, -20}, {-56, -20}, {-56, -15.1}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Pe, SimpleLag1.p1) annotation(Line(points = {{-90, -33}, {-75, -33}, {-75, -32}, {-71.65, -32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(SimpleLag1.n1, imSum2_5.p1) annotation(Line(points={{-56.5,-32},{-52,-32},
          {-52,-15.1}},                                                                                   color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, Gain1.p1) annotation(Line(points = {{-41.1, 26}, {-12, 26}, {-12, 23}, {13.88, 23}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Gain2.p1, imSum2_2.n1) annotation(Line(points = {{13.88, 7}, {-12, 7}, {-12, 26}, {-41.1, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator.n0, z) annotation (Line(
      points={{144.86,16},{148,16},{148,17},{153,17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator.n0, imSum2_4.p2) annotation (Line(
      points={{144.86,16},{144,16},{144,-16},{74.9,-16},{74.9,16}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{160,100}}),                                                                           graphics={  Text(extent=  {{90, -6}, {128, -10}}, lineColor=  {0, 0, 127}, textString=  "Servomotor"), Text(extent=  {{14, 34}, {52, 30}}, lineColor=  {0, 0, 127}, textString=  "PI Control"), Text(extent=  {{-102, 36}, {-78, 34}}, lineColor=  {0, 0, 127}, textString=  "w (rotor speed)"), Text(extent=  {{-100, -40}, {-76, -42}}, lineColor=  {0, 0, 127}, textString=  "P (active power)"), Text(extent=  {{-98, -8}, {-74, -10}}, lineColor=  {0, 0, 127}, textString=  "P0 (power set point)"), Text(extent=  {{-50, 6}, {-32, 8}}, lineColor=  {0, 0, 127}, textString=  "Speed drop")}), Icon(coordinateSystem(extent = {{-100, -100}, {160, 100}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-4, 46}, {150, -20}}, lineColor=  {0, 0, 255}), Text(extent=  {{24, 30}, {126, 6}}, lineColor=  {0, 0, 255}, textString=  "Speed Governor"), Text(extent=  {{0, 42}, {20, 26}}, lineColor=  {0, 0, 255}, textString=  "Omega"), Text(extent=  {{136, 24}, {152, 12}}, lineColor=  {0, 0, 255}, textString=  "z"), Text(extent=  {{0, 20}, {20, 4}}, lineColor=  {0, 0, 255}, textString=  "Pmset"), Text(extent=  {{0, -2}, {20, -18}}, lineColor=  {0, 0, 255}, textString=  "Pe")}),
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
end Governor;
