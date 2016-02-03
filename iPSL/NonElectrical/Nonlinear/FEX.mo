within iPSL.NonElectrical.Nonlinear;
model FEX "FEX=f(IN)"
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-70,-10},{-50,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{58,-10},{78,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  if u <= 0 then
    y = 1;
  elseif u > 0 and u <= 0.433 then
    y = 1 - 0.577*u;
  elseif u > 0.433 and u < 0.75 then
    y = sqrt(0.75 - u^2);
  elseif u >= 0.75 and u <= 1 then
    y = 1.732*(1 - u);
  else
    y = 0;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-62,28},{64,-30}},
          lineColor={0,0,255},
          textString="FEX=f(IN)")}),
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
end FEX;
