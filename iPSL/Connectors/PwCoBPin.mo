within iPSL.Connectors;
model PwCoBPin "connector for change from machine power base to system power base "
  parameter Real mbase "machine base power rating MVA";
  parameter Real Sbase "system base power rating MVA";
  parameter Real CoB=mbase/Sbase "change of base ratio";
  iPSL.Connectors.PwPin p "machine base" annotation (Placement(transformation(extent={{-32,-4},{-12,16}}), iconTransformation(extent={{-32,-4},{-12,16}})));
  iPSL.Connectors.PwPin n "system base" annotation (Placement(transformation(extent={{8,-4},{28,16}}), iconTransformation(extent={{8,-4},{28,16}})));
equation
  0 = n.vr - p.vr;
  // real part of the voltage
  0 = n.vi - p.vi;
  // imaginary part of the voltage
  0 = p.ir*CoB + n.ir;
  // real part of the current
  0 = p.ii*CoB + n.ii;
  // imaginary part of the current
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,98},{100,-102}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
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
end PwCoBPin;
