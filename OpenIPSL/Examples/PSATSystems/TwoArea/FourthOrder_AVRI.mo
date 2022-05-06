within OpenIPSL.Examples.PSATSystems.TwoArea;
model FourthOrder_AVRI "31-bus system with 4th-order machine and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-146,26},{-128,44}})));
equation
  connect(aVRTypeI.vf, order4.vf) annotation (Line(points={{-126.2,35},{-123.55,
          35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order4.v) annotation (Line(points={{-147.8,29.6},{-152,
          29.6},{-152,16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeI.vf0, order4.vf0) annotation (Line(points={{-137,24.2},{-137,
          18},{-162,18},{-162,26},{-162,58},{-118,58},{-118,41}}, color={0,0,
          127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-137,45.8},{
          -137,52},{-152,52},{-152,38},{-152,40.4},{-147.8,40.4}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
Documentation(info="<html>
<p>This system is tests the fourth order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order3.w</code></li>
<li><code>order4.w</code></li>
</ul>
<p>Note that the oscillations, which present some considerable damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>B6.v</code></li>
<li><code>B30.v</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>TwoArea</strong> subpackage.</p>
</html>"));
end FourthOrder_AVRI;
