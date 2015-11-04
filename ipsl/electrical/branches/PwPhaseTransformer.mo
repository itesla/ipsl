within iPSL.Electrical.Branches;
class PwPhaseTransformer "Two winding fixed transformer composed of an ideal transformer, a series 
              impedance and a shunt admittance.
              2014/03/10"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-8},
            {-60,12}}), iconTransformation(extent={{-80,-8},{-60,12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-8},
            {80,12}}), iconTransformation(extent={{60,-8},{80,12}})));
  // INPUT parameters
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real r "Transformation ratio";
  parameter Real G0 "Shunt conductance p.u.";
  parameter Real B0 "Shunt susceptance p.u.";
  parameter Real theta;
  // Calculated parameters
  parameter Real theta_rad = -theta * 3.141592 / 180;
  parameter Real Z2 = R * R + X * X;
  parameter Real G = if Z2 == 0 then 0 else R / Z2;
  parameter Real B = if Z2 == 0 then 0 else -X / Z2;
  parameter Real Gi = G0 / 2;
  parameter Real Bi = B0 / 2;
  parameter Real Gj = G0 / 2;
  parameter Real Bj = B0 / 2;
  //ADMITTANCE matrix
  parameter Real G11 = G * (r * r - r * cos(theta_rad)) + B * r * sin(theta_rad) + Gi + G * r * cos(theta_rad) - B * r * sin(theta_rad);
  parameter Real B11 = B * (r * r - r * cos(theta_rad)) - G * r * sin(theta_rad) + Bi + B * r * cos(theta_rad) + G * r * sin(theta_rad);
  parameter Real G12 = (-G * r * cos(theta_rad)) + B * r * sin(theta_rad);
  parameter Real B12 = (-B * r * cos(theta_rad)) - G * r * sin(theta_rad);
  parameter Real G21 = (-G * r * cos(theta_rad)) - B * r * sin(theta_rad);
  parameter Real B21 = (-B * r * cos(theta_rad)) + G * r * sin(theta_rad);
  parameter Real G22 = G * (1 - r * cos(theta_rad)) - B * r * sin(theta_rad) + Gj + G * r * cos(theta_rad) + B * r * sin(theta_rad);
  parameter Real B22 = B * (1 - r * cos(theta_rad)) + G * r * sin(theta_rad) + Bj + B * r * cos(theta_rad) - G * r * sin(theta_rad);
equation
  p.ir = p.vr * G11 - p.vi * B11 + n.vr * G12 - n.vi * B12;
  p.ii = p.vi * G11 + p.vr * B11 + n.vi * G12 + n.vr * B12;
  n.ir = p.vr * G21 - p.vi * B21 + n.vr * G22 - n.vi * B22;
  n.ii = p.vi * G21 + p.vr * B21 + n.vi * G22 + n.vr * B22;
  annotation(Icon(graphics={  Rectangle(extent=  {{-60, 40}, {60, -40}}, lineColor=  {0, 0, 255}), Ellipse(extent=  {{-26, 16}, {6, -16}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    1), Ellipse(extent=  {{-8, 16}, {24, -16}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    1), Line(points=  {{-42, 0}, {-26, 0}}, color=  {0, 0, 255}, thickness=  1, smooth=  Smooth.None), Line(points=  {{24, 0}, {40, 0}}, color=  {0, 0, 255}, thickness=  1, smooth=  Smooth.None)}), Diagram(graphics),
    Documentation(info="<html>
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
end PwPhaseTransformer;
