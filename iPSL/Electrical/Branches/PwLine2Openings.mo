within iPSL.Electrical.Branches;
model PwLine2Openings "Transmission Line based on the pi-equivalent circuit with an opening event on both sending and receiving end nodes"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-76,-10},{-56,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{56,-10},{76,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance";
  parameter Real X "Reactance";
  parameter Real G "Shunt half conductance";
  parameter Real B "Shunt half susceptance";
  parameter Real startTime "Start time of the opening";
  parameter Real endTime "End time of the opening";
  Complex S_s "power at sending";
  Complex S_r "power at receiving";
protected 
  Complex V_s(re = p.vr, im = p.vi) "Volage at sendig";
  Complex I_s(re = p.ir, im = p.ii) "Current at sendig";
  Complex V_r(re = n.vr, im = n.vi) "Voltage at receiving";
  Complex I_r(re = n.ir, im = n.ii) "Current at receiving";
  parameter Complex Y1(re = R /(X*X + R*R) , im  = -X / (X*X + R*R));
  parameter Complex Z1(re = R , im = X);
  parameter Complex y(re = G , im = B); 
equation   
  I_s = if not(time > startTime and time < endTime) then (V_s - V_r)*Y1 + y*V_s  else Complex(0);
  I_r = if not(time > startTime and time < endTime) then (V_r - V_s)*Y1 + y*V_r  else Complex(0);  
  S_s =  V_s * I_s;
  S_r =  V_r * I_r;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,40},{60,-42}}, lineColor={0,0,255}),Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{-38,16},{4,16},{24,30}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{34,18},{40,18}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{28,22},{34,16}}, lineColor={0,0,255}),Text(
          extent={{-108,86},{-20,40}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P12, significantDigits=2))),Text(
          extent={{22,86},{110,40}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P21, significantDigits=2))),Text(
          extent={{-108,-56},{-20,-102}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q12, significantDigits=2))),Text(
          extent={{22,-56},{110,-102}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q21, significantDigits=2))),Line(points={{-88,86},{-40,86},{-48,92}}, color={0,0,0}),Line(points={{-40,86},{-48,80}}, color={0,0,0}),Line(points={{-88,
          -54},{-40,-54},{-48,-48}}, color={0,0,0}),Line(points={{-40,-54},{-48,-60}}, color={0,0,0}),Line(points={{-80,-48},{-80,-60}}, color={0,0,0}),Line(points={{40,-54},{88,-54},{80,-48}}, color=
           {0,0,0}),Line(points={{88,-54},{80,-60}}, color={0,0,0}),Line(points={{48,-48},{48,-60}}, color={0,0,0}),Line(points={{40,86},{88,86},{80,92}}, color={0,0,0}),Line(points={{88,86},{80,80}},
          color={0,0,0})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=cyan><p> 3 </p></td>
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
end PwLine2Openings;
