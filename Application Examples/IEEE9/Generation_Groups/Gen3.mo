within IEEE9.Generation_Groups;
model Gen3
  parameter Real ra3(min=0.00,max=0.02) "Armature resistance (pu) ";
  parameter Real xd3(min=0.6,max=2.3) "d-axis reactance (pu)";
  parameter Real xq3(min=0.4,max=2.3) "q-axis reactance (pu) ";
  parameter Real x1d3(min=0.15,max=0.5) "d-axis transient reactance (pu)";
  parameter Real x1q3(min=0.15,max=1.0) "q-axis transient reactance (pu)";
  parameter Real T1d3(min=1.5,max=9.0) "d-axis transient time constant (s)";
  parameter Real T1q3(min=1.5,max=10) "q-axis transient time constant (s) ";
  parameter Real M3 "Machanical starting time (2H) (kWs/kVA)";
  parameter Real D3;
    parameter Real S_b "(MVA)";
  parameter Real f_b "(Hz)";
   parameter Real Ka_3;
   parameter Real Ta_3;
   parameter Real Kf_3;
   parameter Real Tf_3;
   parameter Real Ke_3;
   parameter Real Te_3;
   parameter Real Tr_3;
   parameter Real Ae_3;
   parameter Real Be_3;
      parameter Real height_3;
   parameter Real tstart_3;
   parameter Boolean refdisturb_3;
  PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs gen(
    Sn=100,
    ra=0,
    xd=0.1460,
    xq=0.0969,
    xd1=0.0608,
    xq1=0.0969,
    Td10=8.96,
    Tq10=0.310,
    fn=60,
    Vn=16500,
    V_b=16500,
    V_0=1.040000000000000,
    P_0=0.715870954698345,
    Q_0=0.248141030193284,
    M=47.28,
    S_b=S_b)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={28,14})));
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(
    vrmin=-5,
    vrmax=5,
    v0=1.04,
    vf0=1.079018784709528,
    vref0=1.095077501312303,
    Ka=Ka_3,
    Ta=Ta_3,
    Kf=Kf_3,
    Tf=Tf_3,
    Ke=Ke_3,
    Te=Te_3,
    Tr=Tr_3,
    Ae=Ae_3,
    Be=Be_3)                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-6,10})));
  Modelica.Blocks.Sources.Constant vref2(k=1.095077501312303)
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-71,25})));
  Modelica.Blocks.Sources.Step step(                 startTime=tstart_3,
    height=height_3,
    offset=1.095077501312303)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-56,-2})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-50,12},{-40,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=refdisturb_3)
    annotation (Placement(transformation(extent={{-80,2},{-70,12}})));
  PowerSystems.Connectors.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Real P_MW;
  Real Q_MVA;
equation
  P_MW = gen.P*S_b;
  Q_MVA = gen.Q*S_b;
  connect(AVR.vf,gen. vf) annotation (Line(
      points={{2.5,12.6},{10,12.6},{10,19.6852},{16,19.6852}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gen.pm0,gen. pm) annotation (Line(
      points={{39,20.2839},{46,20.2839},{46,30},{12,30},{12,10},{16,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gen.v,AVR.v) annotation (Line(
      points={{39,17.5403},{48,17.5403},{48,-14},{-22,-14},{-22,9},{-14,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y,AVR.vref) annotation (Line(points={{-39.5,17},{-26.75,17},
          {-26.75,15.4},{-14,15.4}},       color={0,0,127}));
  connect(booleanConstant.y,switch1. u2) annotation (Line(points={{-69.5,7},{-66,
          7},{-66,17},{-51,17}},         color={255,0,255}));
  connect(vref2.y,switch1. u3) annotation (Line(points={{-65.5,25},{-60,25},{-60,
          13},{-51,13}},  color={0,0,127}));
  connect(step.y,switch1. u1) annotation (Line(points={{-56,2.4},{-56,21},{-51,21}},
                color={0,0,127}));
  connect(gen.p, pwPin) annotation (Line(points={{39,13.8496},{66,13.8496},{66,
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
end Gen3;
