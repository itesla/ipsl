within iPSL.Electrical.Banks.Simulink;


model Shunt "Shunt Inductor or Capacitor"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-22,48},
            {-2,68}}), iconTransformation(extent={{-10,40},{10,60}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real Qnom
    "Reactive power produced by the shunt under 1 p.u voltage, (negative for inductive charge, positive for capacitive charge) Mvar";
  parameter Real Sbase "Base power of the system, MVA";
  parameter Real X=Sbase/(-Qnom) "Reactance in p.u";
  Real Q "Consumed power";
  Real v;
equation
  v = sqrt(p.vr*p.vr + p.vi*p.vi);
  0 = p.vr*p.ir + p.vi*p.ii;
  Q = p.vi*p.ir - p.vr*p.ii;
  Q = 1/X*v*v;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Line(
          points={{0,40},{0,30}},
          smooth=Smooth.None,
          color={0,0,255},
          thickness=0.5),Rectangle(extent={{-22,40},{24,-42}}, lineColor={0,0,
          255}),Text(
          extent={{-12,34},{12,-18}},
          lineColor={0,0,255},
          textString="Y",
          lineThickness=0.5),Line(
          points={{0,-12},{0,-26}},
          smooth=Smooth.None,
          color={0,0,255},
          thickness=0.5),Line(
          points={{-1,14},{-1,-6}},
          smooth=Smooth.None,
          color={0,0,255},
          origin={-4,-27},
          rotation=-90,
          thickness=0.5),Line(
          points={{-1,-6},{-1,-2}},
          smooth=Smooth.None,
          color={0,0,255},
          origin={-4,-33},
          rotation=90,
          thickness=0.5),Line(
          points={{-1,12},{-1,-0.000000000000000183697}},
          smooth=Smooth.None,
          color={0,0,255},
          origin={-6,-31},
          rotation=-90,
          thickness=0.5)}), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Shunt Inductor or Capacitor</td>
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
end Shunt;
