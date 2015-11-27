within iPSL.Electrical.Controls.DTU;
model pwPLL "Developed by DTU"

  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{-60,
            -6},{-48,6}}), iconTransformation(extent={{-60,-6},{-48,6}})));
  Modelica.Blocks.Interfaces.RealOutput imPin annotation(Placement(transformation(extent = {{48, -6}, {60, 6}}), iconTransformation(extent = {{45, -6}, {59, 6}})));
  iPSL.Electrical.Sensors.PwVoltage pwVoltage
    annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
  Modelica.Blocks.Math.Atan2 atan2_1
    annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
equation
  connect(pwVoltage.p, pwPin) annotation(Line(points = {{-39, 0}, {-54, 0}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwVoltage.vr, atan2_1.u2) annotation (Line(points={{-29.1,3},{-18,3},
          {-18,-6},{-6,-6}}, color={0,0,127}));
  connect(pwVoltage.vi, atan2_1.u1) annotation (Line(points={{-29.1,0},{-16,0},
          {-16,6},{-6,6}}, color={0,0,127}));
  connect(atan2_1.y, imPin)
    annotation (Line(points={{17,0},{54,0},{54,0}}, color={0,0,127}));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-48, 50}, {46, -50}}, lineColor = {0, 0, 255},
            lineThickness =                                                                                                   0.5), Text(extent = {{-28, 22}, {34, -22}}, lineColor = {0, 0, 255},
            lineThickness =                                                                                                   0.5,
            fillPattern =                                                                                                   FillPattern.Solid, textString = "PLL")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})),
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
end pwPLL;
