within iPSL.Electrical.Banks;
model PwShuntR "Shunt inductor"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-10,40},{10,60}}), iconTransformation(extent={{-10,40},{10,60}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real Qnom=75 "Reactive power produced by the shunt inductor under 1 p.u voltage, -Mvar";
  parameter Real Vbase=138 "Base volatage of the bus, kV";
  parameter Real fn=50 "Frequency rating, Hz";
  Real Zbase;
  Real L "Inductance in p.u";
  Real v;
  Real anglev;
  Real i;
  Real anglei;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  i = sqrt(p.ir^2 + p.ii^2);
  anglei = atan2(p.ii, p.ir);
  Zbase = Vbase^2/(-Qnom);
  L = Vbase^2/(2*pi*fn*(-Qnom)*Zbase) "S=U*I";
  anglei = anglev - pi/2;
  i = v/(2*pi*fn*L) "I=U/Z";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(
          extent={{-12,30},{10,8}},
          lineColor={0,0,255},
          lineThickness=0.5),Rectangle(
          extent={{0,32},{30,-4}},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),Line(
          points={{0,40},{0,30}},
          thickness=1,
          smooth=Smooth.None,
          color={0,0,255}),Ellipse(
          extent={{-12,8},{10,-14}},
          lineColor={0,0,255},
          lineThickness=0.5),Rectangle(
          extent={{2,10},{32,-26}},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),Ellipse(
          extent={{-12,-14},{10,-36}},
          lineColor={0,0,255},
          lineThickness=0.5),Rectangle(
          extent={{0,-6},{30,-42}},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),Rectangle(extent={{-40,40},{40,-46}}, lineColor={0,0,255})}), Documentation(revisions="<!--DISCLAIMER-->
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
end PwShuntR;
