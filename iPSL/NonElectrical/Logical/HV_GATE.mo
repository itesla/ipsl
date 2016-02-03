within iPSL.NonElectrical.Logical;
model HV_GATE
  Modelica.Blocks.Interfaces.RealInput n1 annotation (Placement(transformation(extent={{-86,-2},{-46,38}}), iconTransformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Interfaces.RealInput n2 annotation (Placement(transformation(extent={{-86,-50},{-46,-10}}), iconTransformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Blocks.Interfaces.RealOutput p annotation (Placement(transformation(extent={{-208,54},{-188,74}}), iconTransformation(extent={{60,-10},{80,10}})));
equation
  p = if n1 < n2 then n2 else n1;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-80,-40},{80,40}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-80,-40},{80,40}}), graphics={Polygon(
          points={{-80,40},{-80,-40},{0,-40},{80,0},{0,40},{-80,40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-64,14},{-2,-14}},
          lineColor={0,0,255},
          textString="HV
Gate")}),
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
end HV_GATE;
