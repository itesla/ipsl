within OpenIPSL.Examples.PSATSystems.TwoArea;
model FifthOrder_AVRII "31-bus system with 5th-order machine Type 2 and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder5;
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
    Be=0) annotation (Placement(transformation(extent={{-152,36},{-132,56}})));
equation
  connect(aVRTypeII.vf, order5.vf) annotation (Line(points={{-130,46},{-124.75,
          46},{-124.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order5.v) annotation (Line(points={{-154,40},{-152,40},{
          -152,18},{-94,18},{-94,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order5.vf0) annotation (Line(points={{-142,34},{-142,
          24},{-168,24},{-168,68},{-118,68},{-118,41}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-142,58},{
          -144,58},{-144,62},{-162,62},{-162,52},{-154,52}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>This system is tests the fifth order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
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
end FifthOrder_AVRII;
