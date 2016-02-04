within iPSL.Electrical.Controls.DTU;
model pwPLL "Developed by DTU"
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{-60,-6},{-48,6}}), iconTransformation(extent={{-60,-6},{-48,6}})));
  Modelica.Blocks.Interfaces.RealOutput imPin annotation (Placement(transformation(extent={{48,-6},{60,6}}), iconTransformation(extent={{45,-6},{59,6}})));
  iPSL.Electrical.Sensors.PwVoltage pwVoltage annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
  Modelica.Blocks.Math.Atan2 atan2_1 annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
equation
  connect(pwVoltage.p, pwPin) annotation (Line(
      points={{-39,0},{-54,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwVoltage.vr, atan2_1.u2) annotation (Line(points={{-29.1,3},{-18,3},{-18,-6},{-6,-6}}, color={0,0,127}));
  connect(pwVoltage.vi, atan2_1.u1) annotation (Line(points={{-29.1,0},{-16,0},{-16,6},{-6,6}}, color={0,0,127}));
  connect(atan2_1.y, imPin) annotation (Line(points={{17,0},{54,0},{54,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-48,50},{46,-50}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-28,22},{34,-22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="PLL")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(revisions="<!--DISCLAIMER-->
<html>
<p>Copyright 2015 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<p>​- ​RTE: http://www.rte-france.com/</p>
<p>- SmarTS Lab, research group at KTH: https://www.kth.se/en</p>
<p>​- ​AIA: http://www.aia.es/en/energy/</p>
<p>​- ​DTU: http://www.dtu.dk/english</p>
<p>The authors can be contacted by email: info@itesla-ipsl.org </p>
<p>​</p>
<p>​​This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.</p>
</html>"));
end pwPLL;
