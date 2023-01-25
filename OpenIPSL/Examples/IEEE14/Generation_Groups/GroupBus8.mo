within OpenIPSL.Examples.IEEE14.Generation_Groups;
model GroupBus8 "18kV/25MVA reactive power generation unit (synchronous condenser) connected to bus 8"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=2.622215878949932 "Initial field voltage";
  parameter Real vref0=1.221943942023239 "Reference voltage AVR";
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR3TypeII2(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=0.7,
    v0=v_0,
    vrmin=1.395,
    vrmax=6.810) annotation (Placement(visible = true, transformation(origin = {-2, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn4(
    fn=60,
    D=2,
    Sn=25000000,
    Vn=18000,
    V_b=V_b,
    xd=1.25,
    xq=1.22,
    x1d=0.232,
    x1q=0.715,
    x2d=0.12,
    x2q=0.12,
    T1d0=4.75,
    T1q0=1.5,
    T2d0=0.06,
    T2q0=0.21,
    M=2*5.06,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=0.0041) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        origin={60,0})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}),         iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(aVR3TypeII2.vf, Syn4.vf) annotation (
    Line(points = {{10, 10}, {36, 10}}, color = {0, 0, 127}));
  connect(Syn4.v, aVR3TypeII2.v) annotation (
    Line(points = {{82, 6}, {88, 6}, {88, -30}, {-18, -30}, {-18, 4}, {-14, 4}}, color = {0, 0, 127}));
  connect(Syn4.p, pwPin) annotation (Line(points={{80,0},{110,0}},
                   color={0,0,255}));
  connect(Syn4.pm0, Syn4.pm) annotation (Line(points={{44,-22},{44,-26},{18,-26},
          {18,-10},{36,-10}},             color={0,0,127}));
  connect(Syn4.vf0, aVR3TypeII2.vf0) annotation (
    Line(points = {{44, 22}, {44, 28}, {14, 28}, {14, -26}, {-2, -26}, {-2, -2}}, color = {0, 0, 127}));
  connect(aVR3TypeII2.vref0, aVR3TypeII2.vref) annotation (
    Line(points = {{-2, 22}, {-2, 28}, {-18, 28}, {-18, 16}, {-14, 16}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(lineColor = {0, 0, 255}, extent = {{-93, 6}, {-24, -12}}, textString = "", textStyle = {TextStyle.Italic}),
          Text(origin={-4.26002,12},
                                 lineColor = {28, 108, 200}, fillColor = {0, 0, 255},
            fillPattern =                                                                           FillPattern.Solid, extent={{
              -86.74,-32},{96.26,-52}},                                                                                                                  textString = "%name"),
                         Line(points={{-60,0},{-20,40},{20,0},{60,40}},
          color={28,108,200}),Ellipse(lineColor = {28, 108, 200}, extent={{-100,
              -100},{100,100}})}),
    Documentation(info="<html>
<p>18kV/25MVA Reactive power generation unit (synchronous condenser) connected to bus 8, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 6th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
</html>"),
  Diagram(coordinateSystem(extent = {{-20, 40}, {120, -40}})));
end GroupBus8;
