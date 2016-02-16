within IEEE9.Generation_Groups;
model Gen2
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=1.359665419632471;
  parameter Real vref0=1.095179545801796;

  parameter Real height_2 annotation (Dialog(group="AVR Disturbance"));
  parameter Real tstart_2 annotation (Dialog(group="AVR Disturbance"));
  parameter Boolean refdisturb_2 annotation (Dialog(group="AVR Disturbance"));

  iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 gen(
    Sn=100,
    Vn=13.8,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=0,
    xd=1.3125,
    xd1=0.1813,
    xq1=0.25,
    Td10=5.89,
    Tq10=0.6,
    M=6.02,
    D=0,
    xq=1.2578) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={28,14})));
  iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(
    vrmin=-5,
    vrmax=5,
    v0=V_0,
    vref0=vref0,
    vf0=vf0,
    Ka=20,
    Ta=0.2,
    Kf=0.063,
    Tf=0.35,
    Ke=1,
    Te=0.314,
    Tr=0.001,
    Ae=0.0039,
    Be=1.555) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-6,10})));
  Modelica.Blocks.Sources.Constant vref2(k=vref0) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-71,25})));
  Modelica.Blocks.Sources.Step step(
    startTime=tstart_2,
    height=height_2,
    offset=vref0) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-56,-2})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(extent={{-50,12},{-40,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=refdisturb_2) annotation (Placement(transformation(extent={{-80,2},{-70,12}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  //Real P_MW;
  //Real Q_MVA;
equation
  //P_MW = gen.P*S_b;
  //Q_MVA = gen.Q*S_b;
  connect(gen.v, AVR.v) annotation (Line(
      points={{39,17},{48,17},{48,-14},{-22,-14},{-22,9},{-14,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, AVR.vref) annotation (Line(points={{-39.5,17},{-26.75,17},{-26.75,15.4},{-14,15.4}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{-69.5,7},{-66,7},{-66,17},{-51,17}}, color={255,0,255}));
  connect(vref2.y, switch1.u3) annotation (Line(points={{-65.5,25},{-60,25},{-60,13},{-51,13}}, color={0,0,127}));
  connect(step.y, switch1.u1) annotation (Line(points={{-56,2.4},{-56,21},{-51,21}}, color={0,0,127}));
  connect(gen.p, pwPin) annotation (Line(points={{39,14.0496},{66,14.0496},{66,0},{110,0}}, color={0,0,255}));
  connect(AVR.vf, gen.vf) annotation (Line(points={{2.5,12.6},{8,12.6},{8,19},{18,19}}, color={0,0,127}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{20,3},{20,0},{12,0},{12,9},{18,9}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(extent={{-100,-100},{100,100}}, lineColor={28,108,200}),
        Line(points={{-60,-20},{-20,20},{20,-20},{60,20}}, color={28,108,200}),
        Text(
          extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Text(
          extent={{62,106},{134,68}},
          lineColor={238,46,47},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(P_MW, significantDigits=3))),
        Text(
          extent={{62,-70},{134,-108}},
          lineColor={0,255,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(Q_MVA, significantDigits=3)))}));
end Gen2;
