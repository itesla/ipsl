within iPSL.Electrical.Controls.PSAT.OEL;
model FieldCurrent

  Modelica.Blocks.Interfaces.RealInput v "generator terminal voltage" annotation(Placement(transformation(extent = {{-82, 32}, {-62, 52}}), iconTransformation(extent = {{-82, 32}, {-50, 66}})));
  Modelica.Blocks.Interfaces.RealInput p "active power " annotation(Placement(transformation(extent = {{-82, -4}, {-62, 16}}), iconTransformation(extent = {{-82, -10}, {-48, 24}})));
  Modelica.Blocks.Interfaces.RealInput q "reactive power" annotation(Placement(transformation(extent = {{-82, -38}, {-62, -18}}), iconTransformation(extent = {{-82, -54}, {-48, -20}})));
  Modelica.Blocks.Interfaces.RealOutput ifield annotation(Placement(transformation(extent = {{58, 4}, {78, 24}}), iconTransformation(extent = {{58, -10}, {90, 24}})));
  parameter Real xd;
  parameter Real xq;
  Real gamap;
  Real gamaq;
equation
  gamap = xq * p / v;
  gamaq = xq * q / v;
  ifield = sqrt((v + gamaq) ^ 2 + p ^ 2) + (xd / xq + 1) * (gamaq * (v + gamaq) + gamap) / sqrt((v + gamaq) ^ 2 + p ^ 2);
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-48, 66}, {60, -52}}, lineColor = {0, 0, 255}), Text(extent = {{-52, 62}, {-20, 42}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "v"), Text(extent = {{-48, 14}, {-20, -2}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "p"), Text(extent = {{-50, -28}, {-22, -44}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "q"), Text(extent = {{36, 12}, {64, -4}}, lineColor = {0, 0, 255},
            fillPattern =                                                                                                   FillPattern.Solid, textString = "if")}),
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
end FieldCurrent;
