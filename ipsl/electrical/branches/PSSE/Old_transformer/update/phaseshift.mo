within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model phaseshift
  constant Real pi = Modelica.Constants.pi;
  iPSL.Connectors.PwPin T annotation (Placement(transformation(extent={{76,-2},
            {96,18}}), iconTransformation(extent={{76,-2},{96,18}})));
  iPSL.Connectors.PwPin F annotation (Placement(transformation(extent={{-102,-2},
            {-82,18}}), iconTransformation(extent={{-102,-2},{-82,18}})));
  parameter Real phase " From side and To side phase shift in degree";
protected
  parameter Real A = (-phase * pi / 180) + 0.5 * pi;

equation
  [T.ir;  T.ii]  = -[sin(A), cos(A); -cos(A), sin(A)] * [F.ir;F.ii];
  [T.vr; T.vi] = [sin(A), cos(A); -cos(A), sin(A)] * [F.vr;  F.vi];

  annotation(Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{100,100}}),                                                                           graphics), Icon(
        coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Rectangle(extent={{-90,48},{92,-34}}, lineColor={0,0,255}),
        Text(
          extent={{-70,36},{-26,-20}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="t"),
        Text(
          extent={{-34,36},{10,-20}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString=":"),
        Ellipse(
          extent={{-28,14},{-22,-2}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Line(
          points={{-30,14},{-38,-2},{-28,-2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-28,6},{-22,6},{-22,6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-18,34},{26,-22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          textString="1"),
        Ellipse(
          extent={{22,14},{28,-2}},
          lineColor={0,0,255},
          lineThickness=0.5),
        Line(
          points={{20,14},{12,-2},{22,-2}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None)}),
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
end phaseshift;
