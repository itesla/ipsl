within IEEE14;
model FourteenBus_ThreeWindingTransformerTest

  PowerSystems.Electrical.Buses.Bus B1 annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={-77,-35})));
  PowerSystems.Electrical.Buses.Bus B2 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-26,-56})));
  PowerSystems.Electrical.Buses.Bus B3 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={42,-64})));
  PowerSystems.Electrical.Buses.Bus B4 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={30,-6})));
  PowerSystems.Electrical.Buses.Bus B5 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-22,-18})));
  PowerSystems.Electrical.Buses.Bus B6 annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={-45,39})));
  PowerSystems.Electrical.Buses.Bus B8 annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=180,
        origin={69,-11})));
  PowerSystems.Electrical.Buses.Bus B9 annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={53,45})));
  PowerSystems.Electrical.Buses.Bus B10 annotation (Placement(
        transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={6,82})));
  PowerSystems.Electrical.Buses.Bus B11 annotation (Placement(
        transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={-19,59})));
  PowerSystems.Electrical.Buses.Bus B12 annotation (Placement(
        transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-84,66})));
  PowerSystems.Electrical.Buses.Bus B13 annotation (Placement(
        transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={-59,93})));
  PowerSystems.Electrical.Buses.Bus B14 annotation (Placement(
        transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={73,83})));
  PowerSystems.Electrical.Branches.PwLine L1(
    R=0.05695,
    X=0.17388,
    G=0,
    B=0.034/2) annotation (Placement(transformation(
        extent={{-5,-4},{5,4}},
        rotation=90,
        origin={-8,-41})));
  PowerSystems.Electrical.Branches.PwLine L7(
    G=0,
    R=0.05403,
    X=0.22304,
    B=0.0492/2) annotation (Placement(transformation(
        extent={{-5,-7},{5,7}},
        rotation=0,
        origin={-47,-37})));
  PowerSystems.Electrical.Branches.PwLine L3(
    G=0,
    R=0.01938,
    X=0.05917,
    B=0.0528/2) annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=270,
        origin={-71,-60})));
  PowerSystems.Electrical.Branches.PwLine L9(
    G=0,
    R=0.05811,
    X=0.17632,
    B=0.0374/2) annotation (Placement(transformation(
        extent={{-4,-6},{4,6}},
        rotation=90,
        origin={18,-34})));
  PowerSystems.Electrical.Branches.PwLine L6(
    G=0,
    R=0.06701,
    X=0.17103,
    B=0.0346/2) annotation (Placement(transformation(
        extent={{-5,-4},{5,4}},
        rotation=90,
        origin={40,-35})));
  PowerSystems.Electrical.Branches.PwLine L8(
    G=0,
    R=0.01335,
    X=0.04211,
    B=0.0128/2) annotation (Placement(transformation(
        extent={{-4,-5},{4,5}},
        rotation=0,
        origin={-8,-11})));
  PowerSystems.Electrical.Branches.PwLine L13(
    G=0,
    R=0.09498,
    X=0.1989,
    B=0) annotation (Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=90,
        origin={-29,48})));
  PowerSystems.Electrical.Branches.PwLine L10(
    G=0,
    R=0.12291,
    X=0.25581,
    B=0) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-84,52})));
  PowerSystems.Electrical.Branches.PwLine L12(
    G=0,
    R=0.06615,
    X=0.13027,
    B=0) annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=90,
        origin={-51,66})));
  PowerSystems.Electrical.Branches.PwLine L14(
    G=0,
    B=0,
    R=0.08205,
    X=0.19207) annotation (Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-10,69})));
  PowerSystems.Electrical.Branches.PwLine L15(
    G=0,
    B=0,
    R=0.03181,
    X=0.0845) annotation (Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=90,
        origin={27,60})));
  PowerSystems.Electrical.Branches.PwLine L16(
    G=0,
    B=0,
    R=0.12711,
    X=0.27038) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={54,60})));
  PowerSystems.Electrical.Branches.PwLine L17(
    G=0,
    B=0,
    R=0.17093,
    X=0.34802) annotation (Placement(transformation(
        extent={{-6,-8},{6,8}},
        rotation=180,
        origin={32,92})));
  PowerSystems.Electrical.Branches.PwLine L5(
    G=0,
    R=0.04699,
    X=0.19797,
    B=0.0438/2) annotation (Placement(transformation(
        extent={{-4,-6},{4,6}},
        rotation=180,
        origin={16,-58})));
  PowerSystems.Electrical.Branches.PwLine L11(
    G=0,
    B=0,
    R=0.22092,
    X=0.19988) annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=90,
        origin={-85,78})));
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    Ka=200,
    Ta=0.02,
    Kf=0.002,
    Tf=1,
    Ke=1,
    Te=0.2,
    Tr=0.001,
    v0=1.06,
    vrmin=0,
    vrmax=7.32,
    vref0=1.065579155361255,
    vf0=1.114009411770768)
    annotation (Placement(transformation(extent={{-108,10},{-88,30}})));
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR1TypeII1(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=1.98,
    v0=1.045,
    vrmin=0,
    vrmax=4.38,
    vref0=1.168637078262403,
    vf0=2.459246139992589)
    annotation (Placement(transformation(extent={{-68,-92},{-48,-72}})));
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR2TypeII2(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=1.98,
    v0=1.01,
    vrmin=0,
    vrmax=4.38,
    vref0=1.106442355708305,
    vf0=1.922340467398857) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={72,-82})));
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR3TypeII2(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=0.7,
    v0=1.09,
    vrmin=1.395,
    vrmax=6.81,
    vref0=1.229905724829352,
    vf0=2.777809527705029) annotation (Placement(transformation(
        extent={{-11,-10},{11,10}},
        rotation=180,
        origin={143,-18})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ2(P0=1.4*0.076, Q0=1.4*0.016)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-26,-4})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ3(P0=1.4*0.217, Q0=1.4*0.127)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-38,-44})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ12(P0=1.4*0.942, Q0=1.4*0.19)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={52,-52})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ9(P0=1.4*0.295, Q0=1.4*0.166)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={64,58})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ6(P0=1.4*0.149, Q0=1.4*0.05)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={72,108})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ8(P0=1.4*0.09, Q0=1.4*0.058)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={6,108})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ11(P0=1.4*0.135, Q0=1.4*
        0.058) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-60,108})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ7(Q0=1.4*0.016, P0=1.4*0.061)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-94,80})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ10(P0=1.4*0.035, Q0=1.4*
        0.018) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-30,74})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ4(P0=1.4*0.112, Q0=1.4*0.075)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-44,52})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ5(P0=1.4*0.478, Q0=1.4*0.04)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={8,12})));
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVR4TypeII1(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=0.7,
    v0=1.07,
    vrmin=1.395,
    vrmax=6.81,
    vref0=1.298396572740180,
    vf0=4.425420591384435) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-46,-12})));
  Modelica.Blocks.Sources.Constant const(k=1.065579155361255)
    annotation (Placement(transformation(extent={{-132,30},{-124,38}})));
  Modelica.Blocks.Sources.Constant const1(k=1.168637078262403)
    annotation (Placement(transformation(extent={{-90,-80},{-82,-72}})));
  Modelica.Blocks.Sources.Constant const2(k=1.106442355708305)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=180,
        origin={112,-86})));
  Modelica.Blocks.Sources.Constant const4(k=1.298396572740180)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-64,-22})));
  PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs
    Gen1order4(
    Sn=615,
    Vn=69000,
    Vbus=69000,
    fn=60,
    ra0=0,
    xd0=0.8979,
    xq0=0.646,
    x1d0=0.2998,
    x1q0=0.646,
    T1d0=7.4,
    D0=2,
    v0=1.06,
    anglev0=0,
    T1q0=0.001,
    M0=2*5.148,
    p0=3.517526707706282,
    q0=-0.349068101101671)
    annotation (Placement(transformation(extent={{-104,-20},{-84,0}})));
  PowerSystems.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer1(
    fn=60,
    R=0,
    Vbus=69000,
    Vn1=69000,
    kT=69/13.8,
    X=0.25202) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,20})));
  PowerSystems.Electrical.Events.PwFaultPQ pwFaultPQ(
    X=0.001,
    t1=10,
    R=1,
    t2=10.1)
    annotation (Placement(transformation(extent={{80,34},{100,54}})));
  PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs
    Gen3order4(
    Vn=69000,
    Vbus=69000,
    fn=60,
    D0=2,
    Sn=60,
    ra0=0.0031,
    xd0=1.05,
    xq0=0.98,
    x1d0=0.1850,
    x1q0=0.36,
    T1d0=6.1,
    T1q0=0.3,
    M0=2*6.54,
    v0=1.045,
    anglev0=-0.134902961161071,
    p0=0.399999999999998,
    q0=0.788506773216030) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-26,-80})));
  PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs
    Gen2order4(
    Vn=69000,
    Vbus=69000,
    fn=60,
    D0=2,
    Sn=60,
    ra0=0.0031,
    xd0=1.05,
    xq0=0.98,
    x1d0=0.1850,
    x1q0=0.36,
    T1d0=6.1,
    T1q0=0.3,
    M0=2*6.54,
    v0=1.01,
    p0=0.000000000000002,
    anglev0=-0.329501880978530,
    q0=0.526549696073380) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={42,-84})));
  PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs
    Gen4order4(
    fn=60,
    D0=2,
    Sn=25,
    Vn=18000,
    Vbus=18000,
    ra0=0.0014,
    xd0=1.25,
    xq0=1.22,
    x1d0=0.232,
    x1q0=0.715,
    T1d0=4.75,
    T1q0=1.5,
    M0=2*5.06,
    v0=1.09,
    anglev0=-0.342851611995744,
    q0=0.367942336851466,
    p0=-0.000000000000000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={96,-12})));
  PowerSystems.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs
    Gen5order4(
    fn=60,
    D0=2,
    Sn=25,
    ra0=0.0014,
    xd0=1.25,
    xq0=1.22,
    x1d0=0.232,
    x1q0=0.715,
    T1d0=4.75,
    T1q0=1.5,
    M0=2*5.06,
    Vn=13800,
    Vbus=13800,
    v0=1.07,
    anglev0=-0.378890333603724,
    p0=0.000000000000005,
    q0=0.718059665198611) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-44,18})));
  Modelica.Blocks.Sources.Constant const3(k=1.229905724829352)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=180,
        origin={152,-40})));
  PowerSystems.Electrical.Branches.PSAT.ThreeWindingTransformer.ThreeWindingTransformer
    threeWindingTransformer(
    Vbus=69000,
    Vn1=69000,
    Vn2=13800,
    Vn3=18000,
    fn=60,
    R12=0,
    R13=0,
    R23=0,
    X12=0.20912 + 0.11001,
    X13=0.20912 + 0.17615,
    X23=0.11001 + 0.17615,
    m=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,18})));
  PowerSystems.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer2(
    fn=60,
    R=0,
    Vbus=69000,
    Vn1=69000,
    kT=69/13.8,
    X=0.55618) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={26,24})));
