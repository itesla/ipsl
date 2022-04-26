within OpenIPSL.Examples.IEEE14.Generation_Groups;
model GroupBus3 "69kV/60MVA reactive power generation unit (synchronous condenser) connected to bus 3"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=2.045032675265054 "Initial field voltage";
  parameter Real vref0=1.112638137121514 "Reference voltage AVR";
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR2TypeII2(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=1.98,
    v0=v_0,
    vrmin=0,
    vrmax=4.38) annotation (Placement(transformation(
        extent={{-30,-32},{30,32}},
        rotation=0,
        origin={-28,-2})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn2(
    Sn=60000000,
    Vn=69000,
    V_b=V_b,
    fn=60,
    ra=0.0031,
    xq=0.98,
    x1d=0.1850,
    x1q=0.36,
    x2d=0.13,
    x2q=0.13,
    T1d0=6.1,
    T1q0=0.3,
    T2q0=0.099,
    M=2*6.54,
    D=2,
    v_0=v_0,
    xd=1.05,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(
        extent={{-28,-25},{28,25}},
        rotation=0,
        origin={66,1})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}),         iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(aVR2TypeII2.vf, Syn2.vf) annotation (Line(points={{8,-2},{12,-2},{12,
          13.5},{32.4,13.5}}, color={0,0,127}));
  connect(Syn2.v, aVR2TypeII2.v) annotation (Line(points={{96.8,8.5},{112,8.5},
          {112,-48},{-82,-48},{-82,-21.2},{-64,-21.2}}, color={0,0,127}));
  connect(Syn2.p, pwPin) annotation (Line(points={{94,1},{115.4,1},{115.4,0},{
          110,0}},  color={0,0,255}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{43.6,-26.5},{43.6,-34},{
          2,-34},{2,-11.5},{32.4,-11.5}}, color={0,0,127}));
  connect(aVR2TypeII2.vref0, aVR2TypeII2.vref) annotation (Line(points={{-28,
          36.4},{-28,72},{-28,76},{-86,76},{-86,17.2},{-64,17.2}}, color={0,0,
          127}));
  connect(Syn2.vf0, aVR2TypeII2.vf0) annotation (Line(points={{43.6,28.5},{43.6,
          90},{-92,90},{-92,-86},{-68,-86},{-68,-40.4},{-28,-40.4}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            120,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=
            false), graphics={
                             Text(
          extent={{-93,6},{-24,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString=""),
          Text(extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
                         Line(points={{-60,-20},{-20,20},{20,-20},{60,20}},
          color={28,108,200}),Ellipse(extent={{-100,-100},{100,100}}, lineColor=
           {28,108,200})}),
    Documentation(info="<html>
<p>69kV/60MVA Reactive power generation unit (synchronous condenser) connected to bus 3, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 6th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
</html>"));
end GroupBus3;
