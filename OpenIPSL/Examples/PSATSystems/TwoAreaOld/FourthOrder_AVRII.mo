within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model FourthOrder_AVRII "5-bus system with 4th-order machine and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder4;
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
    Be=0) annotation (Placement(transformation(extent={{-136,14},{-116,34}})));
equation
  connect(order4.vf, aVRTypeII.vf)
    annotation (Line(points={{-114,5},{-114,14},{-114,24}}, color={0,0,127}));
  connect(aVRTypeII.v, order4.v) annotation (Line(points={{-138,18},{-152,18},{
          -152,-16},{-88,-16},{-88,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order4.vf0) annotation (Line(points={{-126,12},{-134,
          12},{-134,-2},{-148,-2},{-148,40},{-110,40},{-110,11}}, color={0,0,
          127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-126,36},{
          -134,36},{-144,36},{-144,34},{-144,30},{-136,30},{-138,30}}, color={0,
          0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    experiment(
      StopTime=20,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>This system tests the fourth order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds using the <code>Rkfix2</code> integrator.</p>
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
end FourthOrder_AVRII;
