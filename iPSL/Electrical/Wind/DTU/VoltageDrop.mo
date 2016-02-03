within iPSL.Electrical.Wind.DTU;
model VoltageDrop "Developed by DTU"
  Modelica.Blocks.Interfaces.RealInput Pwt annotation (Placement(transformation(extent={{-70,33},{-60,47}}), iconTransformation(extent={{-70,33},{-60,47}})));
  Modelica.Blocks.Interfaces.RealInput Qwt annotation (Placement(transformation(extent={{-70,-7},{-60,7}})));
  Modelica.Blocks.Interfaces.RealInput Uwt annotation (Placement(transformation(extent={{-70,-47},{-60,-33}})));
  Modelica.Blocks.Interfaces.RealOutput deltaU annotation (Placement(transformation(extent={{60,-7},{70,7}})));
  parameter Real Rdroop "Resistive component of voltage drop impedance";
  parameter Real Xdroop "Inductive component of voltage drop impedance";
equation
  deltaU = sqrt((Uwt - Rdroop*Pwt/Uwt - Xdroop*Qwt/Uwt)^2 + (Xdroop*Pwt/Uwt - Rdroop*Qwt/Uwt)^2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-60,40},{60,-40}},
          lineColor={0,0,255},
          lineThickness=0.5),Text(
          extent={{-40,20},{38,-20}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Voltage Droop
(Rdroop+jXdroop)")}),
    Documentation(info="", revisions="<!--DISCLAIMER-->
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
end VoltageDrop;
