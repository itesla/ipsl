within OpenIPSL.Examples.PSATSystems.ThreeArea;
model SixthOrder_AVRI "ABC system with 6th-order machines (Syn2) and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001)
    annotation (Placement(transformation(extent={{-152,82},{-142,92}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
    Te=0.01,
    v0=1.05,
    K0=25,
    vrmax=5,
    vrmin=-5,
    T1=10,
    T2=6.67,
    Tr=0.001) annotation (Placement(transformation(extent={{166,0},{156,10}})));
equation
  connect(Exc1.vf, Syn2.vf) annotation (Line(points={{-141,87},{-138.75,87},{-138.75,
          86},{-138.4,86}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-153,84},{-160,84},{-160,98},
          {-108,98},{-108,83.6},{-110.8,83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf)
    annotation (Line(points={{155,5},{153.75,5},{154,5}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{167,2},{172,2},{172,18},
          {130,18},{130,3},{131,3}}, color={0,0,127}));
  connect(Syn2.vf0, Exc1.vf0) annotation (Line(points={{-133.6,93.2},{-133.6,96},
          {-162,96},{-162,64},{-147,64},{-147,81}}, color={0,0,127}));
  connect(Exc1.vref, Exc1.vref0) annotation (Line(points={{-153,90},{-156,90},{
          -156,93},{-147,93}}, color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{161,-1},{161,-10},{
          174,-10},{174,26},{150,26},{150,11}}, color={0,0,127}));
  connect(Exc2.vref, Exc2.vref0) annotation (Line(points={{167,8},{170,8},{170,
          16},{161,16},{161,11}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20,
      Interval=0.001),
Documentation(info="<html>
<p>This system is tests the sixth order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3_2.w</code></li>
<li><code>Syn2.w</code></li>
</ul>
<p>Note that the oscillations illustrate a clear example of non-coherent machines.</p>
<p>Compare these results with the ones from the other example systems within the <strong>ThreeArea</strong> subpackage.</p>
</html>"));
end SixthOrder_AVRI;
