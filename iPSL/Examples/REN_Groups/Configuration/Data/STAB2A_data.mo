within iPSL.Examples.REN_Groups.Configuration.Data;
record STAB2A_data
  parameter Real J=1.0000 "K2";
  parameter Real J1=4.40000 "T2";
  parameter Real J2=10.0000 "K3";
  parameter Real J3=1.80000 "T3";
  parameter Real J4=1.0000 "K4";
  parameter Real J5=1.410000 "K5";
  parameter Real J6=0.10000E-01 "T5";
  parameter Real J7=0.50000E-01 "HLIM";
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),Text(
          extent={{-32,14},{32,-10}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="|x|"),Text(
          extent={{-58,4},{-46,-4}},
          lineColor={255,255,255},
          textString="p1")}),
    Diagram(graphics),
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
end STAB2A_data;
