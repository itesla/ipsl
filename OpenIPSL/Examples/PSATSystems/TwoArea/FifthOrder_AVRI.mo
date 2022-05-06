within OpenIPSL.Examples.PSATSystems.TwoArea;
model FifthOrder_AVRI "31-bus system with 5th-order machine Type 2 and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder5;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-150,26},{-130,46}})));
equation
  connect(aVRTypeI.vf, order5.vf) annotation (Line(points={{-128,36},{-124.5,36},
          {-124.5,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order5.v) annotation (Line(points={{-152,30},{-156,30},{-156,
          14},{-96,14},{-96,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeI.vref, aVRTypeI.vref0) annotation (Line(points={{-152,42},{-158,
          42},{-164,42},{-164,56},{-140,56},{-140,48}}, color={0,0,127}));
  connect(order5.vf0, aVRTypeI.vf0) annotation (Line(points={{-118,41},{-118,64},
          {-172,64},{-172,6},{-140,6},{-140,24}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
Documentation(info="<html>
<p>This system is tests the fifth order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order3.w</code></li>
<li><code>order5.w</code></li>
</ul>
<p>Note that the oscillations, which present some considerable damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>B6.v</code></li>
<li><code>B30.v</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>TwoArea</strong> subpackage.</p>
</html>"));
end FifthOrder_AVRI;
