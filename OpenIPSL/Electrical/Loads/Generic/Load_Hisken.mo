within OpenIPSL.Electrical.Loads.Generic;
model Load_Hisken "Load based on Hisken"
  parameter Real P0 = 0.4 "Active power";
  parameter Real Q0 = 0 "Reactive power";
  parameter Real Pt = 0.4;
  parameter Real As = 0;
  parameter Real At = 2;
  parameter Real Bs = 0;
  parameter Real Bt = 2;
  parameter Real Tp = 5;
  parameter Real Tq = 5;
  Real Pd(start = P0, fixed = true);
  Real xp;
  Real v;
  Real angle;
  //Real Pt;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-10,90},{10,110}})));
equation
  der(xp) = 1 / Tp * (P0 - Pd);
  Pd = xp + Pt * v ^ 2;
  Pd = p.vr * p.ir + p.vi * p.ii;
  Q0 = p.vi * p.ir - p.vr * p.ii;
  angle = atan2(p.vi, p.vr);
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  annotation (Icon(graphics={      Line(points={{-100,100},{100,100},{0,-100},{
          -100,100}}, color={28,108,200}),Text(
          extent={{-60,80},{60,40}},
          lineColor={28,108,200},
          textString="%P0+j%Q0")}));
end Load_Hisken;
