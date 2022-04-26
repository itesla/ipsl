within OpenIPSL.Examples.IEEE14.Generation_Groups;
model GroupBus2 "69kV/60MVA generation unit connected to bus 2"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=2.718126892405429 "Initial field voltage";
  parameter Real vref0=1.181847826013889 "Reference voltage AVR";
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR1TypeII1(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=1.98,
    v0=v_0,
    vrmin=0,
    vrmax=4.38)
    annotation (Placement(transformation(extent={{-74,12},{-24,50}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn3(
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
    Q_0=Q_0) annotation (Placement(transformation(extent={{20,-36},{86,34}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}),          iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(aVR1TypeII1.vf, Syn3.vf) annotation (Line(points={{-19,31},{-2.65,31},
          {-2.65,16.5},{13.4,16.5}}, color={0,0,127}));
  connect(Syn3.v, aVR1TypeII1.v) annotation (Line(points={{89.3,9.5},{116,9.5},
          {116,-88},{-82,-88},{-82,-84},{-82,14},{-82,19.6},{-79,19.6}},color={
          0,0,127}));
  connect(Syn3.p, pwPin) annotation (Line(points={{86,-1},{110.65,-1},{110.65,0},
          {110,0}}, color={0,0,255}));
  connect(Syn3.pm0, Syn3.pm) annotation (Line(points={{26.6,-39.5},{26.6,-50},{
          2,-50},{2,-18.5},{13.4,-18.5}}, color={0,0,127}));
  connect(Syn3.vf0, aVR1TypeII1.vf0) annotation (Line(points={{26.6,37.5},{26.6,
          54},{-14,54},{-14,-12},{-14,-6},{-49,-6},{-49,8.2}}, color={0,0,127}));
  connect(aVR1TypeII1.vref0, aVR1TypeII1.vref) annotation (Line(points={{-49,
          53.8},{-49,68},{-98,68},{-98,40},{-98,42.4},{-79,42.4}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{
            120,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=
            false), graphics={
            Text(extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
           Line(points={{-60,-20},{-20,20},{20,-20},{60,20}},
          color={28,108,200}),Ellipse(extent={{-100,-100},{100,100}}, lineColor=
           {28,108,200})}),
    Documentation(info="<html>
<p>69kV/60MVA Generation unit connected to bus 2, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 6th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
</html>"));
end GroupBus2;
