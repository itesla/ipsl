within AKD.Components;
model equiv_trafo
  iPSL.Electrical.Branches.PSSE.PwTransformer equiv_trafo(
    R=R,
    X=X,
    G=G,
    B=B,
    t1=t1,
    t2=t2,
    PrimaryOnFromSide=PrimaryOnFromSide) annotation (Placement(transformation(extent={{-8,-21},{-54,21}})));
  iPSL.Electrical.Branches.PSSE.phase_shift equiv_phsh(phase=phase) annotation (Placement(transformation(extent={{6,-10},{46,8}})));
  iPSL.Connectors.PwPin pTo annotation (Placement(transformation(extent={{-80,-6},{-68,6}}), iconTransformation(extent={{-72,-5},{-60,6}})));
  iPSL.Connectors.PwPin pFrom annotation (Placement(transformation(extent={{60,-6},{72,6}}), iconTransformation(extent={{60,-5},{72,6}})));
  parameter Real R "Resistance To.u.";
  parameter Real X "Reactance To.u.";
  parameter Real G "Shunt conductance To.u.";
  parameter Real B "Shunt susceptance To.u.";
  parameter Real t1 "Primary winding tap ratio";
  parameter Real t2 "Secondary winding tap ratio";
  parameter Boolean PrimaryOnFromSide "Is the primary winding on the From-side?";
  parameter Real phase=150 "phase shift [degree]";
equation
  connect(equiv_trafo.From, equiv_phsh.p) annotation (Line(
      points={{-14.9,0},{5.6,0},{5.6,-0.1},{8,-0.1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(equiv_trafo.To, pTo) annotation (Line(
      points={{-47.1,0},{-74,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(equiv_phsh.n, pFrom) annotation (Line(
      points={{43.6,-0.1},{55.8,-0.1},{55.8,0},{66,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-60,40},{60,-40}}, lineColor={0,0,255}),
        Ellipse(
          extent={{-28,22},{14,-22}},
          lineColor={0,0,255},
          lineThickness=1),
        Line(
          points={{-60,0},{-28,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Line(
          points={{28,0},{60,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Ellipse(
          extent={{-14,22},{28,-22}},
          lineColor={0,0,255},
          lineThickness=1),
        Text(
          extent={{100,4},{62,34}},
          lineColor={0,0,255},
          textString="From"),
        Text(
          extent={{-78,32},{-62,6}},
          lineColor={0,0,255},
          textString="To")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end equiv_trafo;
