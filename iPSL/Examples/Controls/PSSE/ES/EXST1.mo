within iPSL.Examples.Controls.PSSE.ES;

model EXST1 "SMIB system with one load and GENROE model"
  extends iPSL.Examples.SMIBpartial;
  extends Modelica.Icons.Example;
  iPSL.Electrical.Machines.PSSE.GENROE gENROE(M_b = 100, Tpd0 = 5, Tppd0 = 0.07, Tpq0 = 0.9, Tppq0 = 0.09, H = 4.28, D = 0, Xd = 1.84, Xq = 1.75, Xpd = 0.41, Xpq = 0.6, Xppd = 0.2, Xl = 0.12, S10 = 0.11, S12 = 0.39, V_0 = 1, P_0 = 40, angle_0 = 4.046276, Q_0 = 5.416582, Xppq = 0.2) annotation(
    Placement(visible = true, transformation(origin = {-83, 0}, extent = {{-21, -20}, {21, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(extent = {{-8, -74}, {-28, -54}}, rotation = 0)));
  iPSL.Electrical.Controls.PSSE.ES.EXST1 eXST1_1(V_IMAX = 10, V_IMIN = -10, T_R = 0.02, T_B = 1, K_A = 80, T_A = 0.05, V_RMAX = 8, V_RMIN = -3, K_C = 0.2, K_F = 0.1, T_F = 1, T_C = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-84.5064, -43.7829}, extent = {{17.4936, -13.8838}, {-17.4936, 11.107}}, rotation = 0)));
equation
  connect(eXST1_1.EFD0, gENROE.EFD0) annotation(Line(points = {{-68, -52}, {-50, -52}, {-50, -14}, {-60, -14}, {-60, -14}}, color = {0, 0, 127}));
  connect(const.y, eXST1_1.VOTHSG) annotation(Line(points = {{-28, -64}, {-36, -64}, {-36, -36}, {-68, -36}, {-68, -36}}, color = {0, 0, 127}));
  connect(const.y, eXST1_1.VOEL) annotation(Line(points = {{-29, -64}, {-78, -64}, {-78, -57}}, color = {0, 0, 127}));
  connect(gENROE.ETERM, eXST1_1.ECOMP) annotation(Line(points = {{-60, 10}, {-46, 10}, {-46, -44}, {-68, -44}, {-68, -44}}, color = {0, 0, 127}));
  connect(eXST1_1.XADIFD, gENROE.XADIFD) annotation(Line(points = {{-68, -48}, {-56, -48}, {-56, -18}, {-60, -18}}, color = {0, 0, 127}));
  connect(gENROE.PMECH0, gENROE.PMECH) annotation(Line(points = {{-60.32, -6}, {-50.32, -6}, {-50.32, 30}, {-118.32, 30}, {-118.32, 10}, {-104.32, 10}}, color = {0, 0, 127}));
  connect(eXST1_1.EFD, gENROE.EFD) annotation(Line(points = {{-102, -44}, {-118, -44}, {-118, -10}, {-104, -10}}, color = {0, 0, 127}));
  connect(gENROE.p, GEN1.p) annotation(Line(points = {{-60, 0}, {-40, 0}}, color = {0, 0, 255}));
  connect(eXST1_1.VUEL, eXST1_1.VOEL) annotation(Line(points = {{-73.1356, -57.055}, {-52.1356, -57.055}, {-52.1356, -45.7217}, {-78.1356, -45.7217}, {-78.1356, -57.055}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Documentation(revisions = "<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end EXST1;
