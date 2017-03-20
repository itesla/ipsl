within iPSL.Electrical.Branches.Eurostag;
model PwTransformer_2 "Two winding fixed transformer composed of an ideal transformer, a series  impedance and a shunt admittance, with explicit equations for currents. 2014/12/16"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-8},{-60,12}}), iconTransformation(extent={{-80,-8},{-60,12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-8},{80,12}}), iconTransformation(extent={{60,-8},{80,12}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt conductance p.u.";
  parameter Real B "Shunt susceptance p.u.";
  parameter Real r "Transformation ratio";
protected 
  Complex V_s(re = p.vr, im = p.vi) "Volage at sendig";
  Complex I_s(re = p.ir, im = p.ii) "Current at sendig";
  Complex V_r(re = n.vr, im = n.vi) "Voltage at receiving";
  Complex I_r(re = n.ir, im = n.ii) "Current at receiving";
  parameter Complex Y1(re = R /(X*X + R*R) , im  = -X / (X*X + R*R));
  parameter Complex y(re = G , im = B);
equation
  I_s = r*(r - 1)*Y1*V_s + r*Y1*(V_s - V_r);
  I_r = r*Y1*(V_r - V_s) + ((1 - r)*Y1 + y)*V_r;
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
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=#00FF00><p> 4 </p></td>
</tr> 
</table> 
<p></p></html>",revisions="<html>
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
end PwTransformer_2;
