within IEEE14;
model FourteenBus_PhaseShiftingTransformerTest

  PowerSystems.Electrical.Buses.Bus B1 annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={-105,-41})));
  PowerSystems.Electrical.Buses.Bus B2 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-24,-88})));
  PowerSystems.Electrical.Buses.Bus B3 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={44,-90})));
  PowerSystems.Electrical.Buses.Bus B4 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={32,-32})));
  PowerSystems.Electrical.Buses.Bus B5 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-24,-40})));
  PowerSystems.Electrical.Buses.Bus B6 annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={-45,39})));
  PowerSystems.Electrical.Buses.Bus B7 annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=90,
        origin={41,19})));
  PowerSystems.Electrical.Buses.Bus bus8 annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=180,
        origin={85,-5})));
  PowerSystems.Electrical.Buses.Bus B9 annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={54,44})));
  PowerSystems.Electrical.Buses.Bus B10 annotation (Placement(
        transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={6,94})));
  PowerSystems.Electrical.Buses.Bus B11 annotation (Placement(
        transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-14,62})));
  PowerSystems.Electrical.Buses.Bus B12 annotation (Placement(
        transformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={-83,65})));
  PowerSystems.Electrical.Buses.Bus B13 annotation (Placement(
        transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-62,100})));
  PowerSystems.Electrical.Buses.Bus B14 annotation (Placement(
        transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={74,100})));
  PowerSystems.Electrical.Branches.PwLine L1(
    R=0.05695,
    X=0.17388,
    G=0,
    B=0.034/2) annotation (Placement(transformation(
        extent={{-5,-4},{5,4}},
        rotation=90,
        origin={-24,-65})));
  PowerSystems.Electrical.Branches.PwLine L7(
    G=0,
    R=0.05403,
    X=0.22304,
    B=0.0492/2) annotation (Placement(transformation(
        extent={{-5,-7},{5,7}},
        rotation=0,
        origin={-49,-57})));
  PowerSystems.Electrical.Branches.PwLine L3(
    G=0,
    R=0.01938,
    X=0.05917,
    B=0.0528/2) annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=270,
        origin={-79,-82})));
  PowerSystems.Electrical.Branches.PwLine L9(
    G=0,
    R=0.05811,
    X=0.17632,
    B=0.0374/2) annotation (Placement(transformation(
        extent={{-4,-6},{4,6}},
        rotation=90,
        origin={18,-58})));
  PowerSystems.Electrical.Branches.PwLine L6(
    G=0,
    R=0.06701,
    X=0.17103,
    B=0.0346/2) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={47,-57})));
  PowerSystems.Electrical.Branches.PwLine L8(
    G=0,
    R=0.01335,
    X=0.04211,
    B=0.0128/2) annotation (Placement(transformation(
        extent={{-4,-5},{4,5}},
        rotation=0,
        origin={8,-39})));
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
        origin={-8,75})));
  PowerSystems.Electrical.Branches.PwLine L15(
    G=0,
    B=0,
    R=0.03181,
    X=0.0845) annotation (Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=90,
        origin={27,74})));
  PowerSystems.Electrical.Branches.PwLine L16(
    G=0,
    B=0,
    R=0.12711,
    X=0.27038) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={54,74})));
  PowerSystems.Electrical.Branches.PwLine L17(
    G=0,
    B=0,
    R=0.17093,
    X=0.34802) annotation (Placement(transformation(
        extent={{-6,-8},{6,8}},
        rotation=180,
        origin={36,106})));
  PowerSystems.Electrical.Branches.PwLine L2(
    G=0,
    B=0,
    R=0,
    X=0.11001) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={40,32})));
  PowerSystems.Electrical.Branches.PwLine L5(
    G=0,
    R=0.04699,
    X=0.19797,
    B=0.0438/2) annotation (Placement(transformation(
        extent={{-4,-6},{4,6}},
        rotation=180,
        origin={10,-84})));
  PowerSystems.Electrical.Branches.PwLine L11(
    G=0,
    B=0,
    R=0.22092,
    X=0.19988) annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=90,
        origin={-85,78})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ2(P0=1.4*0.076, Q0=1.4*0.016)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-30,-28})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ3(P0=1.4*0.217, Q0=1.4*0.127)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-34,-74})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ12(P0=1.4*0.942, Q0=1.4*0.19)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={56,-76})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ9(P0=1.4*0.295, Q0=1.4*0.166)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={64,58})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ6(P0=1.4*0.149, Q0=1.4*0.05)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={76,116})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ8(P0=1.4*0.09, Q0=1.4*0.058)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={8,112})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ11(P0=1.4*0.135, Q0=1.4*
        0.058) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-60,114})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ7(Q0=1.4*0.016, P0=1.4*0.061)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-94,80})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ10(P0=1.4*0.035, Q0=1.4*
        0.018) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-22,78})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ4(P0=1.4*0.112, Q0=1.4*0.075)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-40,56})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ5(P0=1.4*0.478, Q0=1.4*0.04)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={8,-18})));
  PowerSystems.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer(
    Vbus=18000,
    Vn1=18000,
    fn=60,
    kT=18/13.8,
    X=0.17615,
    R=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={66,-4})));
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
        origin={-14,0})));
  PowerSystems.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer2(
    fn=60,
    R=0,
    Vbus=69000,
    Vn1=69000,
    kT=69/13.8,
    X=0.20912) annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={40,-5})));
  PowerSystems.Electrical.Events.PwFaultPQ pwFaultPQ(
    X=0.001,
    t1=10,
    R=1,
    t2=10.1)
    annotation (Placement(transformation(extent={{80,34},{100,54}})));
  PowerSystems.Electrical.Branches.PSAT.PhaseShiftingTransformer.PSTransformer
    pSTransformer(
    Vbus1=69000,
    Vbus2=13800,
    Vn1=69000,
    Vn2=13800,
    fn=60,
    Ki=0.1,
    p_ref=0.16,
    xT=0.55618,
    rT=0,
    pmes0=0.16,
    alpha0=0.048794787965328,
    vk0=1.006377943757236,
    vm0=1.017277479329263,
    anglevk0=-0.264529620776694,
    anglevm0=-0.395036023354245,
    m=0.939) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={14,10})));
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
    vref0=1.065584857949766,
    vf0=1.115146203936355)
    annotation (Placement(transformation(extent={{-132,14},{-112,34}})));
  Modelica.Blocks.Sources.Constant const(k=1.065584857949766)
    annotation (Placement(transformation(extent={{-156,34},{-148,42}})));
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
    p0=3.516084035557520,
    q0=-0.339445428748307)
    annotation (Placement(transformation(extent={{-128,-16},{-108,4}})));
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
    vref0=1.171112765129577,
    vf0=2.507877283012444)
    annotation (Placement(transformation(extent={{-70,-132},{-50,-112}})));
  Modelica.Blocks.Sources.Constant const1(k=1.171112765129577)
    annotation (Placement(transformation(extent={{-94,-120},{-86,-112}})));
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
    anglev0=-0.134899943949368,
    p0=0.399999999999996,
    q0=0.818672246055663) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-24,-116})));
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
    vref0=1.108094961681605,
    vf0=1.955083846166398) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={78,-118})));
  Modelica.Blocks.Sources.Constant const2(k=1.108094961681605)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=180,
        origin={118,-124})));
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
    anglev0=-0.329741291395117,
    p0=0.000000000000002,
    q0=0.545447243353281) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={48,-120})));
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
    vref0=1.289457239849752,
    vf0=4.269637539673118) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,-16})));
  Modelica.Blocks.Sources.Constant const4(k=1.289457239849752)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=0,
        origin={-68,-28})));
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
    anglev0=-0.381561827385500,
    p0=0.000000000000007,
    q0=0.684722111765389) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,12})));
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
    vref0=1.224363785415786,
    vf0=2.669573156315299) annotation (Placement(transformation(
        extent={{-11,-10},{11,10}},
        rotation=90,
        origin={137,-28})));
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
    p0=-0.000000000000000,
    anglev0=-0.350391432465976,
    q0=0.344346820312352) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={114,-10})));
  Modelica.Blocks.Sources.Constant const3(k=1.224363785415786)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=90,
        origin={118,-46})));
