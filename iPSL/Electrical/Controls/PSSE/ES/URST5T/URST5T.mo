within iPSL.Electrical.Controls.PSSE.ES.URST5T;


model URST5T "IEEE Proposed Type ST5B Excitation System"
  parameter Real T_r = 0.025;
  parameter Real T_C1 = 0.1;
  parameter Real T_B1 = 0.2;
  parameter Real T_C2 = 1;
  parameter Real T_B2 = 1;
  parameter Real KR = 1;
  parameter Real V_RMAX = 10;
  parameter Real V_RMIN = -10;
  parameter Real T_1 = 0.58;
  parameter Real K_C = 0.3;
  NonElectrical.Continuous.SimpleLag Vm(y_start = Vm0, T = T_r, K = 1) annotation(Placement(transformation(extent = {{-9, -9}, {9, 9}}, rotation = 0, origin = {-79, -13})));
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation(Placement(transformation(extent = {{-144, -32}, {-106, 6}}), iconTransformation(extent = {{-128, 82}, {-94, 116}})));
  Modelica.Blocks.Interfaces.RealInput V_REF annotation(Placement(transformation(extent = {{-130, 40}, {-92, 78}}), iconTransformation(extent = {{-130, 40}, {-92, 78}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation(Placement(transformation(extent = {{-19, -19}, {19, 19}}, rotation = 0, origin = {-125, -129}), iconTransformation(extent = {{-17, -17}, {17, 17}}, origin = {-111, -127})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation(Placement(transformation(extent = {{410, -40}, {430, -20}}), iconTransformation(extent = {{410, -40}, {430, -20}})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation(Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 0, origin = {-119, 93}), iconTransformation(extent = {{-17, -17}, {17, 17}}, origin = {-111, 21})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation(Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 0, origin = {-121, -177}), iconTransformation(extent = {{-17, -17}, {17, 17}}, origin = {-111, -179})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation(Placement(transformation(extent = {{-19, -19}, {19, 19}}, rotation = 0, origin = {-121, -73}), iconTransformation(extent = {{-17, -17}, {17, 17}}, origin = {-119, -71})));
  Modelica.Blocks.Math.Add VERR(k1 = -1, k2 = 1) annotation(Placement(transformation(extent = {{-8, 8}, {8, -8}}, rotation = 0, origin = {-14, -8})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation(Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 0, origin = {-121, -43}), iconTransformation(extent = {{-17, -17}, {17, 17}}, origin = {-111, -21})));
  Modelica.Blocks.Math.Add VERR1 annotation(Placement(transformation(extent = {{-9, 9}, {9, -9}}, rotation = 0, origin = {97, -15})));
  NonElectrical.Logical.LV_GATE lV_Gate annotation(Placement(transformation(extent = {{42, -32}, {68, -2}})));
  NonElectrical.Logical.HV_GATE hV_Gate annotation(Placement(transformation(extent = {{18, -20}, {44, 8}})));
  NonElectrical.Continuous.LeadLagLim LL1(K = 1, outMax = V_RMAX / KR, outMin = V_RMIN / KR, T1 = T_C1, T2 = T_B1, y_start = VR0 / KR) annotation(Placement(transformation(extent = {{142, -24}, {160, -6}})));
  NonElectrical.Continuous.LeadLagLim LL2(K = 1, outMax = V_RMAX / KR, outMin = V_RMIN / KR, T1 = T_C2, T2 = T_B2, y_start = VR0 / KR) annotation(Placement(transformation(extent = {{180, -24}, {198, -6}})));
  Modelica.Blocks.Math.Gain K_R(k = KR) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {250, -10})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = V_RMAX, uMin = V_RMIN) annotation(Placement(transformation(extent = {{270, -20}, {290, 0}})));
  Modelica.Blocks.Math.Add VERR2(k1 = -1, k2 = 1) annotation(Placement(transformation(extent = {{-9, 9}, {9, -9}}, rotation = 0, origin = {371, -31})));
  Modelica.Blocks.Math.Gain K_c(k = K_C) annotation(Placement(transformation(extent = {{-9, -9}, {9, 9}}, rotation = 0, origin = {21, -129})));
  Modelica.Blocks.Math.Gain Vmin(k = V_RMIN) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {248, -52})));
  Modelica.Blocks.Math.Gain Vmax(k = V_RMAX) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {248, -36})));
  NonElectrical.Continuous.SimpleLagLimVar simpleLagLimVar(K = 1, T = T_1, y_start = VR0) annotation(Placement(transformation(extent = {{320, -20}, {340, 0}})));
protected
  parameter Real VREF(fixed = false);
  parameter Real Vm0(fixed = false);
  parameter Real VR0(fixed = false);
initial equation
  VR0 = EFD0 + K_C * XADIFD;
  VREF = VR0 / KR + ECOMP;
  Vm0 = ECOMP;
