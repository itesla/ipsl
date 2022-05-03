within OpenIPSL.Examples.PSATSystems.TwoArea;
model SixthOrder_AVRI "31-bus system with 6th-order machine and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-148,24},{-128,44}})));
equation
  connect(aVRTypeI.vf, order6.vf) annotation (Line(points={{-126,34},{-123.5,34},
          {-123.5,35},{-122,35}}, color={0,0,127}));
  connect(aVRTypeI.v, order6.v) annotation (Line(points={{-150,28},{-154,28},{-154,
          16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
  connect(aVRTypeI.vf0, order6.vf0) annotation (Line(points={{-138,22},{-140,22},
          {-140,12},{-140,2},{-140,4},{-168,4},{-168,60},{-118,60},{-118,41}},
        color={0,0,127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-138,46},{-138,
          52},{-158,52},{-158,40},{-150,40}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-100},{180,100}},
          preserveAspectRatio=false)),

    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>This system is tests the sixth order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
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
end SixthOrder_AVRI;