equation

  connect(L10.n, B12.p) annotation (Line(
      points={{-84,56.2},{-84,65},{-83,65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B12.p, L11.p) annotation (Line(
      points={{-83,65},{-83,73.8},{-85,73.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L10.p, B6.p) annotation (Line(
      points={{-84,47.8},{-84,44},{-45,44},{-45,39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B7.p, L2.p) annotation (Line(
      points={{41,19},{41,23.5},{40,23.5},{40,27.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L2.n, B9.p) annotation (Line(
      points={{40,36.2},{40,40},{54,40},{54,44}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(B12.p, lPQ7.p) annotation (Line(
      points={{-83,65},{-83,70},{-94,70},{-94,75.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, twoWindingTransformer1.n) annotation (Line(
      points={{-45,39},{-45,34},{-14,34},{-14,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L13.n, B11.p) annotation (Line(
      points={{-29,52.2},{-29,54},{-14,54},{-14,62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, L16.p) annotation (Line(
      points={{54,44},{54,69.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, L15.p) annotation (Line(
      points={{54,44},{54,52},{27,52},{27,69.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, lPQ9.p) annotation (Line(
      points={{54,44},{54,52},{64,52},{64,53.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(B3.p, lPQ12.p) annotation (Line(
      points={{44,-90},{44,-84},{56,-84},{56,-80.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B3.p, L6.p) annotation (Line(
      points={{44,-90},{44,-70},{47,-70},{47,-60.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B3.p, L5.p) annotation (Line(
      points={{44,-90},{44,-84},{12.8,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, L5.n) annotation (Line(
      points={{-24,-88},{-24,-96},{-2,-96},{-2,-84},{7.2,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, L3.n) annotation (Line(
      points={{-24,-88},{-24,-94},{-79,-94},{-79,-86.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, lPQ3.p) annotation (Line(
      points={{-24,-88},{-24,-78.4},{-34,-78.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, L1.p) annotation (Line(
      points={{-24,-88},{-24,-68.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1.p, L3.p) annotation (Line(
      points={{-105,-41},{-105,-74},{-79,-74},{-79,-77.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1.p, L7.p) annotation (Line(
      points={{-105,-41},{-105,-57},{-52.5,-57}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L7.n, B5.p) annotation (Line(
      points={{-45.5,-57},{-24,-57},{-24,-40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L1.n, B5.p) annotation (Line(
      points={{-24,-61.5},{-24,-40}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, L9.p) annotation (Line(
      points={{-24,-88},{-24,-76},{18,-76},{18,-60.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, L6.n) annotation (Line(
      points={{32,-32},{32,-42},{47,-42},{47,-53.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, L9.n) annotation (Line(
      points={{32,-32},{32,-42},{18,-42},{18,-55.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, L8.n) annotation (Line(
      points={{32,-32},{32,-42},{18,-42},{18,-39},{10.8,-39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, L8.p) annotation (Line(
      points={{-24,-40},{-24,-34},{2,-34},{2,-39},{5.2,-39}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, lPQ2.p) annotation (Line(
      points={{-24,-40},{-24,-32.4},{-30,-32.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.p, bus8.p) annotation (Line(
      points={{77,-4},{86,-4},{86,-6},{85,-5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B7.p, twoWindingTransformer.n) annotation (Line(
      points={{41,19},{41,8},{55,8},{55,-4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lPQ5.p, B4.p) annotation (Line(
      points={{8,-22.4},{8,-28},{32,-28},{32,-32}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, twoWindingTransformer2.p) annotation (Line(
      points={{32,-32},{32,-26},{40,-26},{40,-12.7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B7.p, twoWindingTransformer2.n) annotation (Line(
      points={{41,19},{41,2.7},{40,2.7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, twoWindingTransformer1.p) annotation (Line(
      points={{-24,-40},{-24,-24},{-14,-24},{-14,-11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, pwFaultPQ.p) annotation (Line(
      points={{54,44},{54,48},{74,48},{74,45},{83,45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B14.p, lPQ6.p) annotation (Line(
      points={{74,100},{74,105.5},{76,105.5},{76,111.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B14.p, L17.p) annotation (Line(
      points={{74,100},{74,106},{40.2,106}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L17.n, B13.p) annotation (Line(
      points={{31.8,106},{18,106},{18,102},{-40,102},{-40,92},{-62,92},{-62,100}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(lPQ8.p, B10.p) annotation (Line(
      points={{8,107.6},{8,94},{6,94}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lPQ11.p, B13.p) annotation (Line(
      points={{-60,109.6},{-62,109.6},{-62,100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L16.n, B14.p) annotation (Line(
      points={{54,78.2},{54,88},{74,88},{74,100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B10.p, L15.n) annotation (Line(
      points={{6,94},{6,84},{27,84},{27,78.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B10.p, L14.n) annotation (Line(
      points={{6,94},{6,82},{-8,82},{-8,78.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B11.p, L14.p) annotation (Line(
      points={{-14,62},{-14,68},{-8,68},{-8,71.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B11.p, lPQ10.p) annotation (Line(
      points={{-14,62},{-14,70},{-22,70},{-22,73.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B13.p, L12.n) annotation (Line(
      points={{-62,100},{-62,80},{-51,80},{-51,70.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B13.p, L11.n) annotation (Line(
      points={{-62,100},{-62,88},{-85,88},{-85,82.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, L13.p) annotation (Line(
      points={{-45,39},{-45,43.8},{-29,43.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, lPQ4.p) annotation (Line(
      points={{-45,39},{-45,51.6},{-40,51.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, L12.p) annotation (Line(
      points={{-45,39},{-45,50},{-51,50},{-51,61.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, pSTransformer.p) annotation (Line(
      points={{32,-32},{32,-12},{16,-12},{16,-1.2},{13.8,-1.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pSTransformer.pk, pSTransformer.u) annotation (Line(
      points={{18,21},{18,28},{2,28},{2,-8},{8.4,-8},{8.4,-2.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B9.p, pSTransformer.n) annotation (Line(
      points={{54,44},{54,40},{14,40},{14,21}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const.y,aVRTypeII. vref) annotation (Line(
      points={{-147.6,38},{-140,38},{-140,29.4},{-130,29.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.v,aVRTypeII. v) annotation (Line(
      points={{-107,-2.45974},{-104,-2.45974},{-104,12},{-136,12},{-136,23},
          {-130,23}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVRTypeII.vf,Gen1order4. vf) annotation (Line(
      points={{-113.5,26.6},{-112,26.6},{-112,8},{-138,8},{-138,-0.3148},{
          -130,-0.3148}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.pm0,Gen1order4. pm) annotation (Line(
      points={{-107,0.28385},{-98,0.28385},{-98,-20},{-140,-20},{-140,-10},
          {-130,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.p, B1.p) annotation (Line(
      points={{-107,-6.15036},{-94,-6.15036},{-94,-26},{-105,-26},{-105,-41}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(const1.y,aVR1TypeII1. vref) annotation (Line(
      points={{-85.6,-116},{-76,-116},{-76,-116.6},{-68,-116.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen3order4.pm0,Gen3order4. pm) annotation (Line(
      points={{-30.2839,-105},{-30.2839,-100},{-6,-100},{-6,-132},{-20,-132},{
          -20,-128}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen3order4.v,aVR1TypeII1. v) annotation (Line(
      points={{-27.5403,-105},{-27.5403,-102},{-44,-102},{-44,-132},{-80,-132},
          {-80,-122},{-68,-122},{-68,-123}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVR1TypeII1.vf,Gen3order4. vf) annotation (Line(
      points={{-51.5,-119.4},{-50,-119.4},{-50,-136},{-29.6852,-136},{
          -29.6852,-128}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B2.p, Gen3order4.p) annotation (Line(
      points={{-24,-88},{-24,-105},{-23.8496,-105}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y,aVR2TypeII2. vref) annotation (Line(
      points={{113.6,-124},{86,-124},{86,-123.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVR2TypeII2.vf,Gen2order4. vf) annotation (Line(
      points={{69.5,-120.6},{60,-120.6},{60,-136},{42.3148,-136},{42.3148,
          -132}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen2order4.v,aVR2TypeII2. v) annotation (Line(
      points={{44.4597,-109},{44.4597,-104},{100,-104},{100,-117},{86,-117}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen2order4.pm0,Gen2order4. pm) annotation (Line(
      points={{41.7161,-109},{41.7161,-106},{32,-106},{32,-138},{52,-138},{52,
          -132}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B3.p, Gen2order4.p) annotation (Line(
      points={{44,-90},{44,-100},{48.1504,-100},{48.1504,-109}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(aVR4TypeII1.vf,Gen5order4. vf) annotation (Line(
      points={{-54.6,-7.5},{-54.6,-4.75},{-53.6852,-4.75},{-53.6852,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen5order4.v,aVR4TypeII1. v) annotation (Line(
      points={{-51.5403,23},{-51.5403,26},{-36,26},{-36,-12},{-46,-12},{-46,-28},
          {-51,-28},{-51,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen5order4.pm0,Gen5order4. pm) annotation (Line(
      points={{-54.2839,23},{-54.2839,28},{-68,28},{-68,-8},{-44,-8},{-44,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, aVR4TypeII1.vref) annotation (Line(
      points={{-63.6,-28},{-57.4,-28},{-57.4,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B6.p, Gen5order4.p) annotation (Line(
      points={{-45,39},{-45,30},{-47.8496,30},{-47.8496,23}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen4order4.p, bus8.p) annotation (Line(
      points={{103,-9.84964},{95.5,-9.84964},{95.5,-5},{85,-5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen4order4.vf, aVR3TypeII2.vf) annotation (Line(
      points={{126,-15.6852},{132,-15.6852},{132,-18.65},{134.4,-18.65}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, aVR3TypeII2.vref) annotation (Line(
      points={{118,-41.6},{118,-40},{131.6,-40},{131.6,-36.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen4order4.v, aVR3TypeII2.v) annotation (Line(
      points={{103,-13.5403},{98,-13.5403},{98,-56},{138,-56},{138,-36.8}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Gen4order4.pm0, Gen4order4.pm) annotation (Line(
      points={{103,-16.2839},{98,-16.2839},{98,6},{132,6},{132,-6},{126,-6}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -140},{160,120}})),                Icon(coordinateSystem(extent={{-160,
            -140},{160,120}})),
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
end FourteenBus_PhaseShiftingTransformerTest;
