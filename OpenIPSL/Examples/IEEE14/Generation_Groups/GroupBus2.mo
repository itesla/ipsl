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
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
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
    Q_0=Q_0) annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(aVR1TypeII1.vf, Syn3.vf) annotation (Line(points={{12,10},{36,10}},
                                     color={0,0,127}));
  connect(Syn3.v, aVR1TypeII1.v) annotation (Line(points={{82,6},{90,6},{90,-32},{-20,-32},{-20,4},{-12,4}},
                                                                        color={
          0,0,127}));
  connect(Syn3.p, pwPin) annotation (Line(points={{80,0},{110,0}},
                    color={0,0,255}));
  connect(Syn3.pm0, Syn3.pm) annotation (Line(points={{44,-22},{44,-28},{28,-28},{28,-10},{36,-10}},
                                          color={0,0,127}));
  connect(Syn3.vf0, aVR1TypeII1.vf0) annotation (Line(points={{44,22},{44,30},{20,30},{20,-12},{0,-12},{0,-2}},
                                                               color={0,0,127}));
  connect(aVR1TypeII1.vref0, aVR1TypeII1.vref) annotation (Line(points={{0,22},{0,30},{-20,30},{-20,16},{-12,16}},
                                                                   color={0,0,
          127}));
  annotation (
    Icon(graphics={Text(extent={{-100,-20},{100,-40}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
           Line(points={{-60,0},{-20,40},{20,0},{60,40}},
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
