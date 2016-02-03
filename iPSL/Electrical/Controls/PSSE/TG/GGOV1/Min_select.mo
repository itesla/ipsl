within iPSL.Electrical.Controls.PSSE.TG.GGOV1;
block Min_select "Output the minimum and the maximum element of the input vector"
  parameter Integer nu(min=0) = 0 "Number of input connections" annotation (Dialog(connectorSizing=true), HideResult=true);
  Modelica.Blocks.Interfaces.RealVectorInput u[nu] annotation (Placement(transformation(extent={{-120,70},{-80,-70}})));
  Modelica.Blocks.Interfaces.RealOutput yMin(start=frs0) annotation (Placement(transformation(extent={{100,-94},{120,-74}}, rotation=0)));
  parameter Real frs0;
equation
  yMin = min(u);
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.1), graphics={Text(
          extent={{-50,46},{76,-46}},
          lineColor={0,0,255},
          textString="Low value
select"),Rectangle(extent={{-100,98},{100,-98}}, lineColor={0,0,255})}),
    Documentation(info="<html>
<p>
Determines the minimum and maximum element of the input vector and
provide both values as output.
</p>
</html>", revisions="<!--DISCLAIMER-->
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
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics));
end Min_select;
