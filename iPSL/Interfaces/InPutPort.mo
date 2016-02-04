within iPSL.Interfaces;
model InPutPort
  input Real vi;
  Real vo;
equation
  vi = vo;
  annotation (
    Icon(graphics={Rectangle(extent={{-20,20},{20,-20}}, lineColor={0,0,255}),Text(
          extent={{-18,8},{18,-6}},
          lineColor={0,0,255},
          textString="Input")}),
    Diagram(graphics={Rectangle(extent={{-20,20},{20,-20}}, lineColor={0,0,255}),Text(
          extent={{-18,8},{18,-6}},
          lineColor={0,0,255},
          textString="Input")}),
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
end InPutPort;
