within iPSL.Electrical.Wind.PSSE.WT4G;
model ImLimited_max "Integrator with limited value of the output"

  input Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  output Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
//  parameter Real Ymax "Max limit";
  Modelica.Blocks.Interfaces.RealInput Ymax
    annotation (Placement(transformation(extent={{-72,20},{-32,60}}),
        iconTransformation(
        extent={{-11,-11},{11,11}},
        rotation=270,
        origin={27,57})));
equation
  if p1 <= Ymax then
    n1 = p1;
  else
    n1 = Ymax;
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{100,100}}),                                                                        graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor=
              {0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                                                                                    Line(points={{
              -36,-52},{0,48}},                                                                                                    color={0,0,
              255},                                                                                                    smooth=
              Smooth.None,
          thickness=0.5),                                                                                                    Line(points={{0,
              48},{26,48}},                                                                                                    color={0,0,
              255},                                                                                                    smooth=
              Smooth.None,
          thickness=0.5)}),                                                                                                    Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),                                                                                                    graphics),
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
end ImLimited_max;
