within iPSL.Electrical.Banks;
model PwShuntB
  parameter Real B "(pu) on system base";
  Complex I;
  Complex V;
  Real v;
  Complex S;
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-14,66},{6,86}})));
equation
  v = sqrt(p.vr^2 + p.vi^2);
  I = Complex(p.ir, p.ii);
  V = Complex(p.vr, p.vi);
  I = Complex(0, B)*V;
  S = Complex(p.vr, p.vi)*Complex(p.ir, -p.ii) annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio=
            true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-66,72},{66,-82}}, lineColor={0,0,255}),Text(
          extent={{-36,54},{42,-62}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="jB")}));
  annotation (Documentation(revisions="<!--DISCLAIMER-->
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
end PwShuntB;
