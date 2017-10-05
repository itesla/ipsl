within OpenIPSL.Examples.Controls.PSAT.AVR;
model AVRTypeII_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6Type2_Inputs_Outputs(
    V_0=1,
    angle_0=0,
    V_b=200,
    Sn=370,
    Vn=200,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    P_0=16.0352698692006,
    Q_0=11.859436505981)
    annotation (Placement(transformation(extent={{-58,-32},{6,32}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII exciter_Type_II(
    vrmin=-5,
    vrmax=5,
    Ta=0.1,
    Te=1,
    Tr=0.001,
    Ae=0.0006,
    Be=0.9,
    Kf=0.45,
    Tf=1,
    Ka=400,
    Ke=0.01) annotation (Placement(transformation(extent={{-20,54},{-82,106}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{100,80},{124,100}})));
  Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={70,-18},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLinewithOpening1(
    G=0,
    R=0.01,
    X=0.1,
    opening=1,
    B=0.0005,
    t1=2,
    t2=2.15) annotation (Placement(visible=true, transformation(
        origin={110,6},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={70,6},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine3(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={112,-20},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine4(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={110,30},
        extent={{-5.99999,-5.99998},{5.99999,6}},
        rotation=0)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=8,
    Q_0=6,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={144,18},
        extent={{-6,-6},{6,6}},
        rotation=90)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=8,
    Q_0=6,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={144.034,-20.2889},
        extent={{-6.2889,-6.0335},{6.2889,6.0335}},
        rotation=90)));
  Electrical.Buses.Bus bus
    annotation (Placement(transformation(extent={{40,-16},{60,4}})));
  Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{80,-16},{100,4}})));
  Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{120,8},{140,28}})));
  Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{120,-30},{140,-10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{12,90},{2,100}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=20,
    startTime=1,
    height=-0.1) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=0,
        origin={47,75})));
equation

  connect(order6Type2_Inputs_Outputs.v, exciter_Type_II.v) annotation (Line(
      points={{9.2,9.6},{24,9.6},{24,64.4},{-13.8,64.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order6Type2_Inputs_Outputs.pm0, order6Type2_Inputs_Outputs.pm)
    annotation (Line(points={{-51.6,-35.2},{-51.6,-42},{-51.6,-60},{-80,-60},{-80,
          -16},{-64.4,-16}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.vf, exciter_Type_II.vf) annotation (Line(
        points={{-64.4,16},{-96,16},{-96,80},{-88.2,80}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.vf0, exciter_Type_II.vf0) annotation (Line(
        points={{-51.6,35.2},{-51.6,48.8},{-51,48.8}}, color={0,0,127}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(points={{64.6,6},{56,6},{56,-18},
          {64.6,-18}}, color={0,0,255}));
  connect(pwLine2.n, pwLine1.n) annotation (Line(points={{75.4,6},{84,6},{84,-18},
          {75.4,-18}}, color={0,0,255}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(points={{104.6,30},
          {98,30},{98,6},{104.6,6}}, color={0,0,255}));
  connect(pwLine4.n, pwLinewithOpening1.n) annotation (Line(points={{115.4,30},
          {122,30},{122,6},{115.4,6}}, color={0,0,255}));
  connect(bus.p, pwLine1.p) annotation (Line(points={{50,-6},{56,-6},{56,-18},{
          64.6,-18}}, color={0,0,255}));
  connect(bus1.p, pwLine1.n) annotation (Line(points={{90,-6},{84,-6},{84,-18},
          {75.4,-18}},color={0,0,255}));
  connect(bus1.p, pwLinewithOpening1.p) annotation (Line(points={{90,-6},{94,-6},
          {94,14},{98,14},{98,6},{104.6,6}}, color={0,0,255}));
  connect(pwLine3.p, pwLinewithOpening1.p) annotation (Line(points={{106.6,-20},
          {94,-20},{94,14},{98,14},{98,6},{104.6,6}}, color={0,0,255}));
  connect(bus2.p, pwLoadPQ1.p)
    annotation (Line(points={{130,18},{138,18}}, color={0,0,255}));
  connect(bus2.p, pwLinewithOpening1.n) annotation (Line(points={{130,18},{122,
          18},{122,6},{115.4,6}}, color={0,0,255}));
  connect(bus3.p, pwLoadPQ2.p) annotation (Line(points={{130,-20},{138,-20},{
          138,-20.2889}}, color={0,0,255}));
  connect(pwLine3.n, bus3.p) annotation (Line(points={{117.4,-20},{117.4,-20},{
          130,-20}}, color={0,0,255}));
  connect(bus.p, order6Type2_Inputs_Outputs.p)
    annotation (Line(points={{50,-6},{30,-6},{30,0},{6,0}}, color={0,0,255}));
  connect(exciter_Type_II.vref, add.y) annotation (Line(points={{-13.8,95.6},{-5.9,
          95.6},{-5.9,95},{1.5,95}}, color={0,0,127}));
  connect(ramp.y, add.u2) annotation (Line(points={{41.5,75},{27.75,75},{27.75,
          92},{13,92}}, color={0,0,127}));
  connect(add.u1, exciter_Type_II.vref0) annotation (Line(points={{13,98},{14,
          98},{14,111.2},{-51,111.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{140,120}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-100,-100},{140,120}})),
    Documentation);
end AVRTypeII_Test;
