within iPSL.Electrical.Banks;
model PwShuntR "Shunt inductor"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-10,40},
            {10,60}}), iconTransformation(extent={{-10,40},{10,60}})));
  constant Real pi = Modelica.Constants.pi;
  parameter Real Qnom = 75
    "Reactive power produced by the shunt inductor under 1 p.u voltage, -Mvar";
  parameter Real Vbase = 138 "Base volatage of the bus, kV";
  parameter Real fn = 50 "Frequency rating, Hz";
  Real Zbase;
  Real L "Inductance in p.u";
  Real v;
  Real anglev;
  Real i;
  Real anglei;
equation
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  anglev = atan2(p.vi, p.vr);
  i = sqrt(p.ir ^ 2 + p.ii ^ 2);
  anglei = atan2(p.ii, p.ir);
  Zbase = Vbase ^ 2 / (-Qnom);
  L = Vbase ^ 2 / (2 * pi * fn * (-Qnom) * Zbase) "S=U*I";
  anglei = anglev - pi / 2;
  i = v / (2 * pi * fn * L) "I=U/Z";
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-12, 30}, {10, 8}}, lineColor = {0, 0, 255},
            lineThickness =                                                                                                   0.5), Rectangle(extent = {{0, 32}, {30, -4}},
            lineThickness =                                                                                                   1, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, pattern = LinePattern.None), Line(points = {{0, 40}, {0, 30}}, thickness = 1, smooth = Smooth.None, color = {0, 0, 255}), Ellipse(extent = {{-12, 8}, {10, -14}}, lineColor = {0, 0, 255},
            lineThickness =                                                                                                   0.5), Rectangle(extent = {{2, 10}, {32, -26}},
            lineThickness =                                                                                                   1, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, pattern = LinePattern.None), Ellipse(extent = {{-12, -14}, {10, -36}}, lineColor = {0, 0, 255},
            lineThickness =                                                                                                   0.5), Rectangle(extent = {{0, -6}, {30, -42}},
            lineThickness =                                                                                                   1, fillColor = {255, 255, 255},
            fillPattern =                                                                                                   FillPattern.Solid, pattern = LinePattern.None), Rectangle(extent = {{-40, 40}, {40, -46}}, lineColor = {0, 0, 255})}),
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
end PwShuntR;
