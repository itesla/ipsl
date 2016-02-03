within iPSL.NonElectrical.Continuous;
block SimpleLead "First order lead transfer function block"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain" annotation (Evaluate=false);
  parameter Modelica.SIunits.Time T "Lead time constant" annotation (Evaluate=false);
  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));
equation
  assert(
    T >= 1e-10,
    "Time constant must be greater than 0",
    AssertionLevel.error);
  T*der(u) = K*y - u;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-56,68},{58,8}},
          lineColor={0,0,255},
          textString="1+Ts"),Line(
          points={{-76,0},{82,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-66,-20},{74,-80}},
          lineColor={0,0,255},
          textString="K")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
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
end SimpleLead;
