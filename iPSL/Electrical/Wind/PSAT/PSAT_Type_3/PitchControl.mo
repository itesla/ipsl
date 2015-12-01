within iPSL.Electrical.Wind.PSAT.PSAT_Type_3;


model PitchControl
  Modelica.Blocks.Interfaces.RealInput omega_m "Real voltage" annotation(Placement(transformation(extent = {{-102.0, 54.0}, {-62.0, 94.0}}, origin = {-43.0, -74.0}, rotation = 0), visible = true, iconTransformation(origin = {2.0, -74.0}, extent = {{-102.0, 54.0}, {-62.0, 94.0}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput theta_p(start = theta_p0)
    "saturated theta_p"                                                               annotation(Placement(transformation(extent = {{102.0, 54.0}, {62.0, 94.0}}, origin = {46.3073, -74.0}, rotation = 0), visible = true, iconTransformation(origin = {-2.0, -74.0}, extent = {{102.0, 54.0}, {62.0, 94.0}}, rotation = 0)));
  parameter Real Kp = 10 "Pitch control gain (pu)";
  parameter Real Tp = 3 "Pitch control time constant (s)";
  parameter Real theta_p0 = 0;
  parameter Real theta_p_min;
  parameter Real theta_p_max;
  Real theta_pI "internal non-saturated theta_p";
  Real phi;
initial equation
  (Kp * phi - theta_pI) / Tp = 0;
equation
  theta_p = min(max(theta_pI, theta_p_min), theta_p_max);
  phi = ceil(0.5 * floor(1000 * (omega_m - 1) * 2)) / 1000;
  der(theta_pI) = (Kp * phi - theta_p) / Tp;
  when theta_pI > theta_p_max and der(theta_pI) < 0 then
    reinit(theta_pI, theta_p_max);
  elsewhen theta_pI < theta_p_min and der(theta_pI) > 0 then
    reinit(theta_pI, theta_p_min);
  end when;
  annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible=  true, fillColor=  {255, 255, 255}, extent=  {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible=  true, origin=  {0.0, 3.0984}, fillPattern=  FillPattern.Solid, extent=  {{-44.9792, -41.316}, {44.9792, 41.316}}, textString=  "pitch", fontName=  "Arial")}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Documentation(info = "<html>
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
end PitchControl;
