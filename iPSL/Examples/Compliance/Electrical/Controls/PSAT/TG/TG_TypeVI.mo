within iPSL.Examples.Compliance.Electrical.Controls.PSAT.TG;
model TG_TypeVI

   iPSL.Electrical.Controls.PSAT.TG.TGTypeVI tGModel6_1(Ka = 3.33333, Ta = 0.07, vmin = -0.1, vmax = 0.1, gmax = 0.97518, gmin = 0.01, Rp = 0.05, Kp = 1.163, Ki = 0.105, Kd = 0, Td = 0.01, beta = 0.1, Tw = 2.67, dref = 0, po = 0.16074) annotation(Placement(transformation(extent={{-40,-20},
            {-100,40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.1,
    duration=1,
    startTime=0.5,
    offset=1)
    annotation (Placement(transformation(extent={{70,24},{50,44}})));
  Modelica.Blocks.Sources.Step step(
    height=-0.1,
    offset=0,
    startTime=1)
    annotation (Placement(transformation(extent={{70,-16},{50,4}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{30,4},{10,24}})));
  Modelica.Blocks.Sources.Constant ZERO(k=1)
    annotation (Placement(transformation(extent={{70,-50},{50,-30}})));
equation
  connect(add.u1,ramp. y) annotation (Line(points={{32,20},{40,20},{40,34},{49,
          34}},      color={0,0,127}));
  connect(step.y,add. u2) annotation (Line(points={{49,-6},{40,-6},{40,8},{32,8}},
                     color={0,0,127}));
  connect(add.y, tGModel6_1.we) annotation (Line(points={{9,14},{-35.2,14},{
          -35.2,14.8}}, color={0,0,127}));
  connect(ZERO.y, tGModel6_1.wref) annotation (Line(points={{49,-40},{16,-40},{
          -14,-40},{-14,27.4},{-35.2,27.4}}, color={0,0,127}));
  connect(tGModel6_1.Pe, tGModel6_1.wref) annotation (Line(points={{-35.2,3.4},
          {-14,4},{-14,27.4},{-35.2,27.4}}, color={0,0,127}));
  connect(tGModel6_1.Pref, tGModel6_1.wref) annotation (Line(points={{-35.2,
          -9.2},{-14,-10},{-14,27.4},{-35.2,27.4}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-120,
            -80},{80,120}})),                                                                                                    Icon(coordinateSystem(extent = {{-120, -80}, {80, 120}})),
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
end TG_TypeVI;
