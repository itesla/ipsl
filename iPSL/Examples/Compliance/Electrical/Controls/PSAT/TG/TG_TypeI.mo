within iPSL.Examples.Compliance.Electrical.Controls.PSAT.TG;
model TG_TypeI

  parameter Real p0 = 0.160352698692006 "Power flow, node active power";
   iPSL.Electrical.Controls.PSAT.TG.TGTypeI tGTypeI(wref = 1, pref = p0, R = 0.2, pmax = 1, pmin = 0, Ts = 0.1, Tc = 1, T3 = 0.04, T4 = 5, T5 = 0.04) annotation(Placement(transformation(extent={{30,-26},
            {-36,18}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.1,
    duration=1,
    startTime=0.5,
    offset=1)
    annotation (Placement(transformation(extent={{120,10},{100,30}})));
  Modelica.Blocks.Sources.Step step(
    height=-0.1,
    offset=0,
    startTime=1)
    annotation (Placement(transformation(extent={{120,-30},{100,-10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));
equation
  connect(add.u1,ramp. y) annotation (Line(points={{82,6},{90,6},{90,20},{99,20}},
                     color={0,0,127}));
  connect(step.y,add. u2) annotation (Line(points={{99,-20},{90,-20},{90,-6},{
          82,-6}},   color={0,0,127}));
  connect(tGTypeI.w, add.y) annotation (Line(points={{23.675,-0.7},{41.8375,
          -0.7},{41.8375,0},{59,0}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{140,120}},      preserveAspectRatio=false)),             Icon(coordinateSystem(extent = {{-100, -100}, {140, 120}})),
    Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
end TG_TypeI;
