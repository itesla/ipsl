within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model FourthOrder_AVRI "5-bus system with 4th-order machine and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeIchange1_1(vrmax=7.57)
    annotation (Placement(transformation(extent={{-132,4},{-120,18}})));
equation
  connect(aVRTypeIchange1_1.vf, order4.vf) annotation (Line(points={{-118.8,11},
          {-115.7,11},{-115.7,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.v, order4.v) annotation (Line(points={{-133.2,6.8},
          {-136,6.8},{-136,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.vf0, order4.vf0) annotation (Line(points={{-126,2.6},
          {-126,-6},{-150,-6},{-150,32},{-110,32},{-110,11}}, color={0,0,127}));
  connect(aVRTypeIchange1_1.vref0, aVRTypeIchange1_1.vref) annotation (Line(
        points={{-126,19.4},{-126,26},{-140,26},{-140,15.2},{-133.2,15.2}},
        color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>This system tests the fourth order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order4.w</code></li>
</ul>
<p>Note that the oscillations, which present some considerable damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>bus4.v</code></li>
<li><code>bus5.v</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>TwoAreaOld</strong> subpackage.</p>
</html>"));
end FourthOrder_AVRI;
