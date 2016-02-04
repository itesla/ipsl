within iPSL.Interfaces;
model OutPutPort "OutPutPort for plotting output results"
  output Real vo;
  input Real vi;
equation
  vi = vo;
  annotation (
    Icon(graphics={Rectangle(extent={{-20,20},{40,-20}}, lineColor={0,0,255}),Text(
          extent={{-8,10},{26,-8}},
          lineColor={0,0,255},
          textString="Out")}),
    Diagram(graphics={Rectangle(extent={{-30,20},{30,-20}}, lineColor={0,0,255}),Text(
          extent={{-18,10},{16,-8}},
          lineColor={0,0,255},
          textString="Out")}),
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
end OutPutPort;
