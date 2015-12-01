within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSSE.ES;
model EXST1 "SMIB model example of GENROU with Excitation System EXST1"
  iPSL.Electrical.Branches.PwLine pwLine(R = 0.001, X = 0.2, G = 0, B = 0) annotation(Placement(transformation(extent = {{-50, -10}, {-30, 10}})));
  iPSL.Electrical.Branches.PwLine pwLine1(R = 0.001, X = 0.2, G = 0, B = 0) annotation(Placement(transformation(extent = {{10, 30}, {30, 50}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine3(t2 = 100, R = 0.0005, X = 0.1, G = 0, B = 0, t1 = 2.15) annotation(Placement(transformation(extent = {{-8, -50}, {12, -30}})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine4(t2 = 100, R = 0.0005, X = 0.1, G = 0, B = 0, t1 = 2.15) annotation(Placement(transformation(extent = {{28, -50}, {48, -30}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(X_d = 0.2, H = 0, D = 0, V_b = 100, V_0 = 1, angle_0 = 0, M_b = 100, P_0 = 10.01711, Q_0 = 8.006544) annotation(Placement(transformation(extent = {{78, -10}, {68, 14}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(S_p(re = 0.5, im = 0.1), S_i(im = 0, re = 0), S_y(re = 0, im = 0), a(re = 1, im = 0), b(re = 0, im = 1), PQBRAK = 0.7, V_0 = 0.9919935, angle_0 = -0.5762684, d_P = 0, t1 = 0, d_t = 0) annotation(Placement(transformation(extent = {{-12, -60}, {-24, -48}})));
  iPSL.Electrical.Events.PwFault pwFault(R = 0.1, X = 0.1, t1 = 2, t2 = 2.15) annotation(Placement(transformation(extent = {{32, -66}, {44, -54}})));
  Modelica.Blocks.Sources.Constant const2(k = 0) annotation(Placement(transformation(extent = {{-110, 166}, {-94, 182}})));
  Generator generator annotation(Placement(transformation(extent = {{-92, -10}, {-72, 10}})));
  iPSL.Electrical.Buses.Bus GEN01 annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}})));
  iPSL.Electrical.Buses.Bus LOAD annotation(Placement(transformation(extent = {{-32, -10}, {-12, 10}})));
  iPSL.Electrical.Buses.Bus FAULT annotation(Placement(transformation(extent = {{10, -50}, {30, -30}})));
  iPSL.Electrical.Buses.Bus GEN02 annotation(Placement(transformation(extent = {{50, -8}, {70, 12}})));
  inner iPSL.Electrical.SystemBase SysData(S_b = 100, fn = 50) annotation(Placement(transformation(extent = {{40, 84}, {100, 100}})));
equation
  connect(generator.pwPin, GEN01.p) annotation(Line(points = {{-71, 0}, {-65.5, 0}, {-60, 0}}, color = {0, 0, 255}));
  connect(GEN01.p, pwLine.p) annotation(Line(points = {{-60, 0}, {-47, 0}}, color = {0, 0, 255}));
  connect(pwLine.n, LOAD.p) annotation(Line(points = {{-33, 0}, {-27.5, 0}, {-22, 0}}, color = {0, 0, 255}));
  connect(LOAD.p, pwLine1.p) annotation(Line(points = {{-22, 0}, {-12, 0}, {-12, 40}, {13, 40}}, color = {0, 0, 255}));
  connect(pwLine3.p, pwLine1.p) annotation(Line(points = {{-5, -40}, {-12, -40}, {-12, 40}, {13, 40}}, color = {0, 0, 255}));
  connect(pwLine3.n, FAULT.p) annotation(Line(points = {{9, -40}, {14.5, -40}, {20, -40}}, color = {0, 0, 255}));
  connect(FAULT.p, pwLine4.p) annotation(Line(points = {{20, -40}, {31, -40}}, color = {0, 0, 255}));
  connect(pwLine1.n, GEN02.p) annotation(Line(points = {{27, 40}, {27, 40}, {52, 40}, {52, 2}, {60, 2}}, color = {0, 0, 255}));
  connect(pwLine4.n, GEN02.p) annotation(Line(points = {{45, -40}, {52, -40}, {52, 2}, {60, 2}}, color = {0, 0, 255}));
  connect(GEN02.p, gENCLS.p) annotation(Line(points = {{60, 2}, {67, 2}, {67, 1.81957}}, color = {0, 0, 255}));
  connect(constantLoad.p, pwLine1.p) annotation(Line(points = {{-18, -47.4}, {-19, -47.4}, {-19, 0}, {-12, 0}, {-12, 40}, {13, 40}}, color = {0, 0, 255}));
  connect(pwFault.p, pwLine4.p) annotation(Line(points = {{31, -60}, {24, -60}, {24, -40}, {31, -40}}, color = {0, 0, 255}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
end EXST1;

