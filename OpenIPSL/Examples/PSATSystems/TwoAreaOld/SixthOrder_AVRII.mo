within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model SixthOrder_AVRII "5-bus system with 6th-order machine and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder6;
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
    Ke=1) annotation (Placement(transformation(extent={{-138,6},{-118,26}})));
equation
  connect(aVRTypeII.vf, order6.vf) annotation (Line(points={{-116,16},{-114.75,
          16},{-114.75,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order6.v) annotation (Line(points={{-140,10},{-142,10},{
          -146,10},{-146,-16},{-88,-16},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order6.vf0) annotation (Line(points={{-128,4},{-130,4},
          {-130,-8},{-152,-8},{-152,34},{-110,34},{-110,11}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-128,28},{
          -136,28},{-136,30},{-140,30},{-140,22}}, color={0,0,127}));
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
<p>This system tests the sixth order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
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
end SixthOrder_AVRII;
