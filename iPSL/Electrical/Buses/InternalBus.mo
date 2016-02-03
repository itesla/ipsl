within iPSL.Electrical.Buses;
model InternalBus "Bus for change base"
  constant Real pi=Modelica.Constants.pi;
  parameter Real M_b=120 "System base power rating (MVA)" annotation (Dialog(group="Power flow data"));
  parameter Real S_b=1000 "System base power rating (MVA)" annotation (Dialog(group="Power flow data"));
  iPSL.Connectors.PwPin p "Machine base" annotation (Placement(transformation(extent={{-32,-4},{-12,16}}), iconTransformation(extent={{-32,-4},{-12,16}})));
  iPSL.Connectors.PwPin n "System base" annotation (Placement(transformation(extent={{8,-4},{28,16}}), iconTransformation(extent={{8,-4},{28,16}})));
protected
  parameter Real CoB=M_b/S_b;
equation
  0 = n.vr - p.vr;
  0 = n.vi - p.vi;
  0 = p.ir*CoB + n.ir;
  0 = p.ii*CoB + n.ii;
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
end InternalBus;
