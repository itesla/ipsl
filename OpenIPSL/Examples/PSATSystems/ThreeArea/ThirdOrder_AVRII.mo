within OpenIPSL.Examples.PSATSystems.ThreeArea;
model ThirdOrder_AVRII "ABC system with 3rd-order machines and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII Exc1(
    Te=0.01,
    v0=1.05,
    vrmax=5,
    vrmin=-5,
    Tr=0.001,
    Ka=25,
    Ta=10,
    Kf=6.67,
    Tf=1,
    Ke=1,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-144,78},{-134,88}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII Exc2(
    Te=0.01,
    v0=1.05,
    vrmax=5,
    vrmin=-5,
    Tr=0.001,
    Ka=25,
    Ta=10,
    Kf=6.67,
    Tf=1,
    Ke=1,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{166,-2},{156,8}})));
equation
  connect(Exc1.vf, order3_1.vf) annotation (Line(points={{-133,83},{-132.375,83},
          {-132.375,85},{-132,85}}, color={0,0,127}));
  connect(Exc1.v, order3_1.v) annotation (Line(points={{-145,80},{-152,80},{-152,
          96},{-106,96},{-106,83},{-109,83}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{155,3},{154.375,3},{
          154.375,5},{154,5}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167,0},{176,0},{176,24},
          {128,24},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vref0, Exc1.vref) annotation (Line(points={{-139,89},{-139,92},{
          -145,92},{-145,86}}, color={0,0,127}));
  connect(order3_1.vf0, Exc1.vf0) annotation (Line(points={{-128,91},{-128,94},
          {-156,94},{-156,68},{-139,68},{-139,77}}, color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{161,-3},{161,-10},{
          174,-10},{174,20},{150,20},{150,11}}, color={0,0,127}));
  connect(Exc2.vref, Exc2.vref0) annotation (Line(points={{167,6},{170,6},{170,
          16},{161,16},{161,9}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),

    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>This system is tests the third order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3_1.w</code></li>
<li><code>order3_2.w</code></li>
</ul>
<p>Note that the oscillations illustrate a clear example of non-coherent machines.</p>
<p>Compare these results with the ones from the other example systems within the <strong>ThreeArea</strong> subpackage.</p>
</html>"));
end ThirdOrder_AVRII;
