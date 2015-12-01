within iPSL.Examples.N44_Groups;
model SMIB1L_Group2_Nordic44 "Single-Machine Infinite Bus model testing the dynamic configuration from the Nordic 44 model.
  Components GENSAL, HYGOV, SCRX found in buses 3100, 3245, 3249, 5600"
  Electrical.Branches.PwLine2Openings pwLine(R = 0.1, X = 0.1, G = 0.1, B = 0.1, t1 = 100, t2 = 100) annotation(Placement(transformation(extent = {{-4, -10}, {16, 10}})));
  iPSL.Electrical.Events.PwFault pwFault(R = 0, t1 = 2, t2 = 2.15, X = -0.5) annotation(Placement(transformation(extent = {{6, 18}, {26, 38}})));
  Electrical.Branches.PwLine2Openings pwLine1(R = 0.1, X = 0.1, G = 0.1, B = 0.1, t1 = 100, t2 = 100) annotation(Placement(transformation(extent = {{40, 4}, {60, 24}})));
  Electrical.Branches.PwLine2Openings pwLine3(R = 0.1, X = 0.1, G = 0.1, B = 0.1, t2 = 100, t1 = 100) annotation(Placement(transformation(extent = {{24, -30}, {44, -10}})));
  iPSL.Electrical.Loads.PSSE.Load_variation constantLoad(angle_0 = -0.57627, S_p(re = 0.5, im = 0.1), S_i(im = 0, re = 0), S_y(re = 0, im = 0), a(re = 1, im = 0), b(re = 0, im = 1), PQBRAK = 0.7, V_0 = 0.991992, t1 = 2, d_P = 5 * 0.01, d_t = 0) annotation(Placement(transformation(extent = {{11, -12}, {-11, 12}}, rotation = 180, origin = {37, -44})));
  Electrical.Branches.PwLine2Openings pwLine4(R = 0.1, X = 0.1, G = 0.1, B = 0.1, t2 = 100, t1 = 100) annotation(Placement(transformation(extent = {{50, -30}, {70, -10}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS(M_b = 0.1, X_d = 0.2, P_0 = 0.01 * 10.01716, Q_0 = 0.01 * 8.006525, V_0 = 1, H = 0, D = 0, angle_0 = -3.00563e-7) annotation(Placement(transformation(extent = {{122, -10}, {100, 12}})));
  iPSL.Examples.N44_Groups.Configuration.Group2 group2 annotation(Placement(transformation(rotation = 0, extent = {{-72, -10}, {-52, 10}})));
equation
  connect(group2.p, pwLine.p) annotation(Line(points = {{-51, 0}, {-1, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwFault.p, pwLine.p) annotation(Line(points = {{4.33333, 28}, {-2, 28}, {-2, 0}, {-1, 0}, {-1, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine.n, pwLine1.p) annotation(Line(points = {{13, 0}, {20, 0}, {20, 14}, {43, 14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.p, pwLine1.p) annotation(Line(points = {{27, -20}, {20, -20}, {20, 14}, {43, 14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.n, pwLine4.p) annotation(Line(points = {{41, -20}, {53, -20}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.n, gENCLS.p) annotation(Line(points = {{57, 14}, {84, 14}, {84, 0.834604}, {97.8, 0.834604}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine4.n, gENCLS.p) annotation(Line(points = {{67, -20}, {84, -20}, {84, 0.834604}, {97.8, 0.834604}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.p, constantLoad.p) annotation(Line(points = {{27, -20}, {26, -20}, {26, -57.2}, {37, -57.2}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
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
end SMIB1L_Group2_Nordic44;

