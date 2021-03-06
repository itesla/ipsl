within iPSL.Electrical.Buses;
model InternalBus "Bus for change base"
  outer iPSL.Electrical.SystemBase SysData;
  constant Real pi = Modelica.Constants.pi;
  parameter Real M_b = 120 "Machine base power rating (MVA)" annotation(Dialog(group = "Power flow data"));
  parameter Real S_b = SysData.S_b "System base power rating (MVA)" annotation(Dialog(group = "Power flow data"));
  iPSL.Connectors.PwPin p "Machine base" annotation(Placement(transformation(extent = {{-32, -4}, {-12, 16}}), iconTransformation(extent = {{-32, -4}, {-12, 16}})));
  iPSL.Connectors.PwPin n "System base" annotation(Placement(transformation(extent = {{8, -4}, {28, 16}}), iconTransformation(extent = {{8, -4}, {28, 16}})));
protected
  parameter Real CoB = M_b / S_b;
equation
  0 = n.vr - p.vr;
  0 = n.vi - p.vi;
  0 = p.ir * CoB + n.ir;
  0 = p.ii * CoB + n.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{8,96},{-12,-88}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          extent={{-46,34},{-22,2}},
          lineColor={0,0,255},
          textString="*")}),
    Diagram(graphics),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=yellow><p> 2 </p></td>
</tr> 
</table> 
<p></p></html>", revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end InternalBus;
