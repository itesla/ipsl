within iPSL.Electrical;
model SystemBase "System Base Definition"
  parameter Real S_b=100 "System base in MVA";
  parameter Real fn=50 "System Frequency in Hz";
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{140,100}}), graphics={Rectangle(
          extent={{-100,100},{140,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-90,40},{40,20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="System Base"),Text(
          extent={{88,40},{124,20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="MVA"),Text(
          extent={{20,40},{72,20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString=DynamicSelect("0.0", String(S_b))),Text(
          extent={{-90,0},{40,-20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Frequency"),Text(
          extent={{40,0},{72,-20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString=DynamicSelect("0.0", String(fn))),Text(
          extent={{88,0},{118,-20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Hz"),Text(
          extent={{-42,80},{88,60}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="System Data")}),
    defaultComponentName="SysData",
    defaultAttributes="inner",
    missingInnerMessage="
No 'System Data' component is defined. A default component will be used, and generate a system base of 100 MVA, and a frequency of 50 Hz",
    Diagram(coordinateSystem(extent={{-100,-100},{140,100}})),
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
end SystemBase;
