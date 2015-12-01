within IEEE14;
model FourteenBus_ULTCTest

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
  PowerSystems.Electrical.Buses.Bus bus7 annotation (Placement(
        transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={39,21})));
  PowerSystems.Electrical.Buses.Bus B8 annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=180,
        origin={85,-5})));
  PowerSystems.Electrical.Buses.Bus B9 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={52,48})));
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
        origin={6,-45})));
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
  PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    Ka=200,
    Ta=0.02,
    Kf=0.002,
    Tf=1,
    Ke=1,
    Te=0.2,
    Tr=0.001,
    v0=1.06,
    vref0=1.065581557102740,
    vf0=1.114488191689321,
    vrmin=0,
    vrmax=7.32)
    annotation (Placement(transformation(extent={{-136,-4},{-116,16}})));
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
    vref0=1.169862895388970,
    vf0=2.483331679816906)
    annotation (Placement(transformation(extent={{-60,-136},{-40,-116}})));
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
    vref0=1.107290764966904,
    vf0=1.939151688540628) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=180,
        origin={69,-121})));
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
    vref0=1.226397254198462,
    vf0=2.709324533939606) annotation (Placement(transformation(
        extent={{-11,-10},{11,10}},
        rotation=180,
        origin={137,-4})));
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
        origin={78,112})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ8(P0=1.4*0.09, Q0=1.4*0.058)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={8,112})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lPQ11(P0=1.4*0.135, Q0=1.4*
        0.058) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-66,112})));
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
    vref0=1.293832503953762,
    vf0=4.346306187558295) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-10})));
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
  PowerSystems.Electrical.Branches.PSAT.ULTC_VoltageControl uLTC(
    Vbus1=69000,
    Vbus2=13800,
    Vn=69000,
    fn=60,
    kT=5,
    H=0,
    K=0.10,
    m_max=1.20,
    m_min=0.8,
    v_ref=1.0129,
    xT=0.55618,
    rT=0,
    vm0=1.012900000000000,
    m0=0.966553549792991) annotation (Placement(transformation(
        extent={{-15,-13},{15,13}},
        rotation=90,
        origin={19,1})));
  Modelica.Blocks.Sources.Constant const(k=1.065581557102740)
    annotation (Placement(transformation(extent={{-156,6},{-148,14}})));
  Modelica.Blocks.Sources.Constant const1(k=1.169862895388970)
    annotation (Placement(transformation(extent={{-86,-126},{-78,-118}})));
  Modelica.Blocks.Sources.Constant const2(k=1.107290764966904)
    annotation (Placement(transformation(extent={{-3,-3},{3,3}},
        rotation=180,
        origin={97,-125})));
  Modelica.Blocks.Sources.Constant const4(k=1.293832503953762)
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
    p0=3.516758762329572,
    q0=-0.344944205707823,
    v0=1.06,
    anglev0=0,
    T1q0=0.001,
    M0=2*5.148)
    annotation (Placement(transformation(extent={{-126,-24},{-110,-8}})));
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
    anglev0=-0.134941583604541,
    p0=0.400000000000249,
    q0=0.803452646429737) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={-25,-109})));
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
    anglev0=-0.329785862395655,
    p0=0.000000000000507,
    q0=0.536252141617606) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={45,-111})));
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
    anglev0=-0.342317803503561,
    p0=-0.000000000000000,
    q0=0.353012616093597) annotation (Placement(transformation(
        extent={{-9,-8},{9,8}},
        rotation=180,
        origin={109,-4})));
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
    anglev0=-0.377129187246226,
    p0=0.000000000000080,
    q0=0.701129192761760) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-46,18})));
  Modelica.Blocks.Sources.Constant const3(k=1.226397254198462)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=180,
        origin={146,-26})));
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
  connect(bus7.p, L2.p) annotation (Line(
      points={{39,21},{39,23.5},{40,23.5},{40,27.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L2.n, B9.p) annotation (Line(
      points={{40,36.2},{40,40},{52,40},{52,48}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(B12.p, lPQ7.p) annotation (Line(
      points={{-83,65},{-83,70},{-94,70},{-94,75.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(uLTC.n, B9.p) annotation (Line(
      points={{19,17.5},{19,40},{52,40},{52,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(const2.y, aVR2TypeII2.vref) annotation (Line(
      points={{93.7,-125},{76.2,-125},{76.2,-125.86}},
      color={0,0,127},
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
      points={{52,48},{52,56},{54,56},{54,69.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, L15.p) annotation (Line(
      points={{52,48},{52,52},{27,52},{27,69.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, lPQ9.p) annotation (Line(
      points={{52,48},{52,52},{64,52},{64,53.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(aVR4TypeII1.vf, Gen5order4.vf) annotation (Line(
      points={{-50.6,-1.5},{-50.6,1.25},{-51.6852,1.25},{-51.6852,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const4.y, aVR4TypeII1.vref) annotation (Line(
      points={{-59.6,-22},{-53.4,-22},{-53.4,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen5order4.v, aVR4TypeII1.v) annotation (Line(
      points={{-49.5403,29},{-49.5403,32},{-32,32},{-32,-6},{-42,-6},{-42,-22},
          {-47,-22},{-47,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen5order4.pm0, Gen5order4.pm) annotation (Line(
      points={{-52.2839,29},{-52.2839,34},{-64,34},{-64,-2},{-42,-2},{-42,6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Gen2order4.vf, aVR2TypeII2.vf) annotation (Line(
      points={{41.0204,-119.4},{41.0204,-123.34},{61.35,-123.34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen2order4.v, aVR2TypeII2.v) annotation (Line(
      points={{42.5218,-103.3},{42.5218,-100},{82,-100},{82,-120.1},{76.2,
          -120.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen2order4.pm0, Gen2order4.pm) annotation (Line(
      points={{40.6013,-103.3},{40.6013,-96},{58,-96},{58,-122},{47.8,-122},{
          47.8,-119.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen2order4.p, B3.p) annotation (Line(
      points={{45.1053,-103.3},{45.1053,-94},{44,-94},{44,-90}},
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
  connect(const1.y, aVR1TypeII1.vref) annotation (Line(
      points={{-77.6,-122},{-68,-122},{-68,-120.6},{-58,-120.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVR1TypeII1.vf, Gen3order4.vf) annotation (Line(
      points={{-41.5,-123.4},{-28.9796,-123.4},{-28.9796,-117.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B3.p, L5.p) annotation (Line(
      points={{44,-90},{44,-84},{12.8,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen3order4.p, B2.p) annotation (Line(
      points={{-24.8947,-101.3},{-24.8947,-94.65},{-24,-94.65},{-24,-88}},
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
  connect(const.y, aVRTypeII.vref) annotation (Line(
      points={{-147.6,10},{-144,10},{-144,11.4},{-134,11.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.v, aVRTypeII.v) annotation (Line(
      points={{-109.2,-13.1678},{-98,-13.1678},{-98,-2},{-140,-2},{-140,6},{
          -134,6},{-134,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVRTypeII.vf, Gen1order4.vf) annotation (Line(
      points={{-117.5,8.6},{-110,8.6},{-110,-6},{-134,-6},{-134,-11.4518},{
          -127.6,-11.4518}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.pm0, Gen1order4.pm) annotation (Line(
      points={{-109.2,-10.9729},{-100,-10.9729},{-100,-30},{-138,-30},{-138,
          -19.2},{-127.6,-19.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1order4.p, B1.p) annotation (Line(
      points={{-109.2,-16.1203},{-105,-16.1203},{-105,-41}},
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
  connect(B4.p, L8.n) annotation (Line(
      points={{32,-32},{32,-46},{18,-46},{18,-45},{8.8,-45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, L8.p) annotation (Line(
      points={{-24,-40},{-24,-34},{2,-34},{2,-45},{3.2,-45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, lPQ2.p) annotation (Line(
      points={{-24,-40},{-24,-32.4},{-30,-32.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen4order4.p, B8.p) annotation (Line(
      points={{99.1,-3.87971},{90,-3.87971},{90,-5},{85,-5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen4order4.vf, aVR3TypeII2.vf) annotation (Line(
      points={{119.8,-8.54816},{122.9,-8.54816},{122.9,-6.6},{127.65,-6.6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(Gen4order4.v, aVR3TypeII2.v) annotation (Line(
      points={{99.1,-6.83221},{94,-6.83221},{94,10},{150,10},{150,-3},{145.8,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen4order4.pm0, Gen4order4.pm) annotation (Line(
      points={{99.1,-9.02708},{96,-9.02708},{96,-18},{124,-18},{124,-0.8},{
          119.8,-0.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, aVR3TypeII2.vref) annotation (Line(
      points={{141.6,-26},{136,-26},{136,-16},{154,-16},{154,-9.4},{145.8,
          -9.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(twoWindingTransformer.p, B8.p) annotation (Line(
      points={{77,-4},{86,-4},{86,-6},{85,-5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus7.p, twoWindingTransformer.n) annotation (Line(
      points={{39,21},{39,8},{55,8},{55,-4}},
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
  connect(bus7.p, twoWindingTransformer2.n) annotation (Line(
      points={{39,21},{39,2.7},{40,2.7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B4.p, uLTC.p) annotation (Line(
      points={{32,-32},{32,-22},{19,-22},{19,-15.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B5.p, twoWindingTransformer1.p) annotation (Line(
      points={{-24,-40},{-24,-24},{-14,-24},{-14,-11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B9.p, pwFaultPQ.p) annotation (Line(
      points={{52,48},{74,48},{74,45},{83,45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B14.p, lPQ6.p) annotation (Line(
      points={{74,100},{74,105.5},{78,105.5},{78,107.6}},
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
      points={{-66,107.6},{-66,104},{-62,104},{-62,100}},
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
  connect(B6.p, Gen5order4.p) annotation (Line(
      points={{-45,39},{-45,29},{-45.8496,29}},
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
  connect(Gen3order4.v, aVR1TypeII1.v) annotation (Line(
      points={{-27.4782,-101.3},{-27.4782,-98},{-8,-98},{-8,-134},{-66,-134},{
          -66,-127},{-58,-127}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen3order4.pm0, Gen3order4.pm) annotation (Line(
      points={{-29.3987,-101.3},{-29.3987,-96},{-34,-96},{-34,-126},{-22.2,-126},
          {-22.2,-117.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(B4.p, L9.n) annotation (Line(
      points={{32,-32},{32,-50},{18,-50},{18,-55.2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -140},{160,120}}),      graphics), Icon(coordinateSystem(extent={{-180,
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
end FourteenBus_ULTCTest;
