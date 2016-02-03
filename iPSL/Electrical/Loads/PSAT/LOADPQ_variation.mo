within iPSL.Electrical.Loads.PSAT;
model LOADPQ_variation "Equations come from the mathematical separation in between reals and imaginary of S=P+jQ=UI*"
  extends BaseClasses.baseLoad;
  parameter Real t_start_1 "Start time of first load variation (s)" annotation (Dialog(group="Variation 1"));
  parameter Real t_end_1 "End time of first load variation (s)" annotation (Dialog(group="Variation 1"));
  parameter Real dP1 "First active load variation  (pu)" annotation (Dialog(group="Variation 1"));
  parameter Real dQ1 "First reactive load variation (p)" annotation (Dialog(group="Variation 1"));
  parameter Real t_start_2 "Start time of second Load variation (s)" annotation (Dialog(group="Variation 2"));
  parameter Real t_end_2 "End time of second load variation (s)" annotation (Dialog(group="Variation 2"));
  parameter Real dP2 "Second active load variation  (pu)" annotation (Dialog(group="Variation 2"));
  parameter Real dQ2 "Second reactive load variation (pu)" annotation (Dialog(group="Variation 2"));
equation
  if time >= t_start_1 and time <= t_end_1 then
    P = (P_0 + dP1)/S_b;
    Q = (Q_0 + dQ1)/S_b;
  elseif time >= t_start_2 and time <= t_end_2 then
    P = (P_0 + dP2)/S_b;
    Q = (Q_0 + dQ2)/S_b;
  else
    P = P_0/S_b;
    Q = Q_0/S_b;
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={10,10})),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
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
end LOADPQ_variation;
