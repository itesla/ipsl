within iPSL.Electrical.Branches;
model PwLine_2 "Model for a transmission Line based on the pi-equivalent circuit 
  with explicit equations for currents. Developed by RTE. 2014/12/16"
  iPSL.Connectors.PwPin p annotation(Placement(transformation(extent = {{-80, -10}, {-60, 10}}), iconTransformation(extent = {{-80, -10}, {-60, 10}})));
  iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{60, -10}, {80, 10}}), iconTransformation(extent = {{60, -10}, {80, 10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
  parameter Real Y = 1 / sqrt(R * R + X * X);
  parameter Real angle = atan2(R, X);
  parameter Real S1 = B;
  parameter Real S2 = B;
  parameter Real C1 = G;
  parameter Real C2 = G;
  //I=f(U);
  //I1
  parameter Real ir1_dur1 = Y * sin(angle) + C1;
  parameter Real ir1_dui1 = (-S1) + Y * cos(angle);
  parameter Real ir1_dur2 = -Y * sin(angle);
  parameter Real ir1_dui2 = -Y * cos(angle);
  parameter Real ii1_dur1 = S1 - Y * cos(angle);
  parameter Real ii1_dui1 = Y * sin(angle) + C1;
  parameter Real ii1_dur2 = Y * cos(angle);
  parameter Real ii1_dui2 = -Y * sin(angle);
  // I2
  parameter Real ir2_dur1 = -Y * sin(angle);
  parameter Real ir2_dui1 = -Y * cos(angle);
  parameter Real ir2_dur2 = C2 + Y * sin(angle);
  parameter Real ir2_dui2 = (-S2) + Y * cos(angle);
  parameter Real ii2_dur1 = Y * cos(angle);
  parameter Real ii2_dui1 = -Y * sin(angle);
  parameter Real ii2_dur2 = S2 - Y * cos(angle);
  parameter Real ii2_dui2 = C2 + Y * sin(angle);
  // Active, Reactive and Apparent power
  Real Ps "Active power at sending";
  Real Pr "Active power at receiving";
  Real Qs "Reactive power at sending";
  Real Qr "Reactive power at receiving";
  Real Ss "Apparent power at sending";
  Real Sr "Apparent power at receiving";
equation
  n.ir = ir1_dur1 * n.vr + ir1_dui1 * n.vi + ir1_dur2 * p.vr + ir1_dui2 * p.vi;
  n.ii = ii1_dur1 * n.vr + ii1_dui1 * n.vi + ii1_dur2 * p.vr + ii1_dui2 * p.vi;
  p.ir = ir2_dur1 * n.vr + ir2_dui1 * n.vi + ir2_dur2 * p.vr + ir2_dui2 * p.vi;
  p.ii = ii2_dur1 * n.vr + ii2_dui1 * n.vi + ii2_dur2 * p.vr + ii2_dui2 * p.vi;
  Ps = p.vr * p.ir + p.vi * p.ii;
  Qs = (-p.vr * p.ii) + p.vi * p.ir;
  Ss = sqrt(Ps ^ 2 + Qs ^ 2);
  Pr = n.vr * n.ir + n.vi * n.ii;
  Qr = (-n.vr * n.ii) + n.vi * n.ir;
  Sr = sqrt(Pr ^ 2 + Qr ^ 2);
  annotation(Icon(graphics = {Rectangle(extent=  {{-60, 40}, {60, -42}}, lineColor=  {0, 0, 255}), Rectangle(extent=  {{-40, 10}, {40, -10}}, lineColor=  {0, 0, 255}, fillColor=  {95, 95, 95}, fillPattern=  FillPattern.Solid)}), Diagram(graphics), Documentation(info = "<html>
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
end PwLine_2;

