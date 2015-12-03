within iPSL.Electrical;


model SystemBase "System Base Definition"
  parameter Real S_b=100 "System base in MVA";
  parameter Real fn=50 "System Frequency in Hz";
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{140,100}}), graphics={
        Rectangle(
          extent={{-100,100},{140,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-90,40},{40,20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="System Base"),
        Text(
          extent={{88,40},{124,20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="MVA"),
        Text(
          extent={{20,40},{72,20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString=DynamicSelect("0.0", String(S_b))),
        Text(
          extent={{-90,0},{40,-20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Frequency"),
        Text(
          extent={{40,0},{72,-20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Right,
          textString=DynamicSelect("0.0", String(fn))),
        Text(
          extent={{88,0},{118,-20}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Hz"),
        Text(
          extent={{-42,80},{88,60}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="System Data")}),
    defaultComponentName="SysData",
    defaultAttributes="inner",
    missingInnerMessage="
No 'System Data' component is defined. A default component will be used, and generate a system base of 100 MVA, and a frequency of 50 Hz",
    Diagram(coordinateSystem(extent={{-100,-100},{140,100}})),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end SystemBase;
