within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model PhaseshiftTwoWindingTransformer "Basic Two Winding Transformer with Phaseshift"
  extends TransformerParameter;
  parameter Real phase " From side and To side phase shift in degree";
  iPSL.Connectors.PwPin F annotation (Placement(transformation(extent={{-114,-4},{-94,16}})));
  iPSL.Connectors.PwPin T annotation (Placement(transformation(extent={{94,-6},{114,14}})));
  phaseshift phaseship1(phase=phase) annotation (Placement(transformation(extent={{-76,-24},{-18,30}})));
  TransformerBasicEquation zeq(
    R=R,
    X=X,
    G=G,
    B=B,
    ti=ti,
    tj=tj) annotation (Placement(transformation(extent={{4,-20},{70,24}})));
equation
  connect(phaseship1.F, F) annotation (Line(
      points={{-73.68,5.16},{-86.6934,5.16},{-86.6934,6},{-104,6}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(zeq.T, T) annotation (Line(
      points={{68.68,3.76},{85.34,3.76},{85.34,4},{104,4}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(phaseship1.T, zeq.F) annotation (Line(
      points={{-22.06,5.16},{-7.03,5.16},{-7.03,4.2},{9.94,4.2}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(graphics={Text(
          extent={{26,52},{114,0}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="*",
          textStyle={TextStyle.Bold}),Ellipse(
          extent={{-74,42},{6,-42}},
          lineColor={0,0,255},
          lineThickness=0.5),Ellipse(
          extent={{-10,42},{70,-42}},
          lineColor={0,0,255},
          lineThickness=0.5)}),
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
end PhaseshiftTwoWindingTransformer;
