within iPSL.Electrical.Branches.PSSE.Old_transformer;
model phaseShift
  constant Real pi=Modelica.Constants.pi;
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{78,0},{98,20}})));
  parameter Real phase " W1-2 phase shift in degree";
protected
  parameter Real A=(-phase*pi/180) + 0.5*pi;
equation
  [p.ir; p.ii] = -[sin(A), cos(A); -cos(A), sin(A)]*[n.ir; n.ii];
  [p.vr; p.vi] = [sin(A), cos(A); -cos(A), sin(A)]*[n.vr; n.vi];
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
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
end phaseShift;
