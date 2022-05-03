within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model SixthOrder_AVRI "5-bus system with 6th-order machine and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-136,-2},{-120,12}})));
equation
  connect(aVRTypeI.vf, order6.vf) annotation (Line(points={{-118.4,5},{-114.6,5},
          {-114,5}}, color={0,0,127}));
  connect(aVRTypeI.v, order6.v) annotation (Line(points={{-137.6,0.8},{-148,0.8},
          {-148,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeI.vf0, order6.vf0) annotation (Line(points={{-128,-3.4},{-136,
          -3.4},{-136,-8},{-144,-8},{-144,24},{-108,24},{-108,20},{-110,20},{-110,
          11}}, color={0,0,127}));
  connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-128,13.4},{
          -128,18},{-128,16},{-142,16},{-142,9.2},{-137.6,9.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>This system tests the sixth order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order6.w</code></li>
</ul>
<p>Note that the oscillations, which present some considerable damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>bus4.v</code></li>
<li><code>bus5.v</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>TwoAreaOld</strong> subpackage.</p>
</html>"));
end SixthOrder_AVRI;
