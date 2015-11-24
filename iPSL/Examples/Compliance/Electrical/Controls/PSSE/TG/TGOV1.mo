within iPSL.Examples.Compliance.Electrical.Controls.PSSE.TG;
model TGOV1 "three phase to ground fault test of GGOV"
  import iPSL;

  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{60,20},{40,40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.1,
    duration=1,
    offset=0,
    startTime=0.5)
    annotation (Placement(transformation(extent={{100,-20},{80,0}})));
  Modelica.Blocks.Sources.Step step(
    height=-0.1,
    offset=0,
    startTime=1)
    annotation (Placement(transformation(extent={{100,-60},{80,-40}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{60,-40},{40,-20}})));
  iPSL.Electrical.Controls.PSSE.TG.TGOV1 tGOV1_1(
    P0=0.4,
    R=4,
    D_t=0.1,
    T_1=1,
    T_2=2,
    T_3=3,
    V_MAX=10,
    V_MIN=-10)
    annotation (Placement(transformation(extent={{0,-20},{-56,16}})));
equation

  connect(add.u1, ramp.y) annotation (Line(points={{62,-24},{70,-24},{70,-10},
          {79,-10}}, color={0,0,127}));
  connect(step.y, add.u2) annotation (Line(points={{79,-50},{70,-50},{70,-36},
          {62,-36}}, color={0,0,127}));
  connect(tGOV1_1.SPEED, add.y) annotation (Line(points={{-1.4,-11},{20,-11},{
          20,-30},{39,-30}}, color={0,0,127}));
  connect(const.y, tGOV1_1.Reference) annotation (Line(points={{39,30},{20,30},
          {20,6.97},{-1.085,6.97}}, color={0,0,127}));
  annotation(__ModelicaAssociation(TestCase(shouldPass=true)),Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
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
end TGOV1;
