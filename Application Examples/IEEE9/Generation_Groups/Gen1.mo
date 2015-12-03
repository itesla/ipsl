within IEEE9.Generation_Groups;
model Gen1
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real ra1(min=0.00,max=0.02) "Armature resistance (pu) ";
  parameter Real xd1(min=0.6,max=2.3) "d-axis reactance (pu)";
  parameter Real xq1(min=0.4,max=2.3) "q-axis reactance (pu) ";
  parameter Real x1d1(min=0.15,max=0.5) "d-axis transient reactance (pu)";
  parameter Real x1q1(min=0.15,max=1.0) "q-axis transient reactance (pu)";
  parameter Real T1d1(min=1.5,max=9.0) "d-axis transient time constant (s)";
  parameter Real T1q1(min=1.5,max=10) "q-axis transient time constant (s) ";
  parameter Real M1 "Machanical starting time (2H) (kWs/kVA)";
  parameter Real D1;
  parameter Real Ka_1;
  parameter Real Ta_1 "(s)";
  parameter Real Kf_1;
  parameter Real Tf_1 "(s)";
  parameter Real Ke_1;
  parameter Real Te_1 "(s) ";
  parameter Real Tr_1;
  parameter Real Ae_1;
  parameter Real Be_1;
  parameter Real height_1;
  parameter Real tstart_1;
  parameter Boolean refdisturb_1;

  iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 gen(
    Sn=100,
    Vn=18000,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=ra1,
    xd=xd1,
    xq=xq1,
    xd1=x1d1,
    xq1=x1q1,
    Td10=T1d1,
    Tq10=T1q1,
    M=M1,
    D=D1)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={28,14})));
  iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(
    vrmin=-5,
    vrmax=5,
    v0=1.025000000000000,
    vf0=1.755517086537914,
    vref0=1.118023800520641,
    Ka=Ka_1,
    Ta=Ta_1,
    Kf=Kf_1,
    Tf=Tf_1,
    Ke=Ke_1,
    Te=Te_1,
    Tr=Tr_1,
    Ae=Ae_1,
    Be=Be_1)                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-6,10})));
  Modelica.Blocks.Sources.Constant vref2(k=1.118023800520641)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-71,25})));
  Modelica.Blocks.Sources.Step step(                 startTime=tstart_1,
    offset=1.118023800520641,
    height=height_1)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-56,-2})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-50,12},{-40,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=refdisturb_1)
    annotation (Placement(transformation(extent={{-80,2},{-70,12}})));
  iPSL.Connectors.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Real P_MW;
  Real Q_MVA;
equation
  P_MW = gen.P*S_b;
  Q_MVA = gen.Q*S_b;
  connect(AVR.vf,gen. vf) annotation (Line(
      points={{2.5,12.6},{10,12.6},{10,19},{18,19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gen.pm0,gen. pm) annotation (Line(
      points={{20,3},{46,3},{46,30},{12,30},{12,9},{18,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gen.v,AVR. v) annotation (Line(
      points={{39,17},{48,17},{48,-14},{-22,-14},{-22,9},{-14,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y,AVR. vref) annotation (Line(points={{-39.5,17},{-26.75,17},
          {-26.75,15.4},{-14,15.4}},       color={0,0,127}));
  connect(booleanConstant.y,switch1. u2) annotation (Line(points={{-69.5,7},{-66,
          7},{-66,17},{-51,17}},         color={255,0,255}));
  connect(vref2.y,switch1. u3) annotation (Line(points={{-65.5,25},{-60,25},{-60,
          13},{-51,13}},  color={0,0,127}));
  connect(step.y,switch1. u1) annotation (Line(points={{-56,2.4},{-56,21},{-51,21}},
                color={0,0,127}));
  connect(gen.p, pwPin) annotation (Line(points={{39,14.0496},{66,14.0496},{66,
          0},{110,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={
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
end Gen1;
