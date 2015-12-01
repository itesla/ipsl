within iPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer_1;
model pst2 "Angle part of PST"
  constant Real pi = Modelica.Constants.pi;
  parameter Real SystemBase = 100;
  parameter Real Vbus1 = 20000
    "Sending end Bus nominal voltage, change of base";
  parameter Real Vbus2 = 20000 "Receiving end Bus voltage, change of base";
  parameter Real Sn = 100 "Power rating MVA";
  parameter Real Vn1 = 20000 "Primary Voltage rating,KV";
  parameter Real Vn2 = 20000 "Secondary voltage rating, KV";
  parameter Real fn = 50 "Frequency rating Hz";
  parameter Real Tm = 0.001 "Measurement time constant, s";
  parameter Real Kp = 0.05 "Proportional gain";
  parameter Real Ki = 0.01 "Integral gain";
  parameter Real p_ref = 0.01 "Reference Power, p.u.";
  parameter Real alpha_max = pi / 2 "Maximum phase angle, rad";
  parameter Real alpha_min = -pi / 2 "Minimum phase angle, rad";
  parameter Real xT = 0.1 "Transformer Reactance, p.u.";
  parameter Real rT = 0.01 "Transformer Resistance, p.u.";
  parameter Real m = 0.98 "Transformer fixed tap  ratio, p.u./p.u.";
  parameter Real alpha0 = 0.002062339234360 "Initial angle, from power flow";
  parameter Real pmes0 = 0.01 "from power flow";
  parameter Real vm0 = 1.007257703014177
    "Receiving end bus voltage, from power flow";
  parameter Real anglevm0 = -0.009372077496959
    "Receiving end bus angle, from power flow";
  Real vk;
  Real vm(start = vm0) "Voltage at secondary p.u.";
  Real anglevk "Angle at primary";
  Real anglevm;
  Real alpha;
  Real pmes;
  iPSL.Connectors.PwPin p annotation(Placement(visible = true, transformation(extent = {{-120, -8}, {-100, 12}})));
  iPSL.Connectors.PwPin n annotation(Placement(transformation(extent = {{100, -8}, {120, 12}})));
  Modelica.Blocks.Interfaces.RealInput pk annotation(Placement(transformation(extent = {{-142, -62}, {-102, -22}})));
protected
  parameter Real Vb2new = Vbus1 * Vbus1;
  parameter Real Vb2old = Vn1 * Vn1;
  parameter Real R = rT * (Vb2old * SystemBase) / (Vb2new * Sn)
    "Transformer Resistance, p.u.";
  parameter Real X = xT * (Vb2old * SystemBase) / (Vb2new * Sn)
    "Transformer Reactance, p.u.";
  parameter Real pref = p_ref * (Sn / SystemBase);
  parameter Real gt = R / (R ^ 2 + X ^ 2)
    "Converting resistance to conductance p.u.";
  parameter Real bt = -X / (R ^ 2 + X ^ 2)
    "Converting reactance to susceptance p.u.";
initial equation
  alpha = alpha0;
  pmes = pmes0;
equation
  vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
  vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  if alpha > alpha_max and der(alpha) > 0 and der(pmes) > 0 then
    der(alpha) = 0;
    der(pmes) = (pk - pmes) / Tm;
    p.vr = n.vr * cos(alpha_max) - n.vi * sin(alpha_max);
    p.vi = n.vr * sin(alpha_max) + n.vi * cos(alpha_max);
    p.ir + n.ir = 0;
    p.ii + n.ii = 0;
  elseif alpha < alpha_min and der(alpha) < 0 and der(pmes) < 0 then
    der(alpha) = 0;
    der(pmes) = (pk - pmes) / Tm;
    p.vr = n.vr * cos(alpha_min) - n.vi * sin(alpha_min);
    p.vi = n.vr * sin(alpha_min) + n.vi * cos(alpha_min);
    p.ir + n.ir = 0;
    p.ii + n.ii = 0;
  else
    der(alpha) = Kp * (pk - pmes) / Tm + Ki * (pmes - pref);
    der(pmes) = (pk - pmes) / Tm;
    p.vr = n.vr * cos(alpha) - n.vi * sin(alpha);
    p.vi = n.vr * sin(alpha) + n.vi * cos(alpha);
    p.ir + n.ir = 0;
    p.ii + n.ii = 0;
  end if;
  annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})), Placement(transformation(extent = {{100, -10}, {120, 10}})), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
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
end pst2;

