within iPSL.Examples.Compliance.Electrical.Controls.PSAT.TG;
model TG_TypeIV

   iPSL.Electrical.Controls.PSAT.TG.TGTypeIV tGModel4_1(Ki = 0.105, Tg = 0.2, Tp = 0.04, delta = 0.3, sigma = 0.05, Tr = 5, vmin = -0.1, vmax = 0.1, gmax = 1, gmin = 0, Tw = 1, a11 = 0.5, a13 = 1, a21 = 1.5, a23 = 1, Kp = 1.163, Pref = 0.080199,
    wref=1)                                                                                                     annotation(Placement(transformation(extent={{-20,-20},
            {-80,40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.1,
    duration=1,
    startTime=0.5,
    offset=1)
    annotation (Placement(transformation(extent={{80,20},{60,40}})));
  Modelica.Blocks.Sources.Step step(
    height=-0.1,
    offset=0,
    startTime=1)
    annotation (Placement(transformation(extent={{80,-20},{60,0}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{40,0},{20,20}})));
equation
  connect(add.u1,ramp. y) annotation (Line(points={{42,16},{50,16},{50,30},{59,
          30}},      color={0,0,127}));
  connect(step.y,add. u2) annotation (Line(points={{59,-10},{50,-10},{50,4},{42,
          4}},       color={0,0,127}));
  connect(tGModel4_1.w, add.y) annotation (Line(points={{-14.6,9.4},{1.7,9.4},{
          1.7,10},{19,10}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})),
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
end TG_TypeIV;