equation
  connect(VOTHSG, VERR1.u2) annotation(Line(points = {{-121, -73}, {76, -73}, {76, -9.6}, {86.2, -9.6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(K_R.y, limiter.u) annotation(Line(points = {{261, -10}, {268, -10}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(XADIFD, K_c.u) annotation(Line(points = {{-125, -129}, {-88, -129}, {-88, -130}, {-54, -130}, {-54, -129}, {10.2, -129}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(K_c.y, VERR2.u1) annotation(Line(points = {{30.9, -129}, {350, -129}, {350, -36.4}, {360.2, -36.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VERR2.y, EFD) annotation(Line(points = {{380.9, -31}, {383.45, -31}, {383.45, -30}, {420, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V_REF, VERR.u2) annotation(Line(points = {{-111, 59}, {-40, 59}, {-40, -3.2}, {-23.6, -3.2}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VUEL, hV_Gate.n1) annotation(Line(points = {{-119, 93}, {15.5, 93}, {15.5, -3.48}, {21.9, -3.48}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VERR.y, hV_Gate.n2) annotation(Line(points = {{-5.2, -8}, {8, -8}, {8, -9.64}, {21.9, -9.64}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VOEL, lV_Gate.n2) annotation(Line(points = {{-121, -43}, {42, -43}, {42, -20.9}, {45.9, -20.9}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(hV_Gate.p, lV_Gate.n1) annotation(Line(points = {{38.67, -6.7}, {42, -6.7}, {42, -14.3}, {45.9, -14.3}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(VERR1.u1, lV_Gate.p) annotation(Line(points = {{86.2, -20.4}, {74, -20.4}, {74, -17.75}, {62.67, -17.75}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Vm.u, ECOMP) annotation(Line(points = {{-89.8, -13}, {-100.9, -13}, {-125, -13}}, color = {0, 0, 127}));
  connect(Vm.y, VERR.u1) annotation(Line(points = {{-69.1, -13}, {-46.55, -13}, {-46.55, -12.8}, {-23.6, -12.8}}, color = {0, 0, 127}));
  connect(LL1.u, VERR1.y) annotation(Line(points = {{140.2, -15}, {140.2, -15}, {106.9, -15}}, color = {0, 0, 127}));
  connect(Vmax.u, ECOMP) annotation(Line(points = {{240.8, -36}, {-98, -36}, {-98, -14}, {-100.9, -13}, {-125, -13}}, color = {0, 0, 127}));
  connect(Vmin.u, ECOMP) annotation(Line(points = {{240.8, -52}, {230, -52}, {230, -36}, {-98, -36}, {-98, -14}, {-100.9, -13}, {-125, -13}}, color = {0, 0, 127}));
  connect(LL1.y, LL2.u) annotation(Line(points = {{160.9, -15}, {160.9, -15}, {178.2, -15}}, color = {0, 0, 127}));
  connect(LL2.y, K_R.u) annotation(Line(points = {{198.9, -15}, {228, -15}, {228, -10}, {238, -10}}, color = {0, 0, 127}));
  connect(simpleLagLimVar.y, VERR2.u2) annotation(Line(points = {{341, -10}, {350, -10}, {350, -26}, {356, -26}, {356, -25.6}, {360.2, -25.6}}, color = {0, 0, 127}));
  connect(Vmax.y, simpleLagLimVar.outMax) annotation(Line(points = {{254.6, -36}, {300, -36}, {300, 20}, {338, 20}, {338, 4}}, color = {0, 0, 127}));
  connect(limiter.y, simpleLagLimVar.u) annotation(Line(points = {{291, -10}, {304.5, -10}, {318, -10}}, color = {0, 0, 127}));
  connect(Vmin.y, simpleLagLimVar.outMin) annotation(Line(points = {{254.6, -52}, {322, -52}, {322, -24}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-120, -200}, {420, 120}}), graphics = {Text(extent=  {{50, -2}, {56, -12}}, lineColor=  {255, 0, 0}, textString=  "VS"), Text(extent=  {{-24, 16}, {-10, 0}}, lineColor=  {255, 0, 0}, textString=  "VERR")}), Icon(coordinateSystem(extent = {{-120, -200}, {420, 120}}, preserveAspectRatio = true), graphics = {Text(extent=  {{42, 14}, {234, -78}}, lineColor=  {0, 0, 255}, textString=  "URST5T"), Rectangle(extent=  {{-100, 120}, {300, -200}}, lineColor=  {0, 0, 255}), Text(extent=  {{-76, 136}, {-10, 56}}, lineColor=  {0, 0, 255}, textString=  "ECOMP"), Text(extent=  {{-76, -50}, {2, -84}}, lineColor=  {0, 0, 255}, textString=  "VOTHSG"), Text(extent=  {{-76, -94}, {-16, -158}}, lineColor=  {0, 0, 255}, textString=  "XADIFD"), Text(extent=  {{-76, 52}, {-24, -12}}, lineColor=  {0, 0, 255}, textString=  "VUEL"), Text(extent=  {{-90, -168}, {-26, -188}}, lineColor=  {0, 0, 255}, textString=  "EFD0"), Text(extent=  {{-76, 10}, {-24, -52}}, lineColor=  {0, 0, 255}, textString=  "VOEL"), Text(extent=  {{256, -6}, {294, -68}}, lineColor=  {0, 0, 255}, textString=  "EFD"), Text(extent=  {{-76, 92}, {-26, 28}}, lineColor=  {0, 0, 255}, textString=  "VREF")}), Documentation(info = "<html>
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
end URST5T;
