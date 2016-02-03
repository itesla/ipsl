within iPSL.Electrical.Machines.DTU;
model PwVoltageSource "Developed by DTU"
  parameter Real R(start=0.01) "Resistance";
  parameter Real X(start=0.01) "Reactance";
  Modelica.Blocks.Interfaces.RealInput Vre_ref annotation (Placement(transformation(extent={{-72,33},{-60,47}}), iconTransformation(extent={{-72,33},{-60,47}})));
  Modelica.Blocks.Interfaces.RealInput Vim_ref annotation (Placement(transformation(extent={{-72,-47},{-60,-33}}), iconTransformation(extent={{-72,-47},{-60,-33}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-6},{74,8}})));
equation
  Vre_ref = n.vr + R*n.ir - X*n.ii;
  Vim_ref = n.vi + R*n.ii + X*n.ir;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),Ellipse(
          extent={{-22,22},{22,-20}},
          lineColor={0,0,255},
          lineThickness=0.5),Line(
          points={{0,38},{0,22}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-56,48},{-36,32}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Vre_ref"),Text(
          extent={{-56,-32},{-36,-48}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Vim_ref"),Line(
          points={{0,-20},{0,-36}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Line(
          points={{-4,14},{4,14}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{0,18},{0,10}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-4,-12},{4,-12}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
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
end PwVoltageSource;
