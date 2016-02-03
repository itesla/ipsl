within iPSL.Electrical.Controls.PSSE.ES.ESST4B;
model VE
  parameter Real KP=6.73;
  parameter Real KI=0.1;
  parameter Real XL=0;
  parameter Real THETAP=0;
  Modelica.Blocks.Interfaces.RealInput Vr annotation (Placement(transformation(extent={{-140,56},{-100,96}})));
  Modelica.Blocks.Interfaces.RealInput Vi annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
  Modelica.Blocks.Interfaces.RealInput Ir annotation (Placement(transformation(extent={{-140,-36},{-100,4}})));
  Modelica.Blocks.Interfaces.RealInput Ii annotation (Placement(transformation(extent={{-140,-84},{-100,-44}})));
  Modelica.Blocks.Interfaces.RealOutput VE annotation (Placement(transformation(extent={{100,-18},{140,22}}), iconTransformation(extent={{100,-18},{140,22}})));
  Real Re;
  Real Im;
  Real VE2;
protected
  parameter Real KPr=KP*cos(THETAP);
  parameter Real KPi=KP*sin(THETAP);
equation
  Re = KPr*Vr - KPi*Vi - KI*Ii - XL*(KPr*Ii + KPi*Ir);
  Im = KPr*Vi + KPi*Vr + KI*Ir + XL*(KPr*Ir - KPi*Ii);
  VE2 = Re*Re + Im*Im;
  VE = sqrt(VE2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-88,86},{90,-68}},
          lineColor={0,0,255},
          textString="VE=| KP*VT+j(KI+KP*XL)*IT |"),Rectangle(extent={{-100,80},{100,-84}}, lineColor={0,0,255})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<!--DISCLAIMER-->
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
end VE;
