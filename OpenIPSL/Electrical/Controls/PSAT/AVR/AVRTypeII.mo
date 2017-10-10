within OpenIPSL.Electrical.Controls.PSAT.AVR;
model AVRTypeII "PSAT AVR Type 2"

  Modelica.Blocks.Interfaces.RealInput v "Generator termminal voltage (pu)"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput vf "Filed voltage (pu)" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,0}), iconTransformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealInput vref
    "Reference generator terminal voltage (pu)" annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}), iconTransformation(extent
          ={{-140,40},{-100,80}})));
  parameter Real vrmin "Minimum regulator voltage (pu)";
  parameter Real vrmax "Maximum regulator voltage (p.u..)";
  parameter Real Ka "Amplifier gain (p.u/p.u)";
  parameter Real Ta "Amplifier time constant (s)";
  parameter Real Kf "Stabilizer gain (p.u/p.u)";
  parameter Real Tf "Stabilizer time constant (s)";
  parameter Real Ke "Field circuit integral deviation (p.u/p.u)";
  parameter Real Te "Field circuit time constant (s)";
  parameter Real Tr "Measurement time constant (s)";
  parameter Real Ae=0.0006 "1st ceiling coefficient";
  parameter Real Be=0.9 "2nd ceiling coefficient";
  parameter Real v0=1 "Initialization";

  parameter Real vf00(fixed=false) "Initialization";
  parameter Real vr10=Ke*vf00 + Ae*Modelica.Math.exp(Be*abs(vf00))*vf00
    "Initialization";
  parameter Real vr20=-vf00*Kf/Tf "Initialization";
public
  Modelica.Blocks.Continuous.FirstOrder simpleLagLim(
    T=Ta,
    k=Ka,
    y_start=Ka*vr10,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

  Modelica.Blocks.Interfaces.RealOutput vref0 "Voltage reference at t=0 (pu)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealInput vf0
    "Reference generator terminal voltage (pu)" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-112}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{26,10},{46,-10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    y_start=vf00,
    k=1/Ke,
    T=Te/Ke,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  NonElectrical.Nonlinear.CeilingBlock ceilingBlock(Ae=Ae, Be=Be)
    annotation (Placement(transformation(extent={{70,48},{50,68}})));
  Modelica.Blocks.Continuous.TransferFunction firstOrder1(
    y_start=vr20,
    a={Tf,1},
    x_start={vf00},
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={Kf,0}) annotation (Placement(transformation(extent={{72,-60},{52,-40}})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(
    k=1,
    T=Tr,
    y_start=v0,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-90,-70},{-70,-50}})));
  Modelica.Blocks.Math.Feedback Verr
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vrmax, uMin=vrmin)
    annotation (Placement(transformation(extent={{4,-10},{24,10}})));
initial algorithm
  vf00 := vf0;
algorithm
  vref0 := v0 + vr10/Ka;

equation
  connect(firstOrder.y, vf)
    annotation (Line(points={{73,0},{88,0},{110,0}}, color={0,0,127}));
  connect(vf, vf)
    annotation (Line(points={{110,0},{106,0},{110,0}}, color={0,0,127}));
  connect(ceilingBlock.u, vf) annotation (Line(points={{72,58},{80,58},{80,0},{
          110,0}}, color={0,0,127}));
  connect(ceilingBlock.y, feedback.u2)
    annotation (Line(points={{49,58},{36,58},{36,8}}, color={0,0,127}));
  connect(firstOrder1.u, vf) annotation (Line(points={{74,-50},{80,-50},{80,0},
          {110,0}},color={0,0,127}));
  connect(feedback1.y, simpleLagLim.u)
    annotation (Line(points={{-27,0},{-22,0}},color={0,0,127}));
  connect(firstOrder1.y, feedback1.u2)
    annotation (Line(points={{51,-50},{-36,-50},{-36,-8}}, color={0,0,127}));
  connect(v, firstOrder2.u) annotation (Line(points={{-120,-60},{-106,-60},{-92,
          -60}}, color={0,0,127}));
  connect(Verr.u2, firstOrder2.y) annotation (Line(points={{-60,-8},{-60,-8},{-60,
          -60},{-69,-60}}, color={0,0,127}));
  connect(Verr.y, feedback1.u1)
    annotation (Line(points={{-51,0},{-44,0}}, color={0,0,127}));
  connect(Verr.u1, vref) annotation (Line(points={{-68,0},{-80,0},{-80,60},{-120,
          60}}, color={0,0,127}));
  connect(feedback.y, firstOrder.u)
    annotation (Line(points={{45,0},{47.5,0},{50,0}}, color={0,0,127}));
  connect(simpleLagLim.y, limiter.u)
    annotation (Line(points={{1,0},{2,0}}, color={0,0,127}));
  connect(feedback.u1, limiter.y)
    annotation (Line(points={{28,0},{26,0},{25,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1,
        preserveAspectRatio=false), graphics={Text(
          extent={{30,-38},{44,-46}},
          lineColor={0,0,127},
          textString="vr2"), Text(
          extent={{28,6},{28,6}},
          lineColor={0,0,127},
          textString="vr1")}),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        initialScale=0.1,
        preserveAspectRatio=false), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
        Text(
          extent={{-90,80},{-50,40}},
          lineColor={0,0,255},
          textString="vref"),
        Text(
          extent={{-100,-40},{-60,-70}},
          lineColor={0,0,255},
          textString="v"),
        Text(
          extent={{60,20},{100,-20}},
          lineColor={0,0,255},
          textString="vf"),
        Text(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          textString="AVR2"),
        Text(
          extent={{16,-60},{56,-100}},
          lineColor={0,0,255},
          textString="vf0
"),
        Text(
          extent={{2,102},{42,62}},
          lineColor={0,0,255},
          textString="vref0")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type II, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end AVRTypeII;
