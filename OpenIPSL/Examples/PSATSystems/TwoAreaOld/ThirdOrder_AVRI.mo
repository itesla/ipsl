within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model ThirdOrder_AVRI "5-bus system with 3rd-order machine and AVR Type I"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder3;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeII(
    v0=1.05,
    vrmin=0,
    vrmax=7.57,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-136,10},{-118,24}})));
equation
  connect(aVRTypeII.vf, order3.vf) annotation (Line(points={{-116.2,17},{-114.55,
          17},{-114.55,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order3.v) annotation (Line(points={{-137.8,12.8},{-142,
          12.8},{-142,-14},{-86,-14},{-86,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order3.vf0) annotation (Line(points={{-127,8.6},{-127,
          2},{-127,0},{-152,0},{-152,36},{-106,36},{-106,38},{-110,38},{-110,11}},
        color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-127,25.4},
          {-126,25.4},{-126,28},{-140,28},{-140,21.2},{-137.8,21.2}}, color={0,
          0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>This system tests the third order machine with a type 1 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
<p>Variables of interest are related to the (non-)coherency observed between the synchronous machines:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3.w</code></li>
</ul>
<p>Note that the oscillations, which have low damping, have opposing phases, meaning that one machine is swinging against the other, in a clear example of non-coherent machines. In addition, plot:</p>
<ul>
<li><code>bus4.v</code></li>
<li><code>bus5.v</code></li>
</ul>
<p>Note that these voltages present oscillations with opposing phases as well. Compare these results with the ones from the other example systems within the <strong>TwoAreaOld</strong> subpackage.</p>
</html>"));
end ThirdOrder_AVRI;
