within OpenIPSL.Examples.PSATSystems.TwoArea;
model ThirdOrder_AVRI "31-bus system with 3rd-order machine and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-146,24},{-126,44}})));
equation
  connect(aVRTypeI.vf, order3_1.vf) annotation (Line(points={{-124,34},{-122.5,
          34},{-122.5,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order3_1.v) annotation (Line(points={{-148,28},{-154,28},
          {-154,14},{-96,14},{-96,33},{-99,33}}, color={0,0,127}));
  connect(order3_1.vf0, aVRTypeI.vf0) annotation (Line(points={{-118,41},{-120,
          41},{-120,50},{-120,58},{-120,60},{-168,60},{-168,54},{-168,18},{-164,
          18},{-136,18},{-136,22}}, color={0,0,127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-136,46},{-136,
          52},{-154,52},{-154,40},{-148,40}}, color={0,0,127}));
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
<p>This system is tests the third order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
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
end ThirdOrder_AVRI;
