within iPSL.Electrical.Events;
model PwFault "Transitory short-circuit on a node. Shunt impedance connected only during a specified interval of time.
              Developed by AIA. 2014/12/16"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter Real R "Resistance (pu)";
  parameter Real X "Conductance (pu)";
  parameter Real t1 "Start time of the fault (s)";
  parameter Real t2 "End time of the fault (s)";
protected
  parameter Real ground=if R == 0 and X == 0 then 0 else 1;
equation
  if time < t1 then
    p.ii = 0;
    p.ir = 0;
  elseif time < t2 and ground == 0 then
    p.vr = 1E-10;
    // This is to avoid numerical problems
    p.vi = 0;
  elseif time < t2 then
    p.ii = (R*p.vi - X*p.vr)/(X*X + R*R);
    p.ir = (R*p.vr + X*p.vi)/(R*R + X*X);
  else
    p.ii = 0;
    p.ir = 0;
  end if;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-60,-60},{60,60}},
        initialScale=0.1), graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),Rectangle(
          extent={{-28,26},{12,6}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{12,16},{26,16},{26,-24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{14,-24},{38,-24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{16,-28},{36,-28}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{20,-32},{34,-32}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{22,-36},{30,-36}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(
          extent={{-38,18},{-28,14}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(
          points={{-12,34},{-4,16},{-18,16},{-6,-6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-12,-4},{-6,-6},{-6,0}},
          color={255,0,0},
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(
        extent={{-60,-60},{60,60}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics),
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
end PwFault;
