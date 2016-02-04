within iPSL.Electrical.Sensors;
model PwCurrent "Current sensor"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-60,-10},{-40,10}}), iconTransformation(extent={{-60,-10},{-40,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,10},{60,30}}), iconTransformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Interfaces.RealOutput outp annotation (Placement(transformation(extent={{39,-30},{59,-10}}), iconTransformation(extent={{39,-30},{59,-10}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  outp = sqrt(p.ir*p.ir + p.ii*p.ii) annotation (Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-30,32},{30,-32}}, lineColor={0,0,255}),Rectangle(extent=
          {{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-26,-12},{-6,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="I"),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None)}), Diagram(graphics));
  annotation (
    Icon(graphics={Text(
          extent={{-68,20},{-60,14}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{58,40},{66,34}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{-66,20},{-58,14}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{56,40},{64,34}},
          lineColor={0,0,255},
          textString="n"),Text(
          extent={{-66,22},{-58,16}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{56,42},{64,36}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{-68,22},{-60,16}},
          lineColor={0,0,255},
          textString="p"),Text(
          extent={{52,-4},{60,-10}},
          lineColor={0,0,255},
          textString="outp")}),
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
end PwCurrent;
