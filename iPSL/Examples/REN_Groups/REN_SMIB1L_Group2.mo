within iPSL.Examples.REN_Groups;
model REN_SMIB1L_Group2
  Electrical.Branches.PwLine2Openings pwLine(X = 0.1, t1 = 100, t2 = 100, G = 0, B = 0, R = 0.01) annotation(Placement(transformation(extent = {{-21, -10}, {-1, 10}})));
  Electrical.Events.PwFault pwFault(t1 = 10, t2 = 10.15, R = 0.1, X = 0.1) annotation(Placement(transformation(extent = {{63, -52}, {74, -38}})));
  Electrical.Branches.PwLine2Openings pwLine1(X = 0.1, t1 = 100, t2 = 100, G = 0, B = 0, R = 0.01) annotation(Placement(transformation(extent = {{23, 4}, {43, 24}})));
  Electrical.Branches.PwLine2Openings pwLine3(t2 = 100, t1 = 100, G = 0, B = 0, R = 0.005, X = 0.05) annotation(Placement(transformation(extent = {{7, -30}, {27, -10}})));
  Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(V_0 = 1, D = 0, angle_0 = 0, X_d = 0.2, M_b = 1200, P_0 = 51.66447, Q_0 = 97.411, H = 0) annotation(Placement(transformation(extent = {{105, -10}, {83, 12}})));
  iPSL.Examples.REN_Groups.Configuration.RGroup2 group2 annotation(Placement(transformation(rotation = 0, extent = {{-70, -10}, {-50, 10}})));
  Electrical.Branches.PwLine2Openings pwLine2(t2 = 100, t1 = 100, G = 0, B = 0, R = 0.005, X = 0.05) annotation(Placement(transformation(extent = {{37, -30}, {57, -10}})));
  Electrical.Loads.PSSE.Load_variation constantLoad(S_i(im = 0, re = 0), S_y(re = 0, im = 0), a(re = 1, im = 0), b(re = 0, im = 1), PQBRAK = 0.7, d_t = 0, d_P = 0, t1 = 0, V_0 = 0.9948733, angle_0 = -0.1207206, S_p(re = 0.45, im = 0.1)) annotation(Placement(transformation(extent = {{20, -56}, {44, -32}})));
  inner Electrical.SystemBase SysData(S_b = 1000) annotation(Placement(transformation(extent = {{-40, 60}, {-16, 80}})));
equation
  connect(pwLine.n, pwLine1.p) annotation(Line(points = {{-4, 0}, {3, 0}, {3, 14}, {26, 14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.p, pwLine1.p) annotation(Line(points = {{10, -20}, {3, -20}, {3, 14}, {26, 14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation(Line(points = {{40, 14}, {67, 14}, {67, 0.834604}, {80.8, 0.834604}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(group2.p, pwLine.p) annotation(Line(points = {{-49, 0}, {-18, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.n, pwLine2.p) annotation(Line(points = {{24, -20}, {32, -20}, {40, -20}}, color = {0, 0, 255}));
  connect(pwLine2.n, gENCLS.p) annotation(Line(points = {{54, -20}, {68, -20}, {68, 0}, {80.8, 0.834604}}, color = {0, 0, 255}));
  connect(constantLoad.p, pwLine3.p) annotation(Line(points = {{32, -30.8}, {32, -42}, {10, -42}, {10, -20}}, color = {0, 0, 255}));
  connect(pwFault.p, pwLine2.p) annotation(Line(points = {{62.0833, -45}, {56, -45}, {56, -40}, {40, -40}, {40, -20}}, color = {0, 0, 255}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})), Documentation(info = "<html>
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
end REN_SMIB1L_Group2;

