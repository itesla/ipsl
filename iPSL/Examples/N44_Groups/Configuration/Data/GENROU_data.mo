within iPSL.Examples.N44_Groups.Configuration.Data;
record GENROU_data
  parameter Real J=6.15 "d-axis transient open-circuit time constant s";
  parameter Real J1=0.11 "d-axis sub-transient open-circuit time constant s";
  parameter Real J2=0.3 "q-axis transient open-circuit time constant s";
  parameter Real J3=0.1 "q-axis transient open-circuit time constant s";
  parameter Real J4=3 "inertia constant s";
  parameter Real J5=0 "Damping";
  parameter Real J6=1.157 "d-axis reactance";
  parameter Real J7=0.968 "q-axis reactance";
  parameter Real J8=0.242 "d-axis transient reactance";
  parameter Real J9=0.427 "d-axis transient reactance";
  parameter Real J10=0.2 "d-axis sub-transient reactance";
  parameter Real J11=0.12 "leakage reactance";
  parameter Real J12=0.1175;
  //less than zero can commend the saturation function
  parameter Real J13=0.42;
  // paremeter Real gentype = 1;
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
    Documentation(info="", revisions="<!--DISCLAIMER-->
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
end GENROU_data;
