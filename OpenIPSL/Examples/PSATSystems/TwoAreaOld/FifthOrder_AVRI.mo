within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model FifthOrder_AVRI "5-bus system with 5th-order machine and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder5;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-136,6},{-120,22}})));
equation
  connect(aVRTypeI.vf, order5.vf) annotation (Line(points={{-118.4,14},{-114.6,
          14},{-114.6,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeI.v, order5.v) annotation (Line(points={{-137.6,9.2},{-140,9.2},
          {-140,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeI.vf0, order5.vf0) annotation (Line(points={{-128,4.4},{-128,-4},
          {-152,-4},{-152,34},{-110,34},{-110,11}}, color={0,0,127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-128,23.6},{
          -128,30},{-146,30},{-146,16},{-137.6,16},{-137.6,18.8}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),

    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>This system tests the fifth order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order5.w</code></li>
</ul>
<p>Note that the oscillations, which present some considerable damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>bus4.v</code></li>
<li><code>bus5.v</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>TwoAreaOld</strong> subpackage.</p>
</html>"));
end FifthOrder_AVRI;
