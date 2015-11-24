within iPSL.Examples.Compliance.Electrical.Controls.PSSE.TG;
model HYGOV
  "Simple Machine Infinite Bus with Machine, Governor and Excitation system"

  iPSL.Electrical.Controls.PSSE.TG.HYGOV HYGOV(VELM=0.02, G_MAX=0.415)
    annotation (Placement(transformation(
        extent={{-40,-20},{40,20}},
        rotation=180,
        origin={-40,0})));
  Modelica.Blocks.Sources.Constant const(k=0.4)
    annotation (Placement(transformation(extent={{60,20},{40,40}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.1,
    duration=1,
    offset=0,
    startTime=0.5)
    annotation (Placement(transformation(extent={{100,-40},{80,-20}})));
  Modelica.Blocks.Sources.Step step(
    height=-0.1,
    offset=0,
    startTime=1)
    annotation (Placement(transformation(extent={{100,-80},{80,-60}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{60,-60},{40,-40}})));
equation
  connect(HYGOV.PMECH0, const.y) annotation (Line(points={{-1,10},{20,10},{20,
          30},{39,30}}, color={0,0,127}));
  connect(add.u1, ramp.y) annotation (Line(points={{62,-44},{70,-44},{70,-30},
          {79,-30}}, color={0,0,127}));
  connect(step.y, add.u2) annotation (Line(points={{79,-70},{70,-70},{70,-56},
          {62,-56}}, color={0,0,127}));
  connect(add.y, HYGOV.SPEED) annotation (Line(points={{39,-50},{20,-50},{20,-10},
          {-1,-10}}, color={0,0,127}));
  annotation(__ModelicaAssociation(TestCase(shouldPass=true)),Diagram(coordinateSystem(preserveAspectRatio=false,  extent={{-100,
            -120},{100,80}})),                                                                                     Icon(coordinateSystem(extent = {{-100, -120}, {100, 80}})),
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
end HYGOV;
