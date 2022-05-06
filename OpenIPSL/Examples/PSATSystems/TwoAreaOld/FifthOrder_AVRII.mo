within OpenIPSL.Examples.PSATSystems.TwoAreaOld;
model FifthOrder_AVRII "5-bus system with 5th-order machine and AVR Type II"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder5;
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
    Be=0) annotation (Placement(transformation(extent={{-140,8},{-120,28}})));
equation
  connect(aVRTypeII.vf, order5.vf) annotation (Line(points={{-118,18},{-113.75,
          18},{-113.75,5},{-114,5}}, color={0,0,127}));
  connect(aVRTypeII.v, order5.v) annotation (Line(points={{-142,12},{-148,12},{
          -148,2},{-148,-14},{-86,-14},{-86,3},{-91,3}}, color={0,0,127}));
  connect(aVRTypeII.vf0, order5.vf0) annotation (Line(points={{-130,6},{-132,6},
          {-132,-4},{-132,-8},{-156,-8},{-156,40},{-144,40},{-144,34},{-110,34},
          {-110,11}}, color={0,0,127}));
  connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-130,30},{
          -134,30},{-134,32},{-148,32},{-148,24},{-142,24}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    experiment(
      StopTime=20),
Documentation(info="<html>
<p>This system tests the fifth order machine with a type 2 AVR, from PSAT. Simulate the system for 20 seconds.</p>
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
end FifthOrder_AVRII;
