within OpenIPSL.Examples.PSATSystems.ThreeArea;
model SixthOrder_AVRII "ABC system with 6th-order machines (Syn2) and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses.BaseOrder6;
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
    Be=0) annotation (Placement(transformation(extent={{-150,80},{-140,90}})));
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
    Be=0) annotation (Placement(transformation(extent={{170,0},{160,10}})));
equation
  connect(Syn2.vf, Exc1.vf) annotation (Line(points={{-138.4,86},{-138,86},{-138,
          85},{-139,85}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-151,82},{-166,82},{-166,98},
          {-108,98},{-108,83.6},{-110.8,83.6}}, color={0,0,127}));
  connect(order3_2.vf, Exc2.vf)
    annotation (Line(points={{154,5},{156,5},{159,5}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{171,2},{176,2},{176,24},
          {128,24},{128,3},{131,3}}, color={0,0,127}));
  connect(Exc1.vref0, Exc1.vref) annotation (Line(points={{-145,91},{-145,94},{
          -156,94},{-156,88},{-151,88}}, color={0,0,127}));
  connect(Syn2.vf0, Exc1.vf0) annotation (Line(points={{-133.6,93.2},{-133.6,96},
          {-156,96},{-156,66},{-145,66},{-145,79}}, color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{165,-1},{165,-8},{
          178,-8},{178,18},{178,20},{150,20},{150,11}}, color={0,0,127}));
  connect(Exc2.vref0, Exc2.vref) annotation (Line(points={{165,11},{165,16},{
          174,16},{174,8},{171,8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
Documentation(info="<html>
<p>This system is tests the sixth order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3_2.w</code></li>
<li><code>Syn2.w</code></li>
</ul>
<p>Note that the oscillations illustrate a clear example of non-coherent machines.</p>
<p>Compare these results with the ones from the other example systems within the <strong>ThreeArea</strong> subpackage.</p>
</html>"));
end SixthOrder_AVRII;
