within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model OLTC
  "Original developed by Mengjia and has been improved by Jan from KTH"
  //outer parameter Boolean ControlledOnFromSide;
  outer parameter Real initialtapratio = 1;
  parameter Real Vmax = 1.1;
  parameter Real Vmin = 0.9;
  parameter Real rmax = 1.1;
  parameter Real rmin = 0.9;
  parameter Real Ntap = 33 "Number of tap positions";
  parameter Real Td = 17.0 "Regulator delay";
  parameter Real TC = 5 "motor delay";
  parameter Real TSD "delay between two subsequent tap changes";
  parameter Real dtap = (rmax - rmin) / (Ntap - 1);
  parameter Real Rmax = 1 + (rmax - rmin) / 2;
  parameter Real Rmin = 1 - (rmax - rmin) / 2;
  Modelica.Blocks.Interfaces.RealInput u "Measured input, typically Voltage" annotation(Placement(transformation(extent = {{-124, -6}, {-84, 34}})));
  Modelica.Blocks.Interfaces.RealOutput y(start = initialtapratio, fixed = true)
    "Tap-ratio output"                                                                              annotation(Placement(transformation(extent = {{84, 4}, {104, 24}})));
  Real RegulatorTimer(start = 0, fixed = true) "Timer for the regulator";
  Integer voltageDiff(start = 0, fixed = true)
    "Direction of the voltage difference";
  Integer tapMoved(start = 0, fixed = true)
    "Number of steps the taps has moved.";
  Integer tapDirection(start = 0, fixed = true);
  discrete Real m(start = initialtapratio, fixed = true);
  Boolean MotorEnabled(start = false, fixed = true);
  Real MotorTimer(start = 0, fixed = true);
  Boolean ResetTimer(start = false, fixed = true);
  Boolean StartTimer(start = true, fixed = true);
equation
  // Check difference between scheduled and measured voltage.
  if u - Vmax > 0 then
    voltageDiff = -1;
  elseif Vmin - u > 0 then
    voltageDiff = 1;
  else
    voltageDiff = 0;
  end if;
  // Set resetRegulatorTimer if difference exists.
  when ResetTimer then
    reinit(MotorTimer, 0);
  end when;
  // Let timer run if we have a large enough difference
  when voltageDiff <> 0 and StartTimer then
    tapDirection = if RegulatorTimer <= 0 then voltageDiff else pre(tapDirection);
  end when;
  when RegulatorTimer <= 0 or RegulatorTimer >= 1 then
    MotorEnabled = if RegulatorTimer >= 1 then true else false;
  end when;
  if RegulatorTimer <= 0 then
    der(RegulatorTimer) = if voltageDiff <> 0 then 1 / Td else 0;
    ResetTimer = false;
    StartTimer = true;
  elseif RegulatorTimer >= 1 then
    der(RegulatorTimer) = if tapDirection == voltageDiff then 0 else -1 / Td;
    ResetTimer = true;
    StartTimer = false;
  elseif RegulatorTimer < 1 then
    der(RegulatorTimer) = if tapDirection == voltageDiff then 1 / Td else -1 / Td;
    ResetTimer = false;
    StartTimer = false;
  else
    der(RegulatorTimer) = 0;
    ResetTimer = false;
    StartTimer = true;
  end if;
  if MotorEnabled and MotorTimer < 1 then
    der(MotorTimer) = 1 / TC;
  elseif MotorEnabled then
    der(MotorTimer) = if TSD > 0 then 1 / TSD else 1 / TC;
  else
    der(MotorTimer) = 0;
  end if;
  tapMoved = integer(MotorTimer);
  when change(tapMoved) and tapMoved <> 0 and pre(MotorEnabled) then
    m = pre(m) + dtap * pre(tapDirection);
  end when;
  if m >= Rmax then
    y = Rmax;
  elseif m <= Rmin then
    y = Rmin;
  else
    y = m;
  end if;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-94, 70}, {90, -80}}, lineColor=  {0, 0, 255}), Text(extent=  {{-50, 34}, {54, -50}}, lineColor=  {0, 0, 255}, textString=  "OLTC")}), Documentation(info = "<html>
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
end OLTC;

