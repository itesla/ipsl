within OpenIPSL.Examples.PSATSystems.TwoArea;
model FourthOrder_AVRII "31-bus system with 4th-order machine and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Ka=7.04,
    Ta=0.4,
    Kf=1,
    Tf=0.05,
    Ke=1,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-148,22},{-128,42}})));
equation
  connect(aVRTypeII.vf, order4.vf) annotation (Line(points={{-126,32},{-124.75,
          32},{-124.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order4.v) annotation (Line(points={{-150,26},{-148,26},{
          -148,30},{-150,30},{-150,14},{-94,14},{-94,33},{-99,33}}, color={0,0,
          127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-138,44},{
          -138,50},{-156,50},{-156,38},{-150,38}}, color={0,0,127}));
  connect(order4.vf0, aVRTypeII.vf0) annotation (Line(points={{-118,41},{-118,
          56},{-118,52},{-166,52},{-166,10},{-138,10},{-138,20}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
Documentation(info="<html>
<p>This system is tests the fourth order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds.</p>
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
end FourthOrder_AVRII;
