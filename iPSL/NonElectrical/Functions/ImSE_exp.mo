within iPSL.NonElectrical.Functions;
model ImSE_exp "Block for Saturation function of Exc "
  Modelica.Blocks.Interfaces.RealInput VE_IN "Unsaturated Input" annotation (Placement(transformation(extent={{-140,-20},{-130,-10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Interfaces.RealOutput VE_OUT "Saturated Output" annotation (Placement(transformation(extent={{100,-2},{110,8}}), iconTransformation(extent={{100,-6},{112,6}})));
  parameter Real SE1 "Saturation at E1";
  parameter Real SE2 "Saturation at E2";
  parameter Real E1;
  parameter Real E2;
equation
  VE_OUT = iPSL.NonElectrical.Functions.SE_exp(
    VE_IN,
    SE1,
    SE2,
    E1,
    E2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,60}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,60}}), graphics={Ellipse(
          extent={{-100,60},{100,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-88,38},{82,-42}},
          lineColor={0,0,255},
          textString="SE(Efd)")}),
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
end ImSE_exp;
