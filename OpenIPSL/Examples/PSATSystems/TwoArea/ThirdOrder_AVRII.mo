within OpenIPSL.Examples.PSATSystems.TwoArea;
model ThirdOrder_AVRII "31-bus system with 3rd-order machine and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder3;
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
    Ke=1) annotation (Placement(transformation(extent={{-152,38},{-132,58}})));
equation
  connect(aVRTypeII.vf, order3_1.vf) annotation (Line(points={{-130,48},{-125.75,
          48},{-125.75,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeII.v, order3_1.v) annotation (Line(points={{-154,42},{-162,42},
          {-162,30},{-164,30},{-164,16},{-92,16},{-92,33},{-99,33}}, color={0,0,
          127}));
  connect(order3_1.vf0, aVRTypeII.vf0) annotation (Line(points={{-118,41},{-120,
          41},{-120,64},{-120,68},{-168,68},{-168,36},{-142,36}}, color={0,0,
          127}));
  connect(aVRTypeII.vref, aVRTypeII.vref0) annotation (Line(points={{-154,54},{
          -158,54},{-158,56},{-160,56},{-160,64},{-142,64},{-142,60}}, color={0,
          0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>This system is tests the third order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order3.w</code></li>
<li><code>order3_1.w</code></li>
</ul>
<p>Note that the oscillations, which are not well damped, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>B6.v</code></li>
<li><code>B30.v</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>TwoArea</strong> subpackage.</p>
</html>"));
end ThirdOrder_AVRII;
