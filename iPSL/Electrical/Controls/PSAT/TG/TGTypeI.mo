within iPSL.Electrical.Controls.PSAT.TG;
model TGTypeI

  Modelica.Blocks.Interfaces.RealInput w "Rotor speed (pu)"
                                          annotation(Placement(transformation(extent = {{-92, -10}, {-72, 10}}), iconTransformation(extent = {{-94, -4}, {-60, 34}})));
  Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power (pu)"
                                                      annotation(Placement(transformation(extent = {{70, 2}, {90, 22}}), iconTransformation(extent = {{78, -8}, {116, 34}})));
  parameter Real wref = 1 "Speed reference (pu)";
  parameter Real pref "Active power reference (pu)";
  parameter Real R "Droop (pu)";
  parameter Real pmax "Maximum turbine output (pu)";
  parameter Real pmin "Minimum turbine output (pu)";
  parameter Real Ts "Governor time constant (s)";
  parameter Real Tc "Servo time constant (s)";
  parameter Real T3 "Transient gain time constant (s)";
  parameter Real T4 "Power fraction time constant (s)";
  parameter Real T5 "Reheat time constant (s)";

protected
  parameter Real pin0 = pref "Initialization";
  parameter Real xg10 = pin0 "Initialization";
  parameter Real xg20 = (1 - T3 / Tc) * xg10 "Initialization";
  parameter Real xg30 = (1 - T4 / T5) * (xg20 + T3 * xg10 / Tc)
    "Initialization";
  Real pinstar;
  Real xg1(start = xg10, fixed = true);
  Real xg2(start = xg20, fixed = true);
  Real xg3(start = xg30, fixed = true);
public
  Real pin "Turbine output (pu)";
equation
  pinstar = pref + (wref - w) / R;
  if pinstar >= pmin and pinstar <= pmax then
    pin = pinstar;
  elseif pinstar > pmax then
    pin = pmax;
  else
    pin = pmin;
  end if;
  der(xg1) = (pin - xg1) / Ts;
  der(xg2) = ((1 - T3 / Tc) * xg1 - xg2) / Tc;
  der(xg3) = ((1 - T4 / T5) * (xg2 + T3 * xg1 / Tc) - xg3) / T5;
  pm = xg3 + (xg2 + T3 * xg1 / Tc) * T4 / T5;
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {140, 100}}), graphics), Icon(coordinateSystem(extent={{-100,
            -100},{140,100}},                                                                                                    preserveAspectRatio=false),   graphics={  Rectangle(extent = {{-58, 74}, {80, -50}}, lineColor = {0, 0, 255}), Text(extent = {{-74, 38}, {-12, 0}}, lineColor = {0, 0, 255}, textString = "w"), Text(extent = {{34, 22}, {82, -14}}, lineColor = {0, 0, 255}, textString = "pm
"),     Text(
          extent={{-18,-4},{44,-44}},
                    lineColor={0,0,255},
                    textString="TG1")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Turbine and Governor - control scheme Type I</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end TGTypeI;
