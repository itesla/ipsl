within iPSL.Electrical.Branches.Simulink.LTC;
model LTC_lookup
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-76,-2},{-56,18}}), iconTransformation(extent={{-92,-20},{-56,18}})));
  Modelica.Blocks.Interfaces.RealOutput out annotation (Placement(transformation(extent={{62,-12},{82,8}}), iconTransformation(extent={{62,-16},{92,18}})));
  parameter Real Uplim;
  parameter Real Downlim;
equation
  if u > Uplim then
    out = 1;
  elseif u < Downlim then
    out = -1;
  else
    out = 0;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-54,32},{62,-34}}, lineColor={0,0,255}),Line(
          points={{-46,-18},{-12,-18},{-10,-18}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,0},{12,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,0},{-10,-18}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),Line(
          points={{12,20},{12,0}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),Line(
          points={{12,20},{34,20},{52,20}},
          color={0,0,255},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer's lookup</td>
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
end LTC_lookup;
