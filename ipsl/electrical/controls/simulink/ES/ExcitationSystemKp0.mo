within iPSL.Electrical.Controls.Simulink.ES;
model ExcitationSystemKp0 "Excitation system without PSS included"
  parameter Real V0 = 1 "Reference value of terminal voltage";
  parameter Real L2 = 4 "Exciter parameter";
  parameter Real G = 70 "Exciter parameter";
  parameter Real Ta = 10 "Exciter parameter";
  parameter Real Tb = 20 "Exciter parameter";
  parameter Real vfd0 "Initial Filed voltage";
  parameter Real r "OEL parameter";
  parameter Real f "OEL parameter";
  parameter Real L1 "OEL parameter";
  parameter Real ifd_lim "OEL parameter";
  iPSL.Electrical.Controls.Simulink.OEL.OEL oEL(
    init_OEL_Timer=0,
    ifd_lim=ifd_lim,
    r=r,
    f=f,
    L1=L1) annotation (Placement(transformation(extent={{-28,40},{20,76}})));
  iPSL.NonElectrical.Math.ImSetPoint V_0(V=V0) "Reference terminal voltage "
    annotation (Placement(transformation(extent={{-92,28},{-56,58}})));
  iPSL.NonElectrical.Math.ImSum2 imSum3_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
  Modelica.Blocks.Interfaces.RealInput ifd "Field current" annotation(Placement(transformation(extent = {{-96, 62}, {-84, 74}})));
  Modelica.Blocks.Interfaces.RealInput V "Terminal voltage " annotation(Placement(transformation(extent = {{-96, 22}, {-84, 34}})));
  Modelica.Blocks.Interfaces.RealOutput vfd "Field voltage" annotation(Placement(transformation(extent = {{128, 22}, {140, 34}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{66,44},{88,64}})));
  iPSL.NonElectrical.Math.ImGain Ka(K=10)
    annotation (Placement(transformation(extent={{82,44},{102,64}})));
  NonElectrical.Continuous.ImIntegratornonwindup            imLimitedIntegrator(Ymin = 0, Ymax = L2, K = 1, nStartValue = vfd0) annotation(Placement(transformation(extent = {{98, 36}, {132, 72}})));
  iPSL.NonElectrical.Continuous.ImLeadLag tgr(
    K=G,
    T1=Ta,
    T2=Tb,
    nStartValue=vfd0) "Transient gain rudection"
    annotation (Placement(transformation(extent={{18,30},{74,80}})));
equation
  connect(oEL.ifd, ifd) annotation(Line(points = {{-24.4, 59.08}, {-77.44, 59.08}, {-77.44, 68}, {-90, 68}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_0.n1, imSum3_1.p1) annotation(Line(points = {{-65.18, 43}, {-59.59, 43}, {-59.59, 32}, {-45.1, 32}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V, imSum3_1.p2) annotation(Line(points = {{-90, 28}, {-45.1, 28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum3_1.n1, oEL.VolContinput) annotation(Line(points = {{-35.1, 30}, {-30, 30}, {-30, 51.16}, {-24.4, 51.16}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Ka.n1, imLimitedIntegrator.p1) annotation(Line(points = {{96.9, 54}, {106.33, 54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imSum2_1.n1, Ka.p1) annotation(Line(points = {{82.39, 54}, {86.9, 54}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(oEL.OEL_output, tgr.p1) annotation(Line(points = {{16.16, 54.4}, {24.08, 54.4}, {24.08, 55}, {31.72, 55}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(tgr.n1, imSum2_1.p1) annotation(Line(points = {{59.72, 55}, {64.86, 55}, {64.86, 56}, {71.39, 56}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(imLimitedIntegrator.n0, vfd) annotation (Line(
      points={{123.33,54},{128,54},{128,28},{134,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.p2, vfd) annotation (Line(
      points={{71.39,52},{70,52},{70,28},{134,28}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{140,100}}),                                                                           graphics), Icon(coordinateSystem(extent = {{-100, -100}, {140, 100}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-84, 78}, {128, -20}}, lineColor=  {0, 0, 255}), Text(extent=  {{-80, 72}, {-62, 60}}, lineColor=  {0, 0, 255}, textString=  "ifd"), Text(extent=  {{-80, 34}, {-62, 22}}, lineColor=  {0, 0, 255}, textString=  "V "), Text(extent=  {{106, 36}, {130, 22}}, lineColor=  {0, 0, 255}, textString=  "vfd"), Text(extent=  {{-34, 58}, {88, 0}}, lineColor=  {0, 0, 255}, textString=  "Exciter AVR OEL PSS")}),
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
end ExcitationSystemKp0;
