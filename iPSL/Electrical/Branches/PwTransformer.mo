within iPSL.Electrical.Branches;
model PwTransformer "Two winding fixed transformer composed of an ideal transformer, a series
              impedance and a shunt admittance. 2013"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-8},{-60,12}}), iconTransformation(extent={{-80,-8},{-60,12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-8},{80,12}}), iconTransformation(extent={{60,-8},{80,12}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt conductance p.u.";
  parameter Real B "Shunt susceptance p.u.";
  parameter Real r "Transformation ratio";
equation
  r*(G*n.vr - B*n.vi - n.ir) = p.ir;
  r*(G*n.vi + B*n.vr - n.ii) = p.ii;
  R*p.ir - X*p.ii = r*r*p.vr - r*n.vr;
  R*p.ii + X*p.ir = r*r*p.vi - r*n.vi;
  annotation (
    Icon(graphics={Rectangle(extent={{-60,40},{60,-40}}, lineColor={0,0,255}),Ellipse(
          extent={{-26,16},{6,-16}},
          lineColor={0,0,255},
          lineThickness=1),Ellipse(
          extent={{-8,16},{24,-16}},
          lineColor={0,0,255},
          lineThickness=1),Line(
          points={{-42,0},{-26,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),Line(
          points={{24,0},{40,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None)}),
    Diagram(graphics),
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
end PwTransformer;
