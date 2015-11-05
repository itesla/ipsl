within iPSL.Electrical.Wind.DTU;
model VoltageDrop "Developed by DTU"

  Modelica.Blocks.Interfaces.RealInput Pwt annotation(Placement(transformation(extent = {{-70, 33}, {-60, 47}}), iconTransformation(extent = {{-70, 33}, {-60, 47}})));
  Modelica.Blocks.Interfaces.RealInput Qwt annotation(Placement(transformation(extent = {{-70, -7}, {-60, 7}})));
  Modelica.Blocks.Interfaces.RealInput Uwt annotation(Placement(transformation(extent = {{-70, -47}, {-60, -33}})));
  Modelica.Blocks.Interfaces.RealOutput deltaU annotation(Placement(transformation(extent = {{60, -7}, {70, 7}})));
  parameter Real Rdroop "Resistive component of voltage drop impedance";
  parameter Real Xdroop "Inductive component of voltage drop impedance";
equation
  deltaU = sqrt((Uwt - Rdroop * Pwt / Uwt - Xdroop * Qwt / Uwt) ^ 2 + (Xdroop * Pwt / Uwt - Rdroop * Qwt / Uwt) ^ 2);
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-60, 40}, {60, -40}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Text(extent=  {{-40, 20}, {38, -20}}, lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "Voltage Droop
(Rdroop+jXdroop)")}),
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
end VoltageDrop;
