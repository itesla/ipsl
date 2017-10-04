within PSAT_Systems.TwoArea;
model ThirdOrder_AVRII "31-bus system with 3rd-order machine and AVR Type II"
  extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0,
    vref0=1.198480294896434,
    Ka=7.04,
    Ta=0.4,
    Kf=1,
    Tf=0.05,
    Ke=1,
    vf0=1.045301276070898)
    annotation (Placement(transformation(extent={{-150,22},{-130,42}})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-167,49})));
equation
  connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-161.5,49},{-158,
          49},{-158,37.4},{-148,37.4}}, color={0,0,127}));
  connect(aVRTypeII.vf, order3_1.vf) annotation (Line(points={{-131.5,34.6},{-125.75,
          34.6},{-125.75,35},{-120,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order3_1.v) annotation (Line(points={{-148,31},{-150,31},
          {-150,30},{-152,30},{-152,16},{-94,16},{-94,33},{-99,33}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Tin Rabuzin, May 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Yuwa Chompoobutrgool, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end ThirdOrder_AVRII;