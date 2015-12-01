within iPSL.Electrical.Wind.PSSE.WT1G;
model WT1G1_test
  constant Real pi = Modelica.Constants.pi;
  parameter Real V1 = 1.00000;
  parameter Real A1 = 0.0000;
  parameter Real V5 = 1.00070;
  parameter Real A5 = -0.02;
  parameter Real P1 = -1.4974 / 100;
  parameter Real Q1 = -9.2781 / 100;
  parameter Real Zr = 0.00000E+0;
  parameter Real Zi = 2.00000E-1;
  parameter Real P5 = 1.5000;
  parameter Real Q5 = -0.7265;
  parameter Real R1 = 2.50000E-2;
  parameter Real X1 = 2.50000E-2;
  parameter Real B1 = 0.05000;
  parameter Real R2 = 2.50000E-3;
  parameter Real X2 = 2.50000E-3;
  parameter Real B2 = 0.0000;
  iPSL.Electrical.Branches.PwLine pwLine(R = R1, X = X1, G = 0, B = B1 / 2) annotation(Placement(transformation(extent = {{-68, 4}, {-48, 24}})));
  iPSL.Electrical.Branches.PwLine pwLine1(R = R1, X = X1, G = 0, B = B1 / 2) annotation(Placement(transformation(extent = {{-68, -20}, {-48, 0}})));
  iPSL.Electrical.Branches.PwLine pwLine3(R = R2, X = X2, G = 0, B = B2 / 2) annotation(Placement(transformation(extent = {{-4, -10}, {16, 10}})));
  iPSL.Electrical.Machines.PSSE.GENCLS.GENCLS gENCLS2_1(V_0 = V1, angle_0 = A1, P_0 = P1, Q_0 = Q1, R_a = Zr, X_d = Zi, M_b = 100) annotation(Placement(transformation(extent = {{-120, -10}, {-100, 12}})));
  iPSL.Electrical.Wind.PSSE.WT1G.WT1G1_oneMass_nosaturation wT3G1_pt(eterm = V5, anglev0 = A5, pelec = P5, qelec = Q5, Sbase = 100, wbase = 2 * pi * 60, Mbase = 1.5) annotation(Placement(transformation(extent = {{-17, 17}, {17, -17}}, rotation = 180, origin = {93, 1})));
equation
  connect(gENCLS2_1.p, pwLine.p) annotation(Line(points = {{-98, 0.834604}, {-89.5, 0.834604}, {-89.5, 14}, {-65, 14}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.p, gENCLS2_1.p) annotation(Line(points = {{-65, -10}, {-88, -10}, {-88, 0.834604}, {-98, 0.834604}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine.n, pwLine3.p) annotation(Line(points = {{-51, 14}, {-18, 14}, {-18, 0}, {-1, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.n, pwLine3.p) annotation(Line(points = {{-51, -10}, {-18, -10}, {-18, 0}, {-1, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine3.n, wT3G1_pt.pwPin) annotation(Line(points = {{13, 0}, {46, 0}, {46, 1.34}, {77.02, 1.34}}, color = {0, 0, 255}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-116, 74}, {-36, 50}}, lineColor=  {0, 0, 255}, textString=  "100 60HZ

The B in Pwline stands for half charging B in PSSE transmission line", fontSize=  10)}), Documentation(info = "<html>
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
end WT1G1_test;

