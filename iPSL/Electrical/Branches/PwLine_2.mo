within iPSL.Electrical.Branches;
model PwLine_2 "Model for a transmission Line based on the pi-equivalent circuit with explicit equations for currents. Developed by RTE. 2014/12/16"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";

protected 
  parameter Real Y = 1 / sqrt(R * R + X * X);
  parameter Real angle = atan2(R, X);
  Complex S_s "power at sending";
  Complex S_r "power at receiving";
  Complex V_s(re = p.vr, im = p.vi) "Volage at sendig";
  Complex I_s(re = p.ir, im = p.ii) "Current at sendig";
  Complex V_r(re = n.vr, im = n.vi) "Voltage at receiving";
  Complex I_r(re = n.ir, im = n.ii) "Current at receiving";
  parameter Complex Y1(re = Y * sin(angle), im  = -Y * cos(angle));
  parameter Complex y(re = G , im  = B);  
equation
   I_s = (V_s - V_r)*Y1 + y*V_s;
   I_r = (V_r - V_s)*Y1 + y*V_r;
   S_s =  V_s * I_s;
   S_r =  V_r * I_r;
  annotation (
    Icon(graphics={Rectangle(extent={{-60,40},{60,-42}}, lineColor={0,0,255}),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}),
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
end PwLine_2;
