within iPSL.Electrical.Branches.Simulink.LTC;
model LTC_switch
  Modelica.Blocks.Interfaces.RealInput Signalin annotation (Placement(transformation(extent={{-68,-4},{-48,16}}), iconTransformation(extent={{-78,-16},{-48,16}})));
  Modelica.Blocks.Interfaces.RealInput LTCin annotation (Placement(transformation(extent={{-68,46},{-48,66}}), iconTransformation(extent={{-80,32},{-48,66}})));
  Modelica.Blocks.Interfaces.RealInput Normalin annotation (Placement(transformation(extent={{-68,-58},{-48,-38}}), iconTransformation(extent={{-78,-68},{-48,-38}})));
  Modelica.Blocks.Interfaces.RealOutput r annotation (Placement(transformation(extent={{54,0},{74,20}}), iconTransformation(extent={{56,-8},{86,24}})));
equation
  if Signalin > 0 then
    r = LTCin;
  else
    r = Normalin;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-46,94},{56,-94}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-46,0},{-32,0},{-32,18}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=1),Line(
          points={{-32,0},{-32,-18}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=1)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer with switching</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end LTC_switch;
