within iPSL.Electrical.Controls.Eurostag;
model GOVER1 "Steam turbine governor. Developed by AIA. 2013"
  parameter Real init_Integrator;
  parameter Real init_LeadLag;
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V=0)
    annotation (Placement(transformation(extent={{-100,12},{-66,48}})));
  NonElectrical.Continuous.ImIntegratornonwindup            imLimitedIntegrator(Ymin = 0, K = 1, Ymax = 1.1, nStartValue = init_Integrator) annotation(Placement(transformation(extent = {{-64, 12}, {-22, 48}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a3=1,
    a2=1,
    a1=-25,
    a0=25) annotation (Placement(transformation(extent={{-26,-22},{22,18}})));
  iPSL.NonElectrical.Math.ImSetPoint imSetPoint1(V=0)
    annotation (Placement(transformation(extent={{-52,-44},{-18,-8}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T2=10,
    T1=3,
    nStartValue=init_LeadLag)
    annotation (Placement(transformation(extent={{18,-10},{74,30}})));
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA annotation(Placement(transformation(extent = {{-81, 0}, {-61, 20}}), iconTransformation(extent = {{-81, 0}, {-61, 20}})));
  Modelica.Blocks.Interfaces.RealOutput pin_CM annotation(Placement(transformation(extent = {{79, 0}, {98, 20}}), iconTransformation(extent = {{79, 0}, {99, 20}})));
equation
  connect(imSetPoint.n1, imLimitedIntegrator.p1) annotation(Line(points = {{-74.67, 30}, {-53.71, 30}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSetPoint1.n1, imSum3_1.p3) annotation(Line(points = {{-26.67, -26}, {-14.24, -26}, {-14.24, -8}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSum3_1.n1, imLeadLag.p1) annotation(Line(points = {{9.76, -2}, {22, -2}, {22, 10}, {31.72, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imSum3_1.p1, pin_OMEGA) annotation(Line(points = {{-14.24, 4}, {-22, 4}, {-22, 10}, {-71, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imLeadLag.n1, pin_CM) annotation(Line(points = {{59.72, 10}, {88.5, 10}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(imLimitedIntegrator.n0, imSum3_1.p2) annotation (Line(
      points={{-32.71,30},{-24,30},{-24,-2},{-14.24,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}),
                     graphics), Icon(graphics={  Rectangle(extent = {{-60, 60}, {80, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-40, -2}, {56, 24}}, lineColor = {0, 0, 255}, textString = "GOVER1")}),
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
end GOVER1;
