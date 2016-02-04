within iPSL.Electrical.Banks;
model PwShuntC "Shunt capacitor"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-8,44},{12,64}}), iconTransformation(extent={{-10,42},{10,62}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real Qnom "Reactive power produced by the shunt capacitor under 1 p.u voltage, Mvar";
  parameter Real Vbase "Base voltage of the bus, kV";
  parameter Real fn=50 "Frequency rating, Hz";
  Real Zbase;
  Real C "Capacitance in p.u";
  Real v;
  Real anglev;
  Real i;
  Real anglei;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  i = sqrt(p.ir^2 + p.ii^2);
  anglei = atan2(p.ii, p.ir);
  Zbase = Vbase^2/Qnom;
  C = Qnom/(Vbase^2*2*pi*fn*Zbase) "S=U*I";
  anglei = anglev + pi/2;
  i = v*2*pi*fn*C "I=U/Z";
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(
          points={{0,42},{0,20}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-30,20},{34,20}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-30,0},{34,0}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Rectangle(extent={{-40,42},{42,-24}}, lineColor={0,0,255})}),
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
end PwShuntC;
