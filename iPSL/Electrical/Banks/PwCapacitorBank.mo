within iPSL.Electrical.Banks;
model PwCapacitorBank "Capacitor Bank with Bank.2013"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{0,60},{20,80}}), iconTransformation(extent={{0,60},{20,80}})));
  parameter Real nsteps "Number of steps connected";
  parameter Real G = 0;
  parameter Real B = 0;
  parameter Complex Y(re = G, im = B);
  Complex V;
  Complex I;
equation
  I = Y*V;
  V.re = p.vr;
  V.im = p.vi;
  p.ii = I.im;
  p.ir = I.re;
  annotation (Icon(graphics={Rectangle(extent={{-40,60},{60,-40}}, lineColor={0,0,255}),Line(
          points={{10,50},{10,34}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,22},{36,22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,34},{36,34}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{10,22},{10,6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,-6},{36,-6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,6},{36,6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{10,-6},{10,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-16,-22},{40,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-18,-30},{-10,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,-30},{-2,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-2,-30},{6,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{6,-30},{14,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{14,-30},{22,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{22,-30},{30,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{30,-30},{38,-22}},
          color={0,0,255},
          smooth=Smooth.None)}), Documentation(info="<HTML>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor= #00FF00><p> 4 </p></td>
</tr> 
</table> 
<p></p></HTML>", revisions="<html>
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
end PwCapacitorBank;
