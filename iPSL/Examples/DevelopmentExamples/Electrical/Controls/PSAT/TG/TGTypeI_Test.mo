within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSAT.TG;


model TGTypeI_Test
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(P_0 = 0.08, Q_0 = 0.06, V_0 = 1, angle_0 = 0) annotation(Placement(visible = true, transformation(origin = {122.283, 26}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine2Openings pwLinewithOpening1(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1, t1 = 8, t2 = 8.1) annotation(Placement(visible = true, transformation(origin = {79, 16}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine4(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {79, 31}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine3(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {84, -19}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(P_0 = 0.08, Q_0 = 0.06, V_0 = 1, angle_0 = 0) annotation(Placement(visible = true, transformation(origin = {124, -19}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine2(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {44, 26}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Branches.PwLine pwLine1(B = 0.001 / 2, G = 0, R = 0.01, X = 0.1) annotation(Placement(visible = true, transformation(origin = {44, -4}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
  iPSL.Electrical.Events.PwFaultPQ pwFault(X = 0.001, t1 = 3, t2 = 3.1, R = 10) annotation(Placement(transformation(extent = {{115, -52}, {135, -32}})));
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 order6Type2_Inputs_Outputs(V_0 = 1, angle_0 = 0, P_0 = 0.160352698692006, Q_0 = 0.11859436505981, V_b = 200, Sn = 370, Vn = 200, ra = 0.001, xd1 = 0.302, M = 10, D = 0) annotation(Placement(transformation(extent = {{-68, -12}, {12, 66}})));
  parameter Real p0 = 0.160352698692006 "Power flow, node active power";
  iPSL.Electrical.Controls.PSAT.TG.TGTypeI tGTypeI(wref = 1, pref = p0, R = 0.2, pmax = 1, pmin = 0, Ts = 0.1, Tc = 1, T3 = 0.04, T4 = 5, T5 = 0.04) annotation(Placement(transformation(extent = {{-2, -64}, {-68, -20}})));
  inner iPSL.Electrical.SystemBase SysData annotation(Placement(transformation(extent = {{80, 80}, {128, 106}})));
equation
  connect(pwLine4.n, pwLoadPQ2.p) annotation(Line(visible = true, origin = {101.213, 29}, points = {{-15.213, 2}, {3.0708, 2}, {3.0708, 8}, {21.07, 8}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation(Line(visible = true, origin = {86, 23.5}, points = {{0, -7.5}, {0, 7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation(Line(visible = true, origin = {72, 23.5}, points = {{0, 7.5}, {0, -7.5}}));
  connect(pwLine3.n, pwLoadPQ1.p) annotation(Line(visible = true, origin = {107.5, -18.5}, points = {{-16.5, -0.5}, {3.5, -0.5}, {3.5, 10.5}, {16.5, 10.5}}));
  connect(pwLine2.n, pwLine4.p) annotation(Line(points = {{51, 26}, {64, 26}, {64, 31}, {72, 31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.n, pwLine3.p) annotation(Line(points = {{51, -4}, {64, -4}, {64, -19}, {77, -19}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine2.n, pwLine1.n) annotation(Line(points = {{51, 26}, {51, -4}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwFault.p, pwLine3.n) annotation(Line(points = {{113.333, -42}, {104, -42}, {104, -19}, {91, -19}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(order6Type2_Inputs_Outputs.p, pwLine2.p) annotation(Line(points = {{16, 27.1936}, {27, 27.1936}, {27, 26}, {37, 26}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.p, pwLine2.p) annotation(Line(points = {{37, -4}, {37, 26}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(order6Type2_Inputs_Outputs.vf0, order6Type2_Inputs_Outputs.vf) annotation(Line(points = {{-60, 69.9}, {28, 69.9}, {28, 80}, {-88, 80}, {-88, 46.5}, {-68, 46.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(order6Type2_Inputs_Outputs.w, tGTypeI.w) annotation(Line(points = {{16, 62.1}, {30, 62.1}, {30, -38.7}, {-8.325, -38.7}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(tGTypeI.pm, order6Type2_Inputs_Outputs.pm) annotation(Line(points = {{-56.175, -39.14}, {-88, -39.14}, {-88, 7.5}, {-68, 7.5}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {140, 120}}, preserveAspectRatio = false), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {140, 120}})), Documentation(info = "<html>
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
end TGTypeI_Test;
