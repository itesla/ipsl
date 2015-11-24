within iPSL.Examples.Compliance.Electrical.Controls.PSAT.TG;
model TG_TypeV

   iPSL.Electrical.Controls.PSAT.TG.TGTypeV tGModel5_1(Ki = 0.5, Kp = 3.0, Tg = 0.2, Tp = 0.05, sigma = 0.04, vmin = -0.1, vmax = 0.1, gmax = 1, gmin = 0, Tw = 1,
    Pref=1)                                                                                                     annotation(Placement(transformation(extent={{-8,-16},
            {-68,44}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.1,
    duration=1,
    startTime=0.5,
    offset=1)
    annotation (Placement(transformation(extent={{88,20},{68,40}})));
  Modelica.Blocks.Sources.Step step(
    height=-0.1,
    offset=0,
    startTime=1)
    annotation (Placement(transformation(extent={{88,-20},{68,0}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{48,0},{28,20}})));
  Modelica.Blocks.Sources.Constant ZERO(k=1)
    annotation (Placement(transformation(extent={{88,-60},{68,-40}})));
equation
  connect(add.u1,ramp. y) annotation (Line(points={{50,16},{58,16},{58,30},{67,
          30}},      color={0,0,127}));
  connect(step.y,add. u2) annotation (Line(points={{67,-10},{58,-10},{58,4},{50,
          4}},       color={0,0,127}));
  connect(add.y, tGModel5_1.w)
    annotation (Line(points={{27,10},{-2.9,10},{-2.9,10.7}}, color={0,0,127}));
  connect(ZERO.y, tGModel5_1.wref) annotation (Line(points={{67,-50},{20,-50},{
          20,-5.5},{-2.9,-5.5}}, color={0,0,127}));
  connect(tGModel5_1.w1, tGModel5_1.wref) annotation (Line(points={{-2.6,30.8},
          {20,30.8},{20,-5.5},{-2.9,-5.5}}, color={0,0,127}));
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
end TG_TypeV;
