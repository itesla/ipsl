within iPSL.Electrical.Wind.PSSE.WT3G;


model WT3G1
  constant Real pi = Modelica.Constants.pi;
  parameter Real eterm "Terminal voltage";
  parameter Real anglev0 "Power flow, node angle in degree";
  parameter Real pelec "Active power MW";
  parameter Real qelec "Reactive power MVar";
  parameter Real wbase = 2 * pi * 50 "System base speed";
  parameter Real Sbase;
  parameter Real Xeq "Equivalent reactance for current injection (pu)";
  parameter Real Kpll "PLL first integrator gain";
  parameter Real Kipll "PLL second integrator gain";
  parameter Real Pllmax "PLL maximum limit";
  parameter Real Prated "Turbine MW rating, not used in the equation";
  parameter Complex Zs(re = 0, im = Xeq) "Equivalent impedance";
  parameter Real Mbase = 100 "machine base specified by power flow";
  parameter Real p0 = pelec / Mbase
    "initial value of bus active power in p.u. machinebase";
  parameter Real q0 = qelec / Mbase
    "initial value of bus reactive power in p.u. machinebase";
  parameter Real v0 = eterm;
  parameter Real vr0 = v0 * cos(anglev_rad)
    "Real component of initial terminal voltage";
  parameter Real vi0 = v0 * sin(anglev_rad)
    "Imaginary component of intitial terminal voltage";
  parameter Real ir0 = (p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2)
    "Real component of initial armature current, mbase";
  parameter Real ii0 = (p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2)
    "Imaginary component of initial armature current, mbase";
  parameter Real Isr0 = ir0 + vi0 / Xeq "Sorce current re mbase";
  parameter Real Isi0 = ii0 - vr0 / Xeq "Sorce current im mbase";
  parameter Real CoB = Mbase / Sbase;
  parameter Real ir1 = -CoB * (p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2)
    "Real component of initial armature current, sbase";
  parameter Real ii1 = -CoB * (p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2)
    "Imaginary component of initial armature current, sbase";
  parameter Real Ix0 = Isr0 * cos(-anglev_rad) - Isi0 * sin(-anglev_rad);
  parameter Real Iy0 = Isr0 * sin(-anglev_rad) + cos(-anglev_rad) * Isi0;
  parameter Real Eqcmd0 = -Iy0 * Xeq;
  parameter Real Ipcmd0 = Ix0;
  parameter Real anglev_rad = anglev0 * pi / 180
    "initial value of bus anglev in rad";
  parameter Real VX0 = cos(anglev_rad) * vr0 + sin(anglev_rad) * vi0;
  parameter Real VY0 = (-sin(anglev_rad) * vr0) + cos(anglev_rad) * vi0;
  Real VT(start = eterm) "Bus voltage magnitude";
  Real anglev(start = anglev_rad) "Bus voltage angle";
  Real VY(start = 0) "y-axis terminal voltage";
  Real VX(start = eterm) "x-axis terminal voltage";
  Complex Is "Equivalent internal current source";
  iPSL.Connectors.PwPin p(vr(start = vr0), vi(start = vi0), ir(start = ir1), ii(start = ii1)) annotation(Placement(transformation(extent = {{-100, 34}, {-80, 54}}), iconTransformation(extent = {{-100, 34}, {-80, 54}})));
  Modelica.Blocks.Continuous.Integrator imIntegrator(k = wbase, y_start = anglev_rad, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{34, -20}, {44, -10}})));
  Modelica.Blocks.Continuous.LimIntegrator imIntegrator1(outMin = -Pllmax, outMax = Pllmax, k = 0, y_start = 0, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(transformation(extent = {{-32, -10}, {-22, 0}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(K = 1, T = 0.02, y_start = Eqcmd0) annotation(Placement(transformation(extent = {{-30, 64}, {-12, 82}})));
  iPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(K = 1, T = 0.02, y_start = Ix0) annotation(Placement(transformation(extent = {{-30, 30}, {-12, 48}})));
  Modelica.Blocks.Math.Gain imGain(k = -1 / Xeq) annotation(Placement(transformation(extent = {{2, 64}, {20, 82}})));
  Modelica.Blocks.Interfaces.RealOutput Iy(start = Iy0) annotation(Placement(transformation(extent = {{50, 26}, {68, 44}}), iconTransformation(extent = {{50, 26}, {68, 44}})));
  Modelica.Blocks.Interfaces.RealOutput Ix(start = Ix0) annotation(Placement(transformation(extent = {{50, 2}, {68, 20}}), iconTransformation(extent = {{50, 2}, {68, 20}})));
  Modelica.Blocks.Interfaces.RealOutput Iterm(start = Iy0) annotation(Placement(transformation(extent = {{108, 24}, {126, 42}}), iconTransformation(extent = {{108, 24}, {126, 42}})));
  Modelica.Blocks.Interfaces.RealInput Eqcmd(start = Eqcmd0) annotation(Placement(transformation(extent = {{-120, 54}, {-82, 92}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {98, 84})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd(start = Ipcmd0) annotation(Placement(transformation(extent = {{-120, 20}, {-82, 58}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {98, 56})));
  Modelica.Blocks.Math.Gain imGain1(k = Kpll / wbase) annotation(Placement(transformation(extent = {{-52, -26}, {-40, -14}})));
  Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{-8, -24}, {10, -6}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin = -Pllmax, uMax = Pllmax) annotation(Placement(transformation(extent = {{16, -20}, {26, -10}})));
  Modelica.Blocks.Interfaces.RealOutput delta(start = anglev_rad) annotation(Placement(transformation(extent = {{50, -24}, {68, -6}}), iconTransformation(extent = {{50, -24}, {68, -6}})));
  Modelica.Blocks.Interfaces.RealOutput V = VT annotation(Placement(transformation(extent = {{108, 2}, {126, 20}}), iconTransformation(extent = {{108, 2}, {126, 20}})));
  Modelica.Blocks.Interfaces.RealOutput P "On machine base" annotation(Placement(transformation(extent = {{100, -64}, {118, -46}}), iconTransformation(extent = {{108, -42}, {126, -24}})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation(Placement(transformation(extent = {{100, -88}, {118, -70}}), iconTransformation(extent = {{108, -20}, {126, -2}})));
  Modelica.Blocks.Interfaces.RealOutput ipcmd0 = Ipcmd0 annotation(Placement(transformation(extent = {{30, -86}, {48, -68}}), iconTransformation(extent = {{-9, -9}, {9, 9}}, rotation = 90, origin = {13, 105})));
  Modelica.Blocks.Interfaces.RealOutput eqcmd0 = Eqcmd0 annotation(Placement(transformation(extent = {{30, -62}, {48, -44}}), iconTransformation(extent = {{-9, -9}, {9, 9}}, rotation = 90, origin = {-27, 105})));
protected
  Modelica.Blocks.Interfaces.RealInput Vy annotation(Placement(transformation(extent = {{-118, -40}, {-80, -2}}), iconTransformation(extent = {{-118, -40}, {-96, -18}})));
initial equation
  delta = anglev_rad;
equation
  anglev = atan2(p.vi, p.vr);
  VT = sqrt(p.vr * p.vr + p.vi * p.vi);
  Iterm = sqrt(p.ir * p.ir + p.ii * p.ii);
  Is.re = p.ir / CoB - p.vi / Xeq;
  //Note that, the positive direction for p.ir is the antidirection of ir0
  Is.im = p.ii / CoB + p.vr / Xeq;
  Vy = VY;
  [Ix; Iy] = -[cos(delta), sin(delta); -sin(delta), cos(delta)] * [Is.re; Is.im];
  [VX; VY] = [cos(delta), sin(delta); -sin(delta), cos(delta)] * [p.vr; p.vi];
  -P = p.vr * p.ir / CoB + p.vi * p.ii / CoB;
  -Q = p.vi * p.ir / CoB - p.vr * p.ii / CoB;
  connect(Eqcmd, imSimpleLag.u) annotation(Line(points = {{-101, 73}, {-66.5, 73}, {-66.5, 73}, {-31.8, 73}}, color = {0, 0, 127}));
  connect(Ipcmd, imSimpleLag1.u) annotation(Line(points = {{-101, 39}, {-66.5, 39}, {-66.5, 39}, {-31.8, 39}}, color = {0, 0, 127}));
  connect(add.y, imLimited.u) annotation(Line(points = {{10.9, -15}, {12.45, -15}, {15, -15}}, color = {0, 0, 127}));
  connect(imLimited.y, imIntegrator.u) annotation(Line(points = {{26.5, -15}, {27.65, -15}, {33, -15}}, color = {0, 0, 127}));
  connect(imIntegrator.y, delta) annotation(Line(points = {{44.5, -15}, {48.25, -15}, {59, -15}}, color = {0, 0, 127}));
  connect(imGain1.y, add.u2) annotation(Line(points = {{-39.4, -20}, {-9.8, -20}, {-9.8, -20.4}}, color = {0, 0, 127}));
  connect(imIntegrator1.y, add.u1) annotation(Line(points = {{-21.5, -5}, {-14, -5}, {-14, -9.6}, {-9.8, -9.6}}, color = {0, 0, 127}));
  connect(imIntegrator1.u, add.u2) annotation(Line(points = {{-33, -5}, {-36, -5}, {-36, -20}, {-9.8, -20}, {-9.8, -20.4}}, color = {0, 0, 127}));
  connect(Vy, imGain1.u) annotation(Line(points = {{-99, -21}, {-76.5, -21}, {-76.5, -20}, {-53.2, -20}}, color = {0, 0, 127}));
  connect(imSimpleLag.y, imGain.u) annotation(Line(points = {{-11.1, 73}, {-4.55, 73}, {-4.55, 73}, {0.2, 73}}, color = {0, 0, 127}));
  connect(imGain.y, Iy) annotation(Line(points = {{20.9, 73}, {40, 73}, {40, 35}, {59, 35}}, color = {0, 0, 127}));
  connect(imSimpleLag1.y, Ix) annotation(Line(points = {{-11.1, 39}, {22, 39}, {22, 11}, {59, 11}}, color = {0, 0, 127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-102, 96}, {108, -48}}, lineColor=  {0, 0, 255}), Text(extent=  {{-40, 76}, {44, 38}}, lineColor=  {0, 0, 255}, textString=  "WT3G1")}), Documentation(info = "<html>
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
end WT3G1;
