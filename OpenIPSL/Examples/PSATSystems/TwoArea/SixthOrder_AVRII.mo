within OpenIPSL.Examples.PSATSystems.TwoArea;
model SixthOrder_AVRII "31-bus system with 6th-order machine and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0,
    Ka=7.04,
    Ta=0.4,
    Kf=1,
    Tf=0.05,
    Ke=1) annotation (Placement(transformation(extent={{-150,24},{-130,44}})));
equation
  connect(aVRTypeII.vf, order6.vf) annotation (Line(points={{-128,34},{-125.75,
          34},{-125.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order6.v) annotation (Line(points={{-152,28},{-152,28},{
          -152,18},{-152,16},{-96,16},{-96,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeII.vref, aVRTypeII.vref0) annotation (Line(points={{-152,40},{
          -156,40},{-156,42},{-158,42},{-158,54},{-140,54},{-140,46}}, color={0,
          0,127}));
  connect(aVRTypeII.vf0, order6.vf0) annotation (Line(points={{-140,22},{-140,
          22},{-140,8},{-140,4},{-140,10},{-166,10},{-166,60},{-118,60},{-118,
          41}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
Documentation(info="<html>
<p>This system is tests the sixth order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order3.w</code></li>
<li><code>order6.w</code></li>
</ul>
<p>Note that the oscillations, which present some considerable damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>B6.v</code></li>
<li><code>B30.v</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>TwoArea</strong> subpackage.</p>
</html>"));
end SixthOrder_AVRII;
