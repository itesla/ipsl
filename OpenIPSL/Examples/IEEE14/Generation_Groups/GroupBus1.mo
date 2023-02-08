within OpenIPSL.Examples.IEEE14.Generation_Groups;
model GroupBus1 "69kV/615MVA generation unit connected to bus 1"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=1.122656195484139 "Initial field voltage";
  parameter Real vref0=1.065622531687790 "Reference voltage AVR";
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR1(
    Ta=0.02,
    Kf=0.002,
    Tf=1,
    Ke=1,
    Te=0.2,
    Tr=0.001,
    vrmax=7.32,
    vrmin=0,
    Ka=200,
    v0=v_0) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 Syn1(
    Sn=615000000,
    Vn=69000,
    V_b=V_b,
    fn=60,
    ra=0,
    xd=0.8979,
    xq=0.646,
    x1d=0.2998,
    x2d=0.23,
    x2q=0.4,
    T1d0=7.4,
    T2d0=0.03,
    T2q0=0.033,
    M=2*5.148,
    D=2,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(AVR1.vf, Syn1.vf) annotation (Line(points={{12,10},{36,10}},
                        color={0,0,127}));
  connect(Syn1.v, AVR1.v) annotation (Line(points={{82,6},{90,6},{90,-32},{-20,-32},{-20,4},{-12,4}},
                                                    color={0,0,127}));
  connect(Syn1.p, pwPin) annotation (Line(points={{80,0},{110,0}},
                     color={0,0,255}));
  connect(Syn1.pm0, Syn1.pm) annotation (Line(points={{44,-22},{44,-28},{28,-28},{28,-10},{36,-10}},
                                            color={0,0,127}));
  connect(AVR1.vref0, AVR1.vref) annotation (Line(points={{0,22},{0,30},{-20,30},{-20,16},{-12,16}},
                                                               color={0,0,127}));
  connect(AVR1.vf0, Syn1.vf0) annotation (Line(points={{0,-2},{0,-12},{20,-12},{20,30},{44,30},{44,22}},
                                              color={0,0,127}));
  annotation (
    Icon(graphics={Text(lineColor = {0, 0, 255}, extent = {{-93, 6}, {-24, -12}}, textString = "", textStyle = {TextStyle.Italic}),
       Text(
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-20},{100,-40}},
          textString="%name"),
       Line(points={{-60,0},{-20,40},{20,0},{60,40}},
       color={28,108,200}),Ellipse(lineColor = {28, 108, 200}, extent={{-100,-100},{100,100}})}),
    Documentation(info="<html>
<p>69kV/615MVA Generation unit connected to bus 1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 5th order type 2, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
</html>"));
end GroupBus1;
