within iPSL.Electrical.Controls.DTU;
model pwPLL2 "Developed by DTU"
  parameter Real Kp = 10;
  parameter Real Ki = 30;
  parameter Real fmin = 0.8;
  parameter Real fmax = 1.2;
  parameter Real fnom = 50;
  parameter Real ini_PIIntegrator;
  parameter Real ini_Integrator(fixed = false);
  iPSL.Connectors.PwPin Vpin annotation (Placement(transformation(extent={{-80,
            -6},{-68,6}}), iconTransformation(extent={{-80,-6},{-68,6}})));
  Modelica.Blocks.Interfaces.RealOutput freq_meas annotation(Placement(transformation(extent = {{60, -26}, {72, -14}}), iconTransformation(extent = {{45, -36}, {59, -24}})));
  iPSL.Electrical.Sensors.PwVoltage pwVoltage
    annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_1(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-50,6},{-30,26}})));
  iPSL.NonElectrical.Math.ImMult2 imMult2_2(
    a0=0,
    a1=1,
    a2=1) annotation (Placement(transformation(extent={{-50,-26},{-30,-6}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=-1,
    a2=1) annotation (Placement(transformation(extent={{-34,-12},{-14,8}})));
  NonElectrical.Continuous.ImIntegratornonwindup            imLimitedIntegrator(K = Ki, nStartValue = ini_PIIntegrator, Ymin = fmin, Ymax = fmax) annotation(Placement(transformation(extent = {{-16, -26}, {4, -6}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=Kp)
    annotation (Placement(transformation(extent={{-16,6},{4,26}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_2(
    a0=0,
    a2=1,
    a1=1) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a2=1,
    a1=1) annotation (Placement(transformation(extent={{14,-12},{34,8}})));
  Modelica.Blocks.Interfaces.RealInput freq annotation(Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {11, -37}), iconTransformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {0, -56})));
  Modelica.Blocks.Interfaces.RealOutput phi_meas annotation(Placement(transformation(extent = {{60, 14}, {72, 26}}), iconTransformation(extent = {{45, 24}, {59, 36}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_4(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{30,-14},{50,6}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(K=1, nStartValue=
        ini_Integrator)
    annotation (Placement(transformation(extent={{44,-14},{64,6}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=1/(2*Modelica.Constants.pi*fnom))
    annotation (Placement(transformation(extent={{36,-30},{56,-10}})));
  iPSL.NonElectrical.Math.ImSine imSine
    annotation (Placement(transformation(extent={{18,48},{-2,68}})));
  iPSL.NonElectrical.Math.ImCosine imCosine
    annotation (Placement(transformation(extent={{24,-72},{4,-52}})));
initial equation
  ini_Integrator = Modelica.Math.atan(Vpin.vi / Vpin.vr);

equation
  connect(pwVoltage.p, Vpin) annotation(Line(points = {{-63, 0}, {-74, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwVoltage.vr, imMult2_1.p2) annotation(Line(points = {{-53.1, 3}, {-48.55, 3}, {-48.55, 13.8}, {-45.1, 13.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(pwVoltage.vi, imMult2_2.p1) annotation(Line(points = {{-53.1, 0}, {-50, 0}, {-50, -13.8}, {-45.1, -13.8}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_1.n1, imSum2_1.p1) annotation(Line(points = {{-35.1, 16}, {-32, 16}, {-32, 0}, {-29.1, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imMult2_2.n1, imSum2_1.p2) annotation(Line(points = {{-35.1, -16}, {-32, -16}, {-32, -4}, {-29.1, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, imLimitedIntegrator.p1) annotation(Line(points = {{-19.1, -2}, {-16, -2}, {-16, -16}, {-11.1, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.p1, imLimitedIntegrator.p1) annotation(Line(points = {{-11.1, 16}, {-16, 16}, {-16, -16}, {-11.1, -16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain.n1, imSum2_2.p1) annotation(Line(points = {{-1.1, 16}, {4, 16}, {4, 2}, {4.9, 2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_2.n1, imSum2_3.p1) annotation(Line(points = {{14.9, 0}, {18.9, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(freq, imSum2_3.p2) annotation(Line(points = {{11, -37}, {11, -20.5}, {18.9, -20.5}, {18.9, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_3.n1, imSum2_4.p1) annotation(Line(points = {{28.9, -2}, {34.9, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.p2, imSum2_3.p2) annotation(Line(points = {{34.9, -6}, {34, -6}, {34, -20}, {18.9, -20}, {18.9, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_4.n1, imIntegrator.p1) annotation(Line(points = {{44.9, -4}, {48.9, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imIntegrator.n1, phi_meas) annotation(Line(points = {{58.9, -4}, {62, -4}, {62, 20}, {66, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.p1, imSum2_4.p1) annotation(Line(points = {{40.9, -20}, {30, -20}, {30, -2}, {34.9, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imGain1.n1, freq_meas) annotation(Line(points = {{50.9, -20}, {66, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSine.p1, phi_meas) annotation(Line(points = {{13.1, 58}, {62, 58}, {62, 20}, {66, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSine.n1, imMult2_1.p1) annotation(Line(points = {{3.1, 58}, {-56, 58}, {-56, 18.2}, {-45.1, 18.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imCosine.p1, phi_meas) annotation(Line(points = {{19.1, -62}, {62, -62}, {62, -4}, {62, -4}, {62, 20}, {66, 20}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imCosine.n1, imMult2_2.p2) annotation(Line(points = {{9.1, -62}, {-54, -62}, {-54, -18.2}, {-45.1, -18.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator.n0, imSum2_2.p2) annotation (Line(
      points={{-1.1,-16},{2,-16},{2,-2},{4.9,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-68, 46}, {46, -50}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Text(extent=  {{-42, 20}, {20, -24}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5,
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "PLL")}), Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics),
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
end pwPLL2;
