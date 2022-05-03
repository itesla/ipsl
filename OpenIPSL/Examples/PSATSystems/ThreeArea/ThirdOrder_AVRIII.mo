within OpenIPSL.Examples.PSATSystems.ThreeArea;
model ThirdOrder_AVRIII "ABC system with 3rd-order machines and AVR Type III"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{-150,80},{-140,90}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{170,0},{160,10}})));
  Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        origin={-164,80})));
  Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        origin={184,0})));
equation
  connect(Exc1.v, order3_1.v) annotation (Line(points={{-149.583,87.5},{-156,
          87.5},{-156,96},{-106,96},{-106,83},{-109,83}},
                                                    color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{169.583,7.5},{174,7.5},
          {174,16},{128,16},{128,3},{131,3}},
                                         color={0,0,127}));
  connect(vs_1.y, Exc1.vs) annotation (Line(points={{-159.6,80},{-156,80},{-156,
          82.5},{-149.583,82.5}},
                          color={0,0,127}));
  connect(vs_2.y, Exc2.vs) annotation (Line(points={{179.6,0},{174,0},{174,2.5},
          {169.583,2.5}},
                   color={0,0,127}));
  connect(Exc1.vf0, order3_1.vf0) annotation (Line(points={{-145,89.5833},{-145,
          94},{-128,94},{-128,91}},
                                color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{165,9.58333},{165,14},
          {150,14},{150,11}},color={0,0,127}));
  connect(Exc1.vf, order3_1.vf) annotation (Line(points={{-139.583,85},{-134.75,
          85},{-134.75,85},{-132,85}}, color={0,0,127}));
  connect(order3_2.vf, Exc2.vf) annotation (Line(points={{154,5},{156,5},{156,5},
          {159.583,5}},
                      color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{200,120}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    Documentation(info="<html>
<p>This system is tests the third order machine with a type 3 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3_1.w</code></li>
<li><code>order3_2.w</code></li>
</ul>
<p>Note that the oscillations illustrate a clear example of non-coherent machines.</p>
<p>Compare these results with the ones from the other example systems within the <strong>ThreeArea</strong> subpackage.</p>
</html>"));
end ThirdOrder_AVRIII;