equation

  connect(L16.n, B14.p) annotation (Line(
      points={{54,64.2},{54,72},{73,72},{73,83}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L15.n, B10.p) annotation (Line(
      points={{27,64.2},{27,74},{6,74},{6,82}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B11.p, L14.p) annotation (Line(
      points={{-19,59},{-19,65.5},{-10,65.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L14.n, B10.p) annotation (Line(
      points={{-10,72.5},{-10,80},{6,80},{6,82}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B14.p, L17.p) annotation (Line(
      points={{73,83},{73,92},{36.2,92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L17.n, B13.p) annotation (Line(
      points={{27.8,92},{-14,92},{-14,86},{-59,86},{-59,93}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L10.n, B12.p) annotation (Line(
      points={{-84,56.2},{-84,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B12.p, L11.p) annotation (Line(
      points={{-84,66},{-84,73.8},{-85,73.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L11.n, B13.p) annotation (Line(
      points={{-85,82.2},{-85,90},{-60,90},{-59,93}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L10.p, B6.p) annotation (Line(
      points={{-84,47.8},{-84,44},{-45,44},{-45,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L12.p, B6.p) annotation (Line(
      points={{-51,61.8},{-51,44},{-45,44},{-45,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L12.n, B13.p) annotation (Line(
      points={{-51,70.2},{-51,76},{-60,76},{-60,92},{-59,93}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L13.p, B6.p) annotation (Line(
      points={{-29,43.8},{-29,42},{-45,42},{-45,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, L8.p) annotation (Line(
      points={{-22,-18},{-22,-11},{-10.8,-11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L8.n, B4.p) annotation (Line(
      points={{-5.2,-11},{30,-11},{30,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1.p, L7.p) annotation (Line(
      points={{-77,-35},{-77,-37},{-50.5,-37}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L7.n, B5.p) annotation (Line(
      points={{-43.5,-37},{-22,-37},{-22,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L3.n, B2.p) annotation (Line(
      points={{-71,-64.2},{-71,-64},{-26,-64},{-26,-56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, L1.p) annotation (Line(
      points={{-26,-56},{-26,-44.5},{-8,-44.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L1.n, B5.p) annotation (Line(
      points={{-8,-37.5},{-8,-24},{-22,-24},{-22,-18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L9.p, L1.p) annotation (Line(
      points={{18,-36.8},{18,-50},{-26,-50},{-26,-44.5},{-8,-44.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L9.n, B4.p) annotation (Line(
      points={{18,-31.2},{18,-18},{30,-18},{30,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B3.p, L6.p) annotation (Line(
      points={{42,-64},{42,-38.5},{40,-38.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L6.n, B4.p) annotation (Line(
      points={{40,-31.5},{40,-16},{30,-16},{30,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L5.p, L6.p) annotation (Line(
      points={{18.8,-58},{24,-58},{24,-56},{42,-56},{42,-38.5},{40,-38.5}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(L5.n, B2.p) annotation (Line(
      points={{13.2,-58},{2,-58},{2,-62},{-26,-62},{-26,-56}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(B2.p, lPQ3.p) annotation (Line(
      points={{-26,-56},{-26,-52},{-38,-52},{-38,-48.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B3.p, lPQ12.p) annotation (Line(
      points={{42,-64},{42,-60},{52,-60},{52,-56.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B14.p, lPQ6.p) annotation (Line(
      points={{73,83},{72,83},{72,103.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lPQ8.p, B10.p) annotation (Line(
      points={{6,103.6},{6,82}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B13.p, lPQ11.p) annotation (Line(
      points={{-59,93},{-59,103.6},{-60,103.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B12.p, lPQ7.p) annotation (Line(
      points={{-84,66},{-84,70},{-94,70},{-94,75.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lPQ4.p, B6.p) annotation (Line(
      points={{-44,47.6},{-46,47.6},{-46,44},{-45,44},{-45,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lPQ10.p, B11.p) annotation (Line(
      points={{-30,69.6},{-30,64},{-19,64},{-19,59}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y, aVRTypeII.vref) annotation (Line(
      points={{-123.6,34},{-116,34},{-116,25.4},{-106,25.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, aVR2TypeII2.vref) annotation (Line(
      points={{107.6,-86},{80,-86},{80,-87.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.p, B1.p) annotation (Line(
      points={{-83,-10.1504},{-77,-10.1504},{-77,-35}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen1order4.v, aVRTypeII.v) annotation (Line(
      points={{-83,-6.45974},{-80,-6.45974},{-80,8},{-112,8},{-112,19},{
          -106,19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVRTypeII.vf,Gen1order4. vf) annotation (Line(
      points={{-89.5,22.6},{-88,22.6},{-88,4},{-114,4},{-114,-4.3148},{-106,
          -4.3148}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.pm0,Gen1order4. pm) annotation (Line(
      points={{-83,-3.71615},{-74,-3.71615},{-74,-24},{-116,-24},{-116,-14},
          {-106,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B4.p, lPQ5.p) annotation (Line(
      points={{30,-6},{30,4},{8,4},{8,7.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L13.n, B11.p) annotation (Line(
      points={{-29,52.2},{-29,54},{-19,54},{-19,59}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1.p, L3.p) annotation (Line(
      points={{-77,-35},{-77,-48},{-71,-48},{-71,-55.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, L16.p) annotation (Line(
      points={{53,45},{53,52},{54,52},{54,55.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, L15.p) annotation (Line(
      points={{53,45},{53,52},{27,52},{27,55.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, lPQ9.p) annotation (Line(
      points={{53,45},{53,52},{64,52},{64,53.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const1.y, aVR1TypeII1.vref) annotation (Line(
      points={{-81.6,-76},{-72,-76},{-72,-76.6},{-66,-76.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen3order4.pm0, Gen3order4.pm) annotation (Line(
      points={{-32.2839,-69},{-32.2839,-66},{-12,-66},{-12,-98},{-22,-98},{-22,
          -92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen3order4.v, aVR1TypeII1.v) annotation (Line(
      points={{-29.5403,-69},{-29.5403,-62},{-40,-62},{-40,-92},{-76,-92},{-76,
          -82},{-66,-82},{-66,-83}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVR1TypeII1.vf, Gen3order4.vf) annotation (Line(
      points={{-49.5,-79.4},{-46,-79.4},{-46,-96},{-31.6852,-96},{-31.6852,
          -92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen2order4.p, B3.p) annotation (Line(
      points={{42.1504,-73},{42.1504,-68.5},{42,-68.5},{42,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aVR2TypeII2.vf, Gen2order4.vf) annotation (Line(
      points={{63.5,-84.6},{54,-84.6},{54,-100},{36.3148,-100},{36.3148,-96}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Gen2order4.v, aVR2TypeII2.v) annotation (Line(
      points={{38.4597,-73},{38.4597,-68},{94,-68},{94,-81},{80,-81}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen2order4.pm0, Gen2order4.pm) annotation (Line(
      points={{35.7161,-73},{35.7161,-70},{26,-70},{26,-102},{46,-102},{46,-96}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVR3TypeII2.vf, Gen4order4.vf) annotation (Line(
      points={{133.65,-20.6},{112.75,-20.6},{112.75,-17.6852},{108,-17.6852}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(B6.p, Gen5order4.p) annotation (Line(
      points={{-45,39},{-45,34.5},{-43.8496,34.5},{-43.8496,29}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aVR4TypeII1.vf, Gen5order4.vf) annotation (Line(
      points={{-48.6,-3.5},{-48.6,1.25},{-49.6852,1.25},{-49.6852,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, aVR4TypeII1.vref) annotation (Line(
      points={{-59.6,-22},{-51.4,-22},{-51.4,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen5order4.v, aVR4TypeII1.v) annotation (Line(
      points={{-47.5403,29},{-47.5403,32},{-32,32},{-32,-6},{-42,-6},{-42,-22},
          {-45,-22},{-45,-20}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Gen4order4.pm0, Gen4order4.pm) annotation (Line(
      points={{85,-18.2839},{82,-18.2839},{82,-34},{122,-34},{122,-8},{108,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen4order4.v, aVR3TypeII2.v) annotation (Line(
      points={{85,-15.5403},{82,-15.5403},{82,4},{158,4},{158,-17},{151.8,-17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, aVR3TypeII2.vref) annotation (Line(
      points={{147.6,-40},{146,-40},{146,-28},{154,-28},{154,-23.4},{151.8,
          -23.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen3order4.p, B2.p) annotation (Line(
      points={{-25.8496,-69},{-26,-64},{-26,-56}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(B9.p, pwFaultPQ.p) annotation (Line(
      points={{53,45},{53,48},{80,48},{80,45},{83,45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen5order4.pm0, Gen5order4.pm) annotation (Line(
      points={{-50.2839,29},{-50.2839,34},{-64,34},{-64,0},{-40,0},{-40,6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(B6.p, twoWindingTransformer1.n) annotation (Line(
      points={{-45,39},{-45,36},{-14,36},{-14,31}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, threeWindingTransformer.b1) annotation (Line(
      points={{30,-6},{30,-2},{52,-2},{52,7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B8.p, threeWindingTransformer.b3) annotation (Line(
      points={{69,-11},{62,-11},{62,29},{55,29}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, threeWindingTransformer.b2) annotation (Line(
      points={{53,45},{53,29},{49,29}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, twoWindingTransformer1.p) annotation (Line(
      points={{-22,-18},{-22,-6},{-14,-6},{-14,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, lPQ2.p) annotation (Line(
      points={{-22,-18},{-22,-12},{-26,-12},{-26,-8.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen4order4.p, B8.p) annotation (Line(
      points={{85,-11.8496},{77.5,-11.8496},{77.5,-11},{69,-11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, twoWindingTransformer2.p) annotation (Line(
      points={{30,-6},{28,-6},{28,13},{26,13}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, twoWindingTransformer2.n) annotation (Line(
      points={{53,45},{53,38},{26,38},{26,35}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -120},{160,120}})),                Icon(coordinateSystem(extent={{-140,
            -120},{160,120}})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end FourteenBus_ThreeWindingTransformerTest;
