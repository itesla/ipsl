within Nordic44.System;
model Nordic44
  import Nordic44;
  inner parameter Real Systembase=1000;
  parameter Real V3000=1;
  parameter Real A3000=1.116337;
  parameter Real P3000=900;
  parameter Real Q3000=812.58;
  parameter Real V3020=0.9937368;
  parameter Real A3020=0.4665295;
  parameter Real V3100=1.017992;
  parameter Real A3100=14.30254;
  parameter Real V3115=1;
  parameter Real A3115=31.54624;
  parameter Real P3115=367;
  parameter Real Q3115=240.6575;
  parameter Real V3200=1.013103;
  parameter Real A3200=7.635551;
  parameter Real V3244=1.002142;
  parameter Real A3244=9.970654;
  parameter Real V3245=0.9999999;
  parameter Real A3245=9.038589;
  parameter Real P3245=300;
  parameter Real Q3245=185.4535;
  parameter Real V3249=0.9999999;
  parameter Real A3249=42.77423;
  parameter Real P3249=643;
  parameter Real Q3249=54.48716;
  parameter Real V3300=1;
  parameter Real A3300=0;
  parameter Real P3300=440.364;
  parameter Real Q3300=190.2016;
  parameter Real V3359=1;
  parameter Real A3359=11.67624;
  parameter Real P3359=800;
  parameter Real Q3359=429.9607;
  parameter Real V3360=0.9937901;
  parameter Real A3360=11.49236;
  parameter Real V3701=1.005135;
  parameter Real A3701=41.1718;
  parameter Real V5100=1;
  parameter Real A5100=26.47007;
  parameter Real P5100=950;
  parameter Real Q5100=715.1166;
  parameter Real V5101=0.990218;
  parameter Real A5101=26.18787;
  parameter Real V5102=0.9921818;
  parameter Real A5102=32.57763;
  parameter Real V5103=0.989711;
  parameter Real A5103=33.47605;
  parameter Real V5300=1;
  parameter Real A5300=57.49048;
  parameter Real P5300=800;
  parameter Real Q5300=169.8511;
  parameter Real V5301=0.9923382;
  parameter Real A5301=48.88903;
  parameter Real V5304=0.9892719;
  parameter Real A5304=40.75034;
  parameter Real V5305=0.9980365;
  parameter Real A5305=41.75614;
  parameter Real V5400=1.007;
  parameter Real A5400=40.41059;
  parameter Real P5400=900;
  parameter Real Q5400=178.083;
  parameter Real V5401=0.9994396;
  parameter Real A5401=36.58119;
  parameter Real V5402=1.003601;
  parameter Real A5402=40.53869;
  parameter Real V5500=1.004;
  parameter Real A5500=25.21874;
  parameter Real P5500=950;
  parameter Real Q5500=-519.0964;
  parameter Real V5501=1.007397;
  parameter Real A5501=25.8328;
  parameter Real V5600=1.01;
  parameter Real A5600=33.31656;
  parameter Real P5600=750;
  parameter Real Q5600=453.0866;
  parameter Real V5601=1.006895;
  parameter Real A5601=40.46902;
  parameter Real V5602=0.9922876;
  parameter Real A5602=28.26247;
  parameter Real V5603=0.9354097;
  parameter Real A5603=27.26879;
  parameter Real V5610=0.9314524;
  parameter Real A5610=26.61906;
  parameter Real V5620=1.008238;
  parameter Real A5620=32.90638;
  parameter Real V6000=1.005;
  parameter Real A6000=41.34129;
  parameter Real P6000=500;
  parameter Real Q6000=56.8163;
  parameter Real V6001=1.001385;
  parameter Real A6001=40.63034;
  parameter Real V6100=1;
  parameter Real A6100=68.72635;
  parameter Real P6100=880;
  parameter Real Q6100=189.7237;
  parameter Real V6500=1;
  parameter Real A6500=19.15408;
  parameter Real P6500=775;
  parameter Real Q6500=229.453;
  parameter Real V6700=1.02;
  parameter Real A6700=34.79626;
  parameter Real P6700=600;
  parameter Real Q6700=21.12792;
  parameter Real V6701=1.007554;
  parameter Real A6701=34.63046;
  parameter Real V7000=1;
  parameter Real A7000=37.28787;
  parameter Real P7000=611;
  parameter Real Q7000=81.09602;
  parameter Real V7010=0.9938884;
  parameter Real A7010=37.98831;
  parameter Real V7020=1.000038;
  parameter Real A7020=37.18073;
  parameter Real V7100=1;
  parameter Real A7100=36.95136;
  parameter Real P7100=533;
  parameter Real Q7100=123.4662;
  parameter Real V8500=1.02;
  parameter Real A8500=-3.048752;
  parameter Real P8500=100;
  parameter Real Q8500=331.3799;
  parameter Real V8600=1.019883;
  parameter Real A8600=-3.395741;
  parameter Real V8700=1.02;
  parameter Real A8700=-3.048752;

  PowerSystems.Electrical.Buses.BusExt2 bus_7020(
    V_base=420,
    no=1,
    nu=1,
    Vmag0=V7020,
    Vang0=Modelica.SIunits.Conversions.from_deg(A7020))
    annotation (Placement(transformation(extent={{-282,-20},{-280,-10}})));
  Nordic44.Components_subsystems.Load Load1_bus7020(
    S_p(re=0.001*187, im=0.001*(-4)),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7020,
    anglev0=A7020)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-290,-13.5})));
  PowerSystems.Electrical.Buses.BusExt2 bus_7000(
    no=16,
    nu=3,
    V_base=420,
    Vmag0=V7000,
    Vang0=Modelica.SIunits.Conversions.from_deg(A7000))
    annotation (Placement(transformation(extent={{-272,-108},{-270,-36}})));
  Nordic44.Components_subsystems.Load Load1_bus7000(
    S_p(re=0.001*1280, im=0.001*70),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7000,
    anglev0=A7000)    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-290,-38})));
  Nordic44.Components_subsystems.Load Load2_bus7000(
    S_p(re=0.001*1280, im=0.001*70),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7000,
    anglev0=A7000)    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-290,-46})));
  Nordic44.Components_subsystems.Load Load3_bus7000(
    S_p(re=0.001*1280, im=0.001*70),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7000,
    anglev0=A7000)    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-290,-54})));
  Nordic44.Components_subsystems.Load Load4_bus7000(
    S_p(re=0.001*1280, im=0.001*70),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7000,
    anglev0=A7000)    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-290,-62})));
  Nordic44.Components_subsystems.Load Load5_bus7000(
    S_p(re=0.001*1280, im=0.001*70),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7000,
    anglev0=A7000)    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-290,-70})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G1_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
    annotation (Placement(transformation(extent={{-292,-82},{-286,-76}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G2_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
    annotation (Placement(transformation(extent={{-292,-90},{-286,-84}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G3_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
    annotation (Placement(transformation(extent={{-292,-98},{-286,-92}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G4_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
                annotation (Placement(transformation(extent={{-292,-106},{-286,
            -100}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G5_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
                annotation (Placement(transformation(extent={{-292,-114},{-286,
            -108}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G6_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
                annotation (Placement(transformation(extent={{-292,-122},{-286,
            -116}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G7_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
                annotation (Placement(transformation(extent={{-292,-130},{-286,
            -124}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G8_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
                annotation (Placement(transformation(extent={{-292,-138},{-286,
            -132}})));
  Nordic44.Components_subsystems.Gen1_bus_7000 G9_bus7000(
    Mbase=1278,
    Psch=P7000,
    Qsch=Q7000,
    Vmag0=V7000,
    Vang0=A7000)
                annotation (Placement(transformation(extent={{-292,-146},{-286,
            -140}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_7010(
    V_base=420,
    no=1,
    nu=1,
    Vmag0=V7010,
    Vang0=Modelica.SIunits.Conversions.from_deg(A7010))
    annotation (Placement(transformation(extent={{-282,0},{-280,10}})));
  Nordic44.Components_subsystems.Load Load1_bus7010(
    S_p(re=0.001*(-1215), im=0.001*600),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7010,
    anglev0=A7010)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-290,6.5})));
  Nordic44.Components_subsystems.Gen3_bus_7100 G1_bus7100(
    Mbase=1000,
    Psch=P7100,
    Qsch=Q7100,
    Vmag0=V7100,
    Vang0=A7100)
    annotation (Placement(transformation(extent={{-266,-14},{-260,-8}})));
  Nordic44.Components_subsystems.Gen3_bus_7100 G2_bus7100(
    Mbase=1000,
    Psch=P7100,
    Qsch=Q7100,
    Vmag0=V7100,
    Vang0=A7100)
    annotation (Placement(transformation(extent={{-266,-20},{-260,-14}})));
  Nordic44.Components_subsystems.Gen3_bus_7100 G3_bus7100(
    Mbase=1000,
    Psch=P7100,
    Qsch=Q7100,
    Vmag0=V7100,
    Vang0=A7100)
    annotation (Placement(transformation(extent={{-266,-26},{-260,-20}})));
  Nordic44.Components_subsystems.Load Load1_bus7100(
    S_p(re=0.001*1150, im=0.001*200),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7100,
    anglev0=A7100)    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-264,-28})));
  Nordic44.Components_subsystems.Load Load2_bus7100(
    S_p(re=0.001*1150, im=0.001*200),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V7100,
    anglev0=A7100)    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-264,-34})));
  PowerSystems.Electrical.Buses.BusExt2 bus_7100(
    no=8,
    nu=2,
    V_base=420,
    Vmag0=V7100,
    Vang0=Modelica.SIunits.Conversions.from_deg(A7100))
    annotation (Placement(transformation(extent={{-252,-52},{-250,-14}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine(
    R=0.000000,
    X=0.010000,
    G=0,
    B=0.000000) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-275,-1})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine1(
    R=0.000000,
    X=0.010000,
    G=0,
    B=0.000000) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-278,-29})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine2(
    R=0.040000,
    X=0.120000,
    G=0,
    B=0.130000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-260,-47})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine3(
    R=0.040000,
    X=0.120000,
    G=0,
    B=0.130000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-257,-57})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine4(
    R=0.040000,
    X=0.140000,
    G=0,
    B=0.130000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-254,-69})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3115(
    V_base=420,
    no=6,
    nu=4,
    Vmag0=V3115,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3115))
    annotation (Placement(transformation(extent={{-228,-20},{-226,34}})));
  Nordic44.Components_subsystems.Gen3_bus_3115 G1_bus3115(
    Mbase=1100,
    Psch=P3115,
    Qsch=Q3115,
    Vmag0=V3115,
    Vang0=A3115)
    annotation (Placement(transformation(extent={{-242,14},{-236,20}})));
  Nordic44.Components_subsystems.Gen3_bus_3115 G2_bus3115(
    Mbase=1100,
    Psch=P3115,
    Qsch=Q3115,
    Vmag0=V3115,
    Vang0=A3115)
    annotation (Placement(transformation(extent={{-242,8},{-236,14}})));
  Nordic44.Components_subsystems.Gen3_bus_3115 G3_bus3115(
    Mbase=1100,
    Psch=P3115,
    Qsch=Q3115,
    Vmag0=V3115,
    Vang0=A3115)
    annotation (Placement(transformation(extent={{-242,0},{-236,6}})));
  Nordic44.Components_subsystems.Load Load_bus3115(
    S_p(re=0.001*750, im=0.001*650),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3115,
    anglev0=A3115)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-240,-3.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine5(
    R=0.040000,
    X=0.130000,
    G=0,
    B=0.130000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-239,-26})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine6(
    R=0.075000,
    X=0.900000,
    G=0,
    B=0.500000*0.5) annotation (Placement(transformation(
        extent={{5,-3},{-5,3}},
        rotation=180,
        origin={-239,29})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine7(
    R=0.030000,
    X=0.400000,
    G=0,
    B=0.110000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-206,34})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine8(
    R=0.015000,
    X=0.200000,
    G=0,
    B=0.080000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-207,11})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine9(
    R=0.040000,
    X=0.400000,
    G=0,
    B=0.100000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-204,-36})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine10(
    R=0.045000,
    X=0.500000,
    G=0,
    B=0.140000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-212,-19})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine11(
    R=0.020000,
    X=0.075000,
    G=0,
    B=0.078000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-231,-45})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3000(
    no=7,
    nu=5,
    V_base=420,
    Vmag0=V3000,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3000))
    annotation (Placement(transformation(extent={{-258,46},{-256,66}})));
  Nordic44.Components_subsystems.Gen1_bus_3000 G1_bus3000(
    Mbase=1300,
    Psch=P3000,
    Qsch=Q3000,
    Vmag0=V3000,
    Vang0=A3000)
    annotation (Placement(transformation(extent={{-280,64},{-274,70}})));
  Nordic44.Components_subsystems.Gen1_bus_3000 G2_bus3000(
    Mbase=1300,
    Psch=P3000,
    Qsch=Q3000,
    Vmag0=V3000,
    Vang0=A3000)
    annotation (Placement(transformation(extent={{-280,56},{-274,62}})));
  Nordic44.Components_subsystems.Gen1_bus_3000 G3_bus3000(
    Mbase=1300,
    Psch=P3000,
    Qsch=Q3000,
    Vmag0=V3000,
    Vang0=A3000)
    annotation (Placement(transformation(extent={{-280,48},{-274,54}})));
  Nordic44.Components_subsystems.Load Load1_bus3000(
    S_p(re=0.001*1167, im=0.001*567),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3000,
    anglev0=A3000)   annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-276,44.5})));
  Nordic44.Components_subsystems.Load Load2_bus3000(
    S_p(re=0.001*1167, im=0.001*567),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3000,
    anglev0=A3000)   annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-276,36.5})));
  Nordic44.Components_subsystems.Load Load3_bus3000(
    S_p(re=0.001*1167, im=0.001*567),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3000,
    anglev0=A3000)   annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-276,28.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine12(
    R=0.000000,
    X=0.010000,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-269,79})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine13(
    R=0.006000,
    X=0.080000,
    G=0,
    B=0.030000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-249,75})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine14(
    R=0.009000,
    X=0.100000,
    G=0,
    B=0.025000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-249,65})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine15(
    R=0.008000,
    X=0.120000,
    G=0,
    B=0.050000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-234,56})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine16(
    R=0.018000,
    X=0.200000,
    G=0,
    B=0.050000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-252,15})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3020(
    no=1,
    V_base=420,
    nu=1,
    Vmag0=V3020,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3020))
    annotation (Placement(transformation(extent={{-282,70},{-280,90}})));
  Nordic44.Components_subsystems.Load Load_bus3020(
    S_p(re=0.001*1127, im=0.001*616),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3020,
    anglev0=A3020)   annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-292,80.5})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3300(
    no=5,
    nu=5,
    V_base=420,
    Vmag0=V3300,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3300))
    annotation (Placement(transformation(extent={{-220,88},{-218,108}})));
  Nordic44.Components_subsystems.Gen4_bus_3300 G2_bus3300(
    Mbase=1100,
    Psch=P3300,
    Qsch=Q3300,
    Vmag0=V3300,
    Vang0=A3300)
                annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=180,
        origin={-205,97})));
  Nordic44.Components_subsystems.Gen4_bus_3300 G3_bus3300(
    Mbase=1100,
    Psch=P3300,
    Qsch=Q3300,
    Vmag0=V3300,
    Vang0=A3300)
    annotation (Placement(transformation(extent={{-202,92},{-208,86}})));
  Nordic44.Components_subsystems.Gen4_bus_3300 G1_bus3300(
    Mbase=1100,
    Psch=P3300,
    Qsch=Q3300,
    Vmag0=V3300,
    Vang0=A3300)
    annotation (Placement(transformation(extent={{-236,89},{-230,95}})));
  Nordic44.Components_subsystems.Load Load1_bus3300(
    S_p(re=0.001*1000, im=0.001*400),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3300,
    anglev0=A3300)
               annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-234,106.5})));
  Nordic44.Components_subsystems.Load Load2_bus3300(
    S_p(re=0.001*1000, im=0.001*400),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3300,
    anglev0=A3300)
               annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-234,99.5})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3200(
    no=5,
    nu=1,
    V_base=420,
    Vmag0=V3200,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3200))
    annotation (Placement(transformation(extent={{-178,88},{-176,108}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine17(
    R=0.020000,
    X=0.200000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-197,103})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine18(
    R=0.040000,
    X=0.240000,
    G=0,
    B=0.200000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-193,77})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine19(
    R=0.040000,
    X=0.240000,
    G=0,
    B=0.200000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-187,77})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine20(
    R=0.040000,
    X=0.240000,
    G=0,
    B=0.200000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-181,77})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3100(
    no=6,
    nu=2,
    V_base=420,
    Vmag0=V3100,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3100))
    annotation (Placement(transformation(extent={{-178,36},{-176,56}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine21(
    R=0.020000,
    X=0.230000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-211,119})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine22(
    R=0.012000,
    X=0.270000,
    G=0,
    B=0.100000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-207,119})));
  PowerSystems.Electrical.Buses.BusExt2 bus_8500(
    no=8,
    nu=8,
    V_base=420,
    Vmag0=V8500,
    Vang0=Modelica.SIunits.Conversions.from_deg(A8500))
    annotation (Placement(transformation(extent={{-198,124},{-196,166}})));
  Nordic44.Components_subsystems.Load Load1_bus8500(
    S_p(re=0.001*1083, im=0.001*433),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V8500,
    anglev0=A8500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-216,160.5})));
  Nordic44.Components_subsystems.Load Load2_bus8500(
    S_p(re=0.001*1083, im=0.001*433),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V8500,
    anglev0=A8500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-216,154.5})));
  Nordic44.Components_subsystems.Load Load3_bus8500(
    S_p(re=0.001*1083, im=0.001*433),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V8500,
    anglev0=A8500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-216,148.5})));
  Nordic44.Components_subsystems.Gen4_bus_8500 G1_bus8500(
    Mbase=1300,
    Psch=P8500,
    Qsch=Q8500,
    Vmag0=V8500,
    Vang0=A8500)
    annotation (Placement(transformation(extent={{-218,138},{-212,144}})));
  Nordic44.Components_subsystems.Gen4_bus_8500 G2_bus8500(
    Mbase=1300,
    Psch=P8500,
    Qsch=Q8500,
    Vmag0=V8500,
    Vang0=A8500)
    annotation (Placement(transformation(extent={{-218,130},{-212,136}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine23(
    R=0.000000,
    X=0.010000,
    G=0,
    B=0.000000) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-215,167})));
  Nordic44.Components_subsystems.Gen4_bus_8500 G3_bus8500(
    Mbase=1300,
    Psch=P8500,
    Qsch=Q8500,
    Vmag0=V8500,
    Vang0=A8500)
    annotation (Placement(transformation(extent={{-176,166},{-182,160}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine24(
    R=0.000000,
    X=0.010000,
    G=0,
    B=0.000000) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-179,169})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine25(
    R=0.010000,
    X=0.170000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-189,121})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine26(
    R=0.025000,
    X=0.320000,
    G=0,
    B=0.090000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-161,133})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine27(
    R=0.012000,
    X=0.270000,
    G=0,
    B=0.100000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-161,129})));
  Nordic44.Components_subsystems.Gen4_bus_8500 G4_bus8500(
    Mbase=1300,
    Psch=P8500,
    Qsch=Q8500,
    Vmag0=V8500,
    Vang0=A8500)
    annotation (Placement(transformation(extent={{-178,158},{-184,152}})));
  Nordic44.Components_subsystems.Gen4_bus_8500 G5_bus8500(
    Mbase=1300,
    Psch=P8500,
    Qsch=Q8500,
    Vmag0=V8500,
    Vang0=A8500)
    annotation (Placement(transformation(extent={{-178,150},{-184,144}})));
  Nordic44.Components_subsystems.Gen4_bus_8500 G6_bus8500(
    Mbase=1300,
    Psch=P8500,
    Qsch=Q8500,
    Vmag0=V8500,
    Vang0=A8500)
    annotation (Placement(transformation(extent={{-178,142},{-184,136}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_8700(
    no=1,
    nu=1,
    V_base=420,
    Vmag0=V8700,
    Vang0=Modelica.SIunits.Conversions.from_deg(A8700))
    annotation (Placement(transformation(extent={{-238,156},{-236,176}})));
  Nordic44.Components_subsystems.Load Load_bus8700(
    S_p(re=0.001*0, im=0.001*0),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V8700,
    anglev0=A8700)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-246,166.5})));
  PowerSystems.Electrical.Buses.BusExt2 bus_8600(
    no=1,
    nu=1,
    V_base=420,
    Vmag0=V8600,
    Vang0=Modelica.SIunits.Conversions.from_deg(A8600))
    annotation (Placement(transformation(extent={{-162,156},{-160,176}})));
  Nordic44.Components_subsystems.Load Load_bus8600(
    S_p(re=0.001*630, im=0.001*10),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V8600,
    anglev0=A8600)    annotation (Placement(transformation(
        extent={{6,-5.5},{-6,5.5}},
        rotation=180,
        origin={-150,166.5})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3359(
    no=9,
    nu=9,
    V_base=420,
    Vmag0=V3359,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3359))
    annotation (Placement(transformation(extent={{-124,54},{-122,112}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine28(
    R=0.010000,
    X=0.200000,
    G=0,
    B=0.070000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-153,99})));
  Nordic44.Components_subsystems.Load Load1_bus3359(
    S_p(re=0.001*1200, im=0.001*600),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3359,
    anglev0=A3359)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-146,91.5})));
  Nordic44.Components_subsystems.Load Load2_bus3359(
    S_p(re=0.001*1200, im=0.001*600),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3359,
    anglev0=A3359)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-146,84.5})));
  Nordic44.Components_subsystems.Load Load3_bus3359(
    S_p(re=0.001*1200, im=0.001*600),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3359,
    anglev0=A3359)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-146,78.5})));
  Nordic44.Components_subsystems.Load Load4_bus3359(
    S_p(re=0.001*1200, im=0.001*600),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3359,
    anglev0=A3359)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-146,72.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine29(
    R=0.080000,
    X=0.500000,
    G=0,
    B=0.250000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-155,57})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine30(
    R=0.040000,
    X=0.230000,
    G=0,
    B=0.240000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={-155,51})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3360(
    nu=1,
    V_base=135,
    Vmag0=V3360,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3360),
    no=1)
    annotation (Placement(transformation(extent={{-96,130},{-94,150}})));
  Nordic44.Components_subsystems.Load Load_bus3360(
    S_p(re=0.001*225, im=0.001*262),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3360,
    anglev0=A3360)    annotation (Placement(transformation(
        extent={{6,-5.5},{-6,5.5}},
        rotation=180,
        origin={-80,140.5})));
  Nordic44.Components_subsystems.Load Load_bus3100(
    S_p(re=0.001*50, im=0.001*110),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3100,
    anglev0=A3100)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-200,50.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine31(
    R=0.030000,
    X=0.430000,
    G=0,
    B=0.160000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=-90,
        origin={-189,15})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3249(
    nu=5,
    V_base=420,
    no=7,
    Vmag0=V3249,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3249))
    annotation (Placement(transformation(extent={{-176,-52},{-174,6}})));
  Nordic44.Components_subsystems.Load Load_bus3249(
    S_p(re=0.001*1050, im=0.001*650),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V3249,
    anglev0=A3249)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-196,-7.5})));
  Nordic44.Components_subsystems.Gen2_bus_3249 G1_bus3249(
    Mbase=1357,
    Psch=P3249,
    Qsch=Q3249,
    Vmag0=V3249,
    Vang0=A3249)
    annotation (Placement(transformation(extent={{-198,-20},{-192,-14}})));
  Nordic44.Components_subsystems.Gen2_bus_3249 G2_bus3249(
    Mbase=1357,
    Psch=P3249,
    Qsch=Q3249,
    Vmag0=V3249,
    Vang0=A3249)
    annotation (Placement(transformation(extent={{-198,-28},{-192,-22}})));
  Nordic44.Components_subsystems.Gen2_bus_3249 G3_bus3249(
    Mbase=1357,
    Psch=P3249,
    Qsch=Q3249,
    Vmag0=V3249,
    Vang0=A3249)
    annotation (Placement(transformation(extent={{-198,-36},{-192,-30}})));
  Nordic44.Components_subsystems.Gen2_bus_3249 G4_bus3249(
    Mbase=1357,
    Psch=P3249,
    Qsch=Q3249,
    Vmag0=V3249,
    Vang0=A3249)
    annotation (Placement(transformation(extent={{-158,-12},{-164,-18}})));
  Nordic44.Components_subsystems.Gen2_bus_3249 G5_bus3249(
    Mbase=1357,
    Psch=P3249,
    Qsch=Q3249,
    Vmag0=V3249,
    Vang0=A3249)
    annotation (Placement(transformation(extent={{-158,-20},{-164,-26}})));
  Nordic44.Components_subsystems.Gen2_bus_3249 G6_bus3249(
    Mbase=1357,
    Psch=P3249,
    Qsch=Q3249,
    Vmag0=V3249,
    Vang0=A3249)
    annotation (Placement(transformation(extent={{-158,-26},{-164,-32}})));
  Nordic44.Components_subsystems.Gen2_bus_3249 G7_bus3249(
    Mbase=1357,
    Psch=P3249,
    Qsch=Q3249,
    Vmag0=V3249,
    Vang0=A3249)
    annotation (Placement(transformation(extent={{-158,-34},{-164,-40}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3701(
    nu=1,
    V_base=300,
    Vmag0=V3701,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3701),
    no=1)
    annotation (Placement(transformation(extent={{-118,-70},{-116,-50}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3245(
    V_base=420,
    no=3,
    nu=2,
    Vmag0=V3245,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3245))
    annotation (Placement(transformation(extent={{-208,-82},{-206,-62}})));
  Nordic44.Components_subsystems.Gen2_bus_3245 G1_bus3245(
    Mbase=950,
    Psch=P3245,
    Qsch=Q3245,
    Vmag0=V3245,
    Vang0=A3245)
    annotation (Placement(transformation(extent={{-194,-62},{-200,-68}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_3244(
    nu=1,
    V_base=300,
    Vmag0=V3244,
    Vang0=Modelica.SIunits.Conversions.from_deg(A3244),
    no=1)
    annotation (Placement(transformation(extent={{-178,-106},{-176,-86}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_6701(
    no=1,
    V_base=420,
    Vmag0=V6701,
    Vang0=Modelica.SIunits.Conversions.from_deg(A6701),
    nu=1)
    annotation (Placement(transformation(extent={{-146,-94},{-144,-74}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_6700(
    nu=3,
    V_base=300,
    no=4,
    Vmag0=V6700,
    Vang0=Modelica.SIunits.Conversions.from_deg(A6700))
    annotation (Placement(transformation(extent={{-78,-94},{-76,-74}})));
  Nordic44.Components_subsystems.Load Load1_bus6700(
    S_p(re=0.001*750, im=0.001*150),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V6700,
    anglev0=A6700)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-96,-75.5})));
  Nordic44.Components_subsystems.Gen3_bus_6700 G1_bus6700(
    Mbase=1200,
    Psch=P6700,
    Qsch=Q6700,
    Vmag0=V6700,
    Vang0=A6700)
    annotation (Placement(transformation(extent={{-98,-98},{-92,-92}})));
  Nordic44.Components_subsystems.Gen3_bus_6700 G2_bus6700(
    Mbase=1200,
    Psch=P6700,
    Qsch=Q6700,
    Vmag0=V6700,
    Vang0=A6700)
    annotation (Placement(transformation(extent={{-58,-74},{-64,-80}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine32(
    R=0.250000,
    X=2.000000,
    G=0,
    B=0.030000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-95,-69})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine33(
    R=0.010000,
    X=0.200000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-111,-111})));
  PowerSystems.Electrical.Buses.BusExt2 bus_6500(
    no=6,
    V_base=300,
    nu=5,
    Vmag0=V6500,
    Vang0=Modelica.SIunits.Conversions.from_deg(A6500))
    annotation (Placement(transformation(extent={{-20,-122},{-18,-78}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine34(
    R=0.170000,
    X=1.800000,
    G=0,
    B=0.100000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-51,-85})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine35(
    R=0.100000,
    X=1.300000,
    G=0,
    B=0.120000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-51,-91})));
  Nordic44.Components_subsystems.Load Load1_bus6500(
    S_p(re=0.001*933, im=0.001*333),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V6500,
    anglev0=A6500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-36,-97.5})));
  Nordic44.Components_subsystems.Load Load2_bus6500(
    S_p(re=0.001*933, im=0.001*333),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V6500,
    anglev0=A6500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-36,-105.5})));
  Nordic44.Components_subsystems.Load Load3_bus6500(
    S_p(re=0.001*933, im=0.001*333),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V6500,
    anglev0=A6500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={-36,-113.5})));
  Nordic44.Components_subsystems.Gen5_bus_6500 G1_bus6500(
    Mbase=1100,
    Psch=P6500,
    Qsch=Q6500,
    Vmag0=V6500,
    Vang0=A6500)
    annotation (Placement(transformation(extent={{2,-90},{-4,-96}})));
  Nordic44.Components_subsystems.Gen5_bus_6500 G2_bus6500(
    Mbase=1100,
    Psch=P6500,
    Qsch=Q6500,
    Vmag0=V6500,
    Vang0=A6500)
    annotation (Placement(transformation(extent={{2,-98},{-4,-104}})));
  Nordic44.Components_subsystems.Gen5_bus_6500 G3_bus6500(
    Mbase=1100,
    Psch=P6500,
    Qsch=Q6500,
    Vmag0=V6500,
    Vang0=A6500)
    annotation (Placement(transformation(extent={{2,-106},{-4,-112}})));
  Nordic44.Components_subsystems.Gen5_bus_6500 G4_bus6500(
    Mbase=1100,
    Psch=P6500,
    Qsch=Q6500,
    Vmag0=V6500,
    Vang0=A6500)
    annotation (Placement(transformation(extent={{2,-114},{-4,-120}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5100(
    nu=2,
    V_base=300,
    no=3,
    Vmag0=V5100,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5100))
          annotation (Placement(transformation(extent={{22,-74},{24,-54}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine36(
    R=0.080000,
    X=0.900000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={3,-79})));
  Nordic44.Components_subsystems.Gen5_bus_5100 G1_bus5100(
    Mbase=1200,
    Psch=P5100,
    Qsch=Q5100,
    Vmag0=V5100,
    Vang0=A5100)
    annotation (Placement(transformation(extent={{2,-68},{8,-62}})));
  Nordic44.Components_subsystems.Load Load_bus5100(
    S_p(re=0.001*550, im=0.001*70),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5100,
    anglev0=A5100)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={4,-55.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine37(
    R=0.027000,
    X=0.260000,
    G=0,
    B=0.044000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={41,-65})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5101(
    no=3,
    nu=3,
    V_base=420,
    Vmag0=V5101,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5101))
    annotation (Placement(transformation(extent={{22,-2},{24,18}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine38(
    R=0.020000,
    X=0.220000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-65,11})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine39(
    R=0.016000,
    X=0.260000,
    G=0,
    B=0.090000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={-65,17})));
  Nordic44.Components_subsystems.Gen4_bus_3359 G1_bus3359(
    Mbase=1350,
    Psch=P3359,
    Qsch=Q3359,
    Vmag0=V3359,
    Vang0=A3359)
    annotation (Placement(transformation(extent={{-92,110},{-98,104}})));
  Nordic44.Components_subsystems.Gen4_bus_3359 G2_bus3359(
    Mbase=1350,
    Psch=P3359,
    Qsch=Q3359,
    Vmag0=V3359,
    Vang0=A3359)
    annotation (Placement(transformation(extent={{-92,102},{-98,96}})));
  Nordic44.Components_subsystems.Gen4_bus_3359 G3_bus3359(
    Mbase=1350,
    Psch=P3359,
    Qsch=Q3359,
    Vmag0=V3359,
    Vang0=A3359)
    annotation (Placement(transformation(extent={{-92,94},{-98,88}})));
  Nordic44.Components_subsystems.Gen4_bus_3359 G4_bus3359(
    Mbase=1350,
    Psch=P3359,
    Qsch=Q3359,
    Vmag0=V3359,
    Vang0=A3359)
    annotation (Placement(transformation(extent={{-92,86},{-98,80}})));
  Nordic44.Components_subsystems.Gen4_bus_3359 G5_bus3359(
    Mbase=1350,
    Psch=P3359,
    Qsch=Q3359,
    Vmag0=V3359,
    Vang0=A3359)
    annotation (Placement(transformation(extent={{-92,78},{-98,72}})));
  Nordic44.Components_subsystems.Gen4_bus_3359 G6_bus3359(
    Mbase=1350,
    Psch=P3359,
    Qsch=Q3359,
    Vmag0=V3359,
    Vang0=A3359)
    annotation (Placement(transformation(extent={{-92,70},{-98,64}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine40(
    R=0.010000,
    X=0.140000,
    G=0,
    B=0.040000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={43,15})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine41(
    R=0.008000,
    X=0.100000,
    G=0,
    B=0.090000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={43,9})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine42(
    R=0.010000,
    X=0.150000,
    G=0,
    B=0.550000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={43,3})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5103(
    no=1,
    nu=3,
    V_base=420,
    Vmag0=V5103,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5103))
    annotation (Placement(transformation(extent={{80,38},{82,58}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine43(
    R=0.013000,
    X=0.200000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={97,47})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine44(
    R=0.020000,
    X=0.250000,
    G=0,
    B=0.070000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={97,53})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine45(
    R=0.004000,
    X=0.070000,
    G=0,
    B=0.030000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={97,41})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5304(
    nu=3,
    no=3,
    V_base=420,
    Vmag0=V5304,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5304))
    annotation (Placement(transformation(extent={{122,70},{124,90}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5102(
    no=3,
    nu=1,
    V_base=420,
    Vmag0=V5102,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5102))
    annotation (Placement(transformation(extent={{122,4},{124,24}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine46(
    R=0.017000,
    X=0.240000,
    G=0,
    B=0.070000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={116,49})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine47(
    R=0.030000,
    X=0.460000,
    G=0,
    B=0.130000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={136,14})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5305(
    nu=1,
    no=2,
    V_base=420,
    Vmag0=V5305,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5305))
    annotation (Placement(transformation(extent={{162,110},{164,130}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine48(
    R=0.010000,
    X=0.150000,
    G=0,
    B=0.050000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={135,97})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine49(
    R=0.013000,
    X=0.017000,
    G=0,
    B=0.040000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={141,97})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine50(
    R=0.010000,
    X=0.200000,
    G=0,
    B=0.060000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={159,75})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5301(
    no=3,
    V_base=420,
    Vmag0=V5301,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5301),
    nu=1) annotation (Placement(transformation(extent={{200,70},{202,90}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine51(
    R=0.007000,
    X=0.120000,
    G=0,
    B=0.031000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={183,97})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine52(
    R=0.013000,
    X=0.200000,
    G=0,
    B=0.050000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={172,53})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5300(
    nu=2,
    V_base=300,
    no=3,
    Vmag0=V5300,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5300))
          annotation (Placement(transformation(extent={{240,70},{242,90}})));
  Nordic44.Components_subsystems.Gen3_bus_5300 G1_bus5300(
    Mbase=1200,
    Psch=P5300,
    Qsch=Q5300,
    Vmag0=V5300,
    Vang0=A5300)
    annotation (Placement(transformation(extent={{220,64},{226,70}})));
  Nordic44.Components_subsystems.Gen3_bus_5300 G2_bus5300(
    Mbase=1200,
    Psch=P5300,
    Qsch=Q5300,
    Vmag0=V5300,
    Vang0=A5300)
    annotation (Placement(transformation(extent={{262,88},{256,82}})));
  Nordic44.Components_subsystems.Load Load_bus5300(
    S_p(re=0.001*30, im=0.001*(-70)),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5300,
    anglev0=A5300)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={220,80.5})));
  PowerSystems.Electrical.Buses.BusExt2 bus_6100(
    nu=4,
    no=5,
    V_base=300,
    Vmag0=V6100,
    Vang0=Modelica.SIunits.Conversions.from_deg(A6100))
    annotation (Placement(transformation(extent={{280,38},{282,58}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine53(
    R=0.021000,
    X=0.220000,
    G=0,
    B=0.010000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={259,75})));
  Nordic44.Components_subsystems.Load Load1_bus6100(
    S_p(re=0.001*1200, im=0.001*400),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V6100,
    anglev0=A6100)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={264,60.5})));
  Nordic44.Components_subsystems.Load Load2_bus6100(
    S_p(re=0.001*1200, im=0.001*400),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V6100,
    anglev0=A6100)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={264,52.5})));
  Nordic44.Components_subsystems.Gen3_bus_6100 G1_bus6100(
    Mbase=1240,
    Psch=P6100,
    Qsch=Q6100,
    Vmag0=V6100,
    Vang0=A6100)
    annotation (Placement(transformation(extent={{262,42},{268,48}})));
  Nordic44.Components_subsystems.Gen3_bus_6100 G2_bus6100(
    Mbase=1240,
    Psch=P6100,
    Qsch=Q6100,
    Vmag0=V6100,
    Vang0=A6100)
    annotation (Placement(transformation(extent={{296,64},{290,58}})));
  Nordic44.Components_subsystems.Gen3_bus_6100 G4_bus6100(
    Mbase=1240,
    Psch=P6100,
    Qsch=Q6100,
    Vmag0=V6100,
    Vang0=A6100)
    annotation (Placement(transformation(extent={{296,48},{290,42}})));
  Nordic44.Components_subsystems.Gen3_bus_6100 G5_bus6100(
    Mbase=1240,
    Psch=P6100,
    Qsch=Q6100,
    Vmag0=V6100,
    Vang0=A6100)
    annotation (Placement(transformation(extent={{296,40},{290,34}})));
  Nordic44.Components_subsystems.Gen3_bus_6100 G3_bus6100(
    Mbase=1240,
    Psch=P6100,
    Qsch=Q6100,
    Vmag0=V6100,
    Vang0=A6100)
    annotation (Placement(transformation(extent={{296,56},{290,50}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine54(
    R=0.034000,
    X=0.420000,
    G=0,
    B=0.030000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={254,31})));
  PowerSystems.Electrical.Buses.BusExt2 bus_6000(
    nu=2,
    V_base=300,
    no=3,
    Vmag0=V6000,
    Vang0=Modelica.SIunits.Conversions.from_deg(A6000))
          annotation (Placement(transformation(extent={{240,-8},{242,12}})));
  Nordic44.Components_subsystems.Gen5_bus_6000 G1_bus6000(
    Mbase=680,
    Psch=P6000,
    Qsch=Q6000,
    Vmag0=V6000,
    Vang0=A6000)
    annotation (Placement(transformation(extent={{219,-2},{227,6}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine55(
    R=0.033000,
    X=0.360000,
    G=0,
    B=0.025000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={222,-23})));
  PowerSystems.Electrical.Buses.BusExt2 bus_6001(
    no=3,
    V_base=420,
    nu=3,
    Vmag0=V6001,
    Vang0=Modelica.SIunits.Conversions.from_deg(A6001))
          annotation (Placement(transformation(extent={{182,12},{184,32}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5601(
    nu=1,
    V_base=300,
    Vmag0=V5601,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5601),
    no=1) annotation (Placement(transformation(extent={{280,-2},{282,18}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5600(
    no=4,
    V_base=300,
    nu=4,
    Vmag0=V5600,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5600))
    annotation (Placement(transformation(extent={{280,-54},{282,-34}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine56(
    R=0.030000,
    X=0.340000,
    G=0,
    B=0.020000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={289,-15})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine57(
    R=0.020000,
    X=0.200000,
    G=0,
    B=0.070000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={265,-1})));
  Nordic44.Components_subsystems.Load Load1_bus5600(
    S_p(re=0.001*675, im=0.001*125),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5600,
    anglev0=A5600)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={264,-35.5})));
  Nordic44.Components_subsystems.Load Load2_bus5600(
    S_p(re=0.001*675, im=0.001*125),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5600,
    anglev0=A5600)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={264,-43.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine58(
    R=0.020000,
    X=0.220000,
    G=0,
    B=0.020000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=0,
        origin={255,-53})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5620(
    nu=1,
    no=1,
    V_base=300,
    Vmag0=V5620,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5620))
    annotation (Placement(transformation(extent={{280,-104},{282,-84}})));
  Nordic44.Components_subsystems.Load Load_bus5620(
    S_p(re=0.001*729, im=0.001*175),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5620,
    anglev0=A5620)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={268,-93.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine59(
    R=0.000000,
    X=0.010000,
    G=0,
    B=0.000000) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={288,-71})));
  Nordic44.Components_subsystems.Gen2_bus_5600 G1_bus5600(
    Mbase=1650,
    Psch=P5600,
    Qsch=Q5600,
    Vmag0=V5600,
    Vang0=A5600)
    annotation (Placement(transformation(extent={{296,-38},{290,-44}})));
  Nordic44.Components_subsystems.Gen2_bus_5600 G2_bus5600(
    Mbase=1650,
    Psch=P5600,
    Qsch=Q5600,
    Vmag0=V5600,
    Vang0=A5600)
    annotation (Placement(transformation(extent={{296,-46},{290,-52}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5603(
    nu=2,
    no=2,
    V_base=300,
    Vmag0=V5603,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5603))
    annotation (Placement(transformation(extent={{220,-86},{222,-66}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5610(
    nu=1,
    no=1,
    V_base=300,
    Vmag0=V5610,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5610))
    annotation (Placement(transformation(extent={{242,-116},{244,-96}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine60(
    R=0.000000,
    X=0.010000,
    G=0,
    B=0.000000) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=270,
        origin={233,-91})));
  Nordic44.Components_subsystems.Load Load1_bus5610(
    S_p(re=0.001*988, im=0.001*363),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5610,
    anglev0=A5610)    annotation (Placement(transformation(
        extent={{6,-5.5},{-6,5.5}},
        rotation=180,
        origin={252,-105.5})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5602(
    no=1,
    V_base=420,
    Vmag0=V5602,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5602),
    nu=1)
    annotation (Placement(transformation(extent={{182,-86},{184,-66}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5500(
    no=4,
    V_base=300,
    nu=3,
    Vmag0=V5500,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5500))
          annotation (Placement(transformation(extent={{76,-90},{78,-58}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine61(
    R=0.050000,
    X=0.600000,
    G=0,
    B=0.050000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={114,-89})));
  Nordic44.Components_subsystems.Gen5_bus_5500 G1_bus5500(
    Mbase=1450,
    Psch=P5500,
    Qsch=Q5500,
    Vmag0=V5500,
    Vang0=A5500)
    annotation (Placement(transformation(extent={{96,-71},{90,-77}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine62(
    R=0.009000,
    X=0.940000,
    G=0,
    B=0.050000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={125,-63})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5401(
    no=1,
    nu=3,
    V_base=420,
    Vmag0=V5401,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5401))
    annotation (Placement(transformation(extent={{122,-44},{124,-24}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5501(
    nu=1,
    no=2,
    V_base=420,
    Vmag0=V5501,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5501))
    annotation (Placement(transformation(extent={{80,-26},{82,-6}})));
  Nordic44.Components_subsystems.Load Load1_bus5500(
    S_p(re=0.001*1050, im=0.001*200),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5500,
    anglev0=A5500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={62,-77.5})));
  Nordic44.Components_subsystems.Load Load2_bus5500(
    S_p(re=0.001*1050, im=0.001*200),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5500,
    anglev0=A5500)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={62,-85.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine63(
    R=0.017500,
    X=0.270000,
    G=0,
    B=0.080000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={106,-16})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5400(
    V_base=300,
    nu=3,
    no=4,
    Vmag0=V5400,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5400))
    annotation (Placement(transformation(extent={{180,-56},{182,-36}})));
  PowerSystems.Electrical.Buses.BusExt2 bus_5402(
    no=1,
    V_base=420,
    Vmag0=V5402,
    Vang0=Modelica.SIunits.Conversions.from_deg(A5402),
    nu=1) annotation (Placement(transformation(extent={{194,-18},{196,2}})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine64(
    R=0.006400,
    X=0.100000,
    G=0,
    B=0.028000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=180,
        origin={135,-10})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine65(
    R=0.016000,
    X=0.255000,
    G=0,
    B=0.090000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=90,
        origin={135,-50})));
  Nordic44.Components_subsystems.Gen5_bus_5400 G1_bus5400(
    Mbase=1225,
    Psch=P5400,
    Qsch=Q5400,
    Vmag0=V5400,
    Vang0=A5400)
    annotation (Placement(transformation(extent={{162,-60},{168,-54}})));
  Nordic44.Components_subsystems.Gen5_bus_5400 G2_bus5400(
    Mbase=1225,
    Psch=P5400,
    Qsch=Q5400,
    Vmag0=V5400,
    Vang0=A5400)
    annotation (Placement(transformation(extent={{202,-50},{196,-56}})));
  Nordic44.Components_subsystems.Load Load1_bus5400(
    S_p(re=0.001*1150, im=0.001*100),
    S_i(re=0, im=0),
    S_y(re=0, im=0),
    a(re=1, im=0),
    b(re=0, im=1),
    v0=V5400,
    anglev0=A5400)    annotation (Placement(transformation(
        extent={{-6,-5.5},{6,5.5}},
        rotation=180,
        origin={164,-47.5})));
  Nordic44.Components_subsystems.PwLine_2KTH
                                          pwLine66(
    R=0.000700,
    X=0.010000,
    G=0,
    B=0.003000*0.5) annotation (Placement(transformation(
        extent={{-5,-3},{5,3}},
        rotation=90,
        origin={188,3})));
  Nordic44.Components_subsystems.shunt shunt(G=0.02230, B=-0.97440)
    annotation (Placement(transformation(extent={{36,-6},{40,0}})));
  Nordic44.Components_subsystems.shunt shunt1(G=-0.02160, B=0.97440)
    annotation (Placement(transformation(extent={{46,-6},{50,0}})));
  Nordic44.Components_subsystems.shunt shunt2(G=0.00020, B=0.00010)
    annotation (Placement(transformation(extent={{128,6},{132,12}})));
  Nordic44.Components_subsystems.shunt shunt3(G=0.00020, B=-0.00010)
    annotation (Placement(transformation(extent={{140,6},{144,12}})));
  Nordic44.Components_subsystems.shunt shunt4(G=0.00020, B=0.00050)
    annotation (Placement(transformation(extent={{141,-20},{145,-14}})));
  Nordic44.Components_subsystems.shunt shunt5(G=-0.00020, B=-0.00050)
    annotation (Placement(transformation(extent={{126,-20},{130,-14}})));
  Nordic44.Components_subsystems.shunt shunt6(G=0.00030, B=0.00130)
    annotation (Placement(transformation(extent={{104,-98},{108,-92}})));
  Nordic44.Components_subsystems.shunt shunt7(G=-0.00030, B=-0.00130)
    annotation (Placement(transformation(extent={{120,-98},{124,-92}})));
  Nordic44.Components_subsystems.PwTransformer     twoWND(
    R=0.005,
    X=0.02,
    G=0,
    B=0,
    t1=1,
    t2=1,
    PrimaryOnFromSide=true)
                          annotation (Placement(transformation(
        extent={{11,12},{-11,-12}},
        rotation=0,
        origin={-191,-80})));
  Nordic44.Components_subsystems.PwTransformer     twoWND1(
    R=0.02,
    X=0.5,
    G=0,
    B=0,
    t2=1,
    PrimaryOnFromSide=false,
    t1=0.9936508)         annotation (Placement(transformation(
        extent={{11,10},{-11,-10}},
        rotation=180,
        origin={-139,-10})));
  Nordic44.Components_subsystems.PwTransformer     twoWND3(
    R=0.0008,
    X=0.0305,
    G=0,
    B=0,
    t2=1,
    PrimaryOnFromSide=false,
    t1=1.012699)               annotation (Placement(transformation(
        extent={{11,10},{-11,-10}},
        rotation=270,
        origin={30,-27})));
  Nordic44.Components_subsystems.PwTransformer     twoWND4(
    R=0.0016,
    X=0.061,
    G=0,
    B=0,
    t1=1,
    t2=1,
    PrimaryOnFromSide=true)   annotation (Placement(transformation(
        extent={{9,-8},{-9,8}},
        rotation=0,
        origin={221,90})));
  Nordic44.Components_subsystems.PwTransformer     twoWND5(
    R=0.0032,
    X=0.12,
    G=0,
    B=0,
    t1=1.00635,
    t2=1,
    PrimaryOnFromSide=true)  annotation (Placement(transformation(
        extent={{9,-8},{-9,8}},
        rotation=0,
        origin={151,-34})));
  Nordic44.Components_subsystems.PwTransformer     twoWND6(
    R=0.0004,
    X=0.015,
    G=0,
    B=0,
    t1=1,
    t2=1,
    PrimaryOnFromSide=true)   annotation (Placement(transformation(
        extent={{11,-9},{-11,9}},
        rotation=-90,
        origin={201,-27})));
  Nordic44.Components_subsystems.PwTransformer     twoWND7(
    R=0.0004,
    X=0.015,
    G=0,
    B=0,
    t1=1.0126,
    t2=1,
    PrimaryOnFromSide=true)   annotation (Placement(transformation(
        extent={{9,-8},{-9,8}},
        rotation=-90,
        origin={70,-41})));
  Nordic44.Components_subsystems.PwTransformer     twoWND8(
    R=0.0002,
    X=0.0076,
    G=0,
    B=0,
    t2=1,
    PrimaryOnFromSide=true,
    t1=1.005362)               annotation (Placement(transformation(
        extent={{12,-10},{-12,10}},
        rotation=0,
        origin={228,26})));
  Nordic44.Components_subsystems.PwTransformer     twoWND9(
    R=0.0008,
    X=0.0305,
    G=0,
    B=0,
    t2=1,
    PrimaryOnFromSide=false,
    t1=0.9428532)              annotation (Placement(transformation(
        extent={{-9,-8},{9,8}},
        rotation=0,
        origin={201,-68})));
  Nordic44.Components_subsystems.PwTransformer     twoWND10(
    R=0.0004,
    X=0.015,
    G=0,
    B=0,
    t1=1.00625,
    t2=1,
    PrimaryOnFromSide=true)   annotation (Placement(transformation(
        extent={{12,-11},{-12,11}},
        rotation=0,
        origin={208,15})));
  Nordic44.Components_subsystems.PwTransformer     twoWND11(
    R=0.005,
    X=0.02,
    G=0,
    B=0,
    t1=1.0125,
    t2=1,
    PrimaryOnFromSide=true) annotation (Placement(transformation(
        extent={{-11,10},{11,-10}},
        rotation=180,
        origin={-119,-84})));
  Nordic44.Components_subsystems.PwTransformer     eqImpedance(
    R=0.005,
    X=0.02,
    G=0,
    B=0,
    t1=0.9998,
    t2=1,
    PrimaryOnFromSide=true)
    annotation (Placement(transformation(extent={{-122,130},{-102,150}})));
equation
  connect(G9_bus7000.pwPin, bus_7000.o[1]) annotation (Line(
      points={{-285.7,-143},{-274.075,-143},{-274.075,-92.25},{-272,-92.25}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G8_bus7000.pwPin, bus_7000.o[2]) annotation (Line(
      points={{-285.7,-135},{-275.075,-135},{-275.075,-89.55},{-272,-89.55}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G7_bus7000.pwPin, bus_7000.o[3]) annotation (Line(
      points={{-285.7,-127},{-276.075,-127},{-276.075,-86.85},{-272,-86.85}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G6_bus7000.pwPin, bus_7000.o[4]) annotation (Line(
      points={{-285.7,-119},{-277.075,-119},{-277.075,-84.15},{-272,-84.15}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G5_bus7000.pwPin, bus_7000.o[5]) annotation (Line(
      points={{-285.7,-111},{-278.075,-111},{-278.075,-81.45},{-272,-81.45}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G4_bus7000.pwPin, bus_7000.o[6]) annotation (Line(
      points={{-285.7,-103},{-279.075,-103},{-279.075,-78.75},{-272,-78.75}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G3_bus7000.pwPin, bus_7000.o[7]) annotation (Line(
      points={{-285.7,-95},{-280.075,-95},{-280.075,-76.05},{-272,-76.05}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G2_bus7000.pwPin, bus_7000.o[8]) annotation (Line(
      points={{-285.7,-87},{-281.075,-87},{-281.075,-73.35},{-272,-73.35}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G1_bus7000.pwPin, bus_7000.o[9]) annotation (Line(
      points={{-285.7,-79},{-281.075,-79},{-281.075,-70.65},{-272,-70.65}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load5_bus7000.p, bus_7000.o[10]) annotation (Line(
      points={{-285.8,-70.6},{-283.9,-70.6},{-283.9,-67.95},{-272,-67.95}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load4_bus7000.p, bus_7000.o[11]) annotation (Line(
      points={{-285.8,-62.6},{-282.9,-62.6},{-282.9,-65.25},{-272,-65.25}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load3_bus7000.p, bus_7000.o[12]) annotation (Line(
      points={{-285.8,-54.6},{-281.9,-54.6},{-281.9,-62.55},{-272,-62.55}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load2_bus7000.p, bus_7000.o[13]) annotation (Line(
      points={{-285.8,-46.6},{-280.9,-46.6},{-280.9,-59.85},{-272,-59.85}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load1_bus7000.p, bus_7000.o[14]) annotation (Line(
      points={{-285.8,-38.6},{-279.9,-38.6},{-279.9,-57.15},{-272,-57.15}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load1_bus7020.p, bus_7020.o[1]) annotation (Line(
      points={{-285.8,-14.05},{-283.9,-14.05},{-283.9,-15},{-282,-15}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus7010.p, bus_7010.o[1]) annotation (Line(
      points={{-285.8,5.95},{-283.9,5.95},{-283.9,5},{-282,5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_7010.u[1], pwLine.p) annotation (Line(
      points={{-280,5},{-278,5},{-278,2.5},{-275,2.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_7020.u[1], pwLine1.p) annotation (Line(
      points={{-280,-15},{-278,-15},{-278,-25.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, bus_7000.o[15]) annotation (Line(
      points={{-278,-32.5},{-278,-54.25},{-272,-54.25},{-272,-54.45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine.n, bus_7000.o[16]) annotation (Line(
      points={{-275,-4.5},{-275,-26},{-274,-26},{-274,-52},{-272,-52},{-272,
          -51.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.n, bus_7000.u[1]) annotation (Line(
      points={{-254,-72.5},{-254,-87.25},{-270,-87.25},{-270,-86.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, bus_7000.u[2]) annotation (Line(
      points={{-257,-60.5},{-257.5,-60.5},{-257.5,-72},{-270,-72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.n, bus_7000.u[3]) annotation (Line(
      points={{-260,-50.5},{-260,-54},{-262,-54},{-262,-58},{-270,-58},{-270,
          -57.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.p, bus_7100.o[1]) annotation (Line(
      points={{-254,-65.5},{-254,-42.975},{-252,-42.975}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine3.p, bus_7100.o[2]) annotation (Line(
      points={{-257,-53.5},{-257,-40.125},{-252,-40.125}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine2.p, bus_7100.o[3]) annotation (Line(
      points={{-260,-43.5},{-260,-37.275},{-252,-37.275}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load2_bus7100.p, bus_7100.o[4]) annotation (Line(
      points={{-259.8,-34.6},{-254.9,-34.6},{-254.9,-34.425},{-252,-34.425}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load1_bus7100.p, bus_7100.o[5]) annotation (Line(
      points={{-259.8,-28.6},{-257.9,-28.6},{-257.9,-31.575},{-252,-31.575}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(bus_7100.u[1], pwLine11.n) annotation (Line(
      points={{-250,-38.7},{-244,-38.7},{-244,-45},{-234.5,-45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load3_bus3000.p, bus_3000.o[1]) annotation (Line(
      points={{-271.8,27.95},{-264,27.95},{-264,50.8571},{-258,50.8571}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load2_bus3000.p, bus_3000.o[2]) annotation (Line(
      points={{-271.8,35.95},{-266,35.95},{-266,52.5714},{-258,52.5714}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load1_bus3000.p, bus_3000.o[3]) annotation (Line(
      points={{-271.8,43.95},{-268,43.95},{-268,54.2857},{-258,54.2857}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G3_bus3000.pwPin, bus_3000.o[4]) annotation (Line(
      points={{-273.7,51},{-270,51},{-270,56},{-258,56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus3000.pwPin, bus_3000.o[5]) annotation (Line(
      points={{-273.7,59},{-273.7,57.7143},{-258,57.7143}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus3000.pwPin, bus_3000.o[6]) annotation (Line(
      points={{-273.7,67},{-265.075,67},{-265.075,59.4286},{-258,59.4286}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine12.n, bus_3000.o[7]) annotation (Line(
      points={{-265.5,79},{-262,79},{-262,61.1429},{-258,61.1429}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine6.p, bus_3000.u[1]) annotation (Line(
      points={{-242.5,29},{-254,29},{-254,51.2},{-256,51.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine16.p, bus_3000.u[2]) annotation (Line(
      points={{-252,18.5},{-252,53.6},{-256,53.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine15.p, bus_3000.u[3]) annotation (Line(
      points={{-237.5,56},{-256,56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine14.n, bus_3000.u[4]) annotation (Line(
      points={{-249,61.5},{-252.5,61.5},{-252.5,58.4},{-256,58.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine13.n, bus_3000.u[5]) annotation (Line(
      points={{-249,71.5},{-254,71.5},{-254,60.8},{-256,60.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus3020.p, bus_3020.o[1]) annotation (Line(
      points={{-287.8,79.95},{-283.9,79.95},{-283.9,80},{-282,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine14.p, bus_3300.o[1]) annotation (Line(
      points={{-249,68.5},{-222,68.5},{-222,93.2},{-220,93.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine13.p, bus_3300.o[2]) annotation (Line(
      points={{-249,78.5},{-224,78.5},{-224,95.6},{-220,95.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus3300.pwPin, bus_3300.o[3]) annotation (Line(
      points={{-229.7,92},{-225,92},{-225,98},{-220,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load2_bus3300.p, bus_3300.o[4]) annotation (Line(
      points={{-229.8,98.95},{-228,98.95},{-228,100.4},{-220,100.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus3300.p, bus_3300.o[5]) annotation (Line(
      points={{-229.8,105.95},{-228,105.95},{-228,102.8},{-220,102.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G3_bus3300.pwPin, bus_3300.u[1]) annotation (Line(
      points={{-208.3,89},{-212.94,89},{-212.94,93.2},{-218,93.2}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G2_bus3300.pwPin, bus_3300.u[2]) annotation (Line(
      points={{-208.3,97},{-212.94,97},{-212.94,95.6},{-218,95.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine17.p, bus_3300.u[3]) annotation (Line(
      points={{-200.5,103},{-209.25,103},{-209.25,98},{-218,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine20.p, bus_3200.o[1]) annotation (Line(
      points={{-181,80.5},{-181,86.25},{-178,86.25},{-178,93.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine19.p, bus_3200.o[2]) annotation (Line(
      points={{-187,80.5},{-187,86},{-182,86},{-182,95.6},{-178,95.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine18.p, bus_3200.o[3]) annotation (Line(
      points={{-193,80.5},{-193,90},{-184,90},{-184,98},{-178,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine17.n, bus_3200.o[4]) annotation (Line(
      points={{-193.5,103},{-185.75,103},{-185.75,100.4},{-178,100.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine22.n, bus_3300.u[4]) annotation (Line(
      points={{-207,115.5},{-207,108},{-211,108},{-211,100.4},{-218,100.4}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine21.n, bus_3300.u[5]) annotation (Line(
      points={{-211,115.5},{-211,110},{-214,110},{-214,102.8},{-218,102.8}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine22.p, bus_8500.o[1]) annotation (Line(
      points={{-207,122.5},{-207,126},{-202,126},{-202,133.975},{-198,
          133.975}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine21.p, bus_8500.o[2]) annotation (Line(
      points={{-211,122.5},{-211,128},{-204,128},{-204,137.125},{-198,
          137.125}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G2_bus8500.pwPin, bus_8500.o[3]) annotation (Line(
      points={{-211.7,133},{-206,133},{-206,140.275},{-198,140.275}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus8500.pwPin, bus_8500.o[4]) annotation (Line(
      points={{-211.7,141},{-208,141},{-208,143.425},{-198,143.425}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load3_bus8500.p, bus_8500.o[5]) annotation (Line(
      points={{-211.8,147.95},{-208,147.95},{-208,146.575},{-198,146.575}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load2_bus8500.p, bus_8500.o[6]) annotation (Line(
      points={{-211.8,153.95},{-210,153.95},{-210,149.725},{-198,149.725}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load1_bus8500.p, bus_8500.o[7]) annotation (Line(
      points={{-211.8,159.95},{-206,159.95},{-206,152.875},{-198,152.875}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine23.n, bus_8500.o[8]) annotation (Line(
      points={{-211.5,167},{-204,167},{-204,156.025},{-198,156.025}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine25.p, bus_8500.u[1]) annotation (Line(
      points={{-189,124.5},{-189,126},{-194,126},{-194,133.975},{-196,
          133.975}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine27.p, bus_8500.u[2]) annotation (Line(
      points={{-164.5,129},{-192,129},{-192,137.125},{-196,137.125}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine26.p, bus_8500.u[3]) annotation (Line(
      points={{-164.5,133},{-190,133},{-190,140.275},{-196,140.275}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G6_bus8500.pwPin, bus_8500.u[4]) annotation (Line(
      points={{-184.3,139},{-188,139},{-188,143.425},{-196,143.425}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G5_bus8500.pwPin, bus_8500.u[5]) annotation (Line(
      points={{-184.3,147},{-186,147},{-186,146.575},{-196,146.575}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G4_bus8500.pwPin, bus_8500.u[6]) annotation (Line(
      points={{-184.3,155},{-186,155},{-186,149.725},{-196,149.725}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G3_bus8500.pwPin, bus_8500.u[7]) annotation (Line(
      points={{-182.3,163},{-188,163},{-188,152.875},{-196,152.875}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine23.p, bus_8700.u[1]) annotation (Line(
      points={{-218.5,167},{-227.25,167},{-227.25,166},{-236,166}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus8700.p, bus_8700.o[1]) annotation (Line(
      points={{-241.8,165.95},{-241.9,165.95},{-241.9,166},{-238,166}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine24.n, bus_8500.u[8]) annotation (Line(
      points={{-182.5,169},{-190,169},{-190,156.025},{-196,156.025}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine24.p, bus_8600.o[1]) annotation (Line(
      points={{-175.5,169},{-168.75,169},{-168.75,166},{-162,166}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus8600.p, bus_8600.u[1]) annotation (Line(
      points={{-154.2,165.95},{-157.1,165.95},{-157.1,166},{-160,166}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine25.n, bus_3200.o[5]) annotation (Line(
      points={{-189,117.5},{-189,106},{-180,106},{-180,102.8},{-178,102.8}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine28.p, bus_3200.u[1]) annotation (Line(
      points={{-156.5,99},{-166.25,99},{-166.25,98},{-176,98}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_3100.u[1], pwLine30.p) annotation (Line(
      points={{-176,43},{-163,43},{-163,51},{-158.5,51}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_3100.u[2], pwLine29.p) annotation (Line(
      points={{-176,49},{-168,49},{-168,57},{-158.5,57}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine30.n, bus_3359.o[1]) annotation (Line(
      points={{-151.5,51},{-128,51},{-128,67.5333},{-124,67.5333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine29.n, bus_3359.o[2]) annotation (Line(
      points={{-151.5,57},{-132,57},{-132,71.4},{-124,71.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load4_bus3359.p, bus_3359.o[3]) annotation (Line(
      points={{-141.8,71.95},{-133.9,71.95},{-133.9,75.2667},{-124,75.2667}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load3_bus3359.p, bus_3359.o[4]) annotation (Line(
      points={{-141.8,77.95},{-129.9,77.95},{-129.9,79.1333},{-124,79.1333}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load2_bus3359.p, bus_3359.o[5]) annotation (Line(
      points={{-141.8,83.95},{-130.9,83.95},{-130.9,83},{-124,83}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus3359.p, bus_3359.o[6]) annotation (Line(
      points={{-141.8,90.95},{-129.9,90.95},{-129.9,86.8667},{-124,86.8667}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine28.n, bus_3359.o[7]) annotation (Line(
      points={{-149.5,99},{-129,99},{-129,92},{-125,92},{-125,90.7333},{
          -124,90.7333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine27.n, bus_3359.o[8]) annotation (Line(
      points={{-157.5,129},{-137,129},{-137,106},{-127,106},{-127,94.6},{-124,
          94.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine26.n, bus_3359.o[9]) annotation (Line(
      points={{-157.5,133},{-127,133},{-127,108},{-125,108},{-125,98.4667},
          {-124,98.4667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus3360.p, bus_3360.u[1]) annotation (Line(
      points={{-84.2,139.95},{-89.1,139.95},{-89.1,140},{-94,140}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine31.p, bus_3100.o[1]) annotation (Line(
      points={{-189,18.5},{-189,38},{-182,38},{-182,41},{-178,41}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine7.p, bus_3100.o[2]) annotation (Line(
      points={{-202.5,34},{-196,34},{-196,40},{-184,40},{-184,43},{-178,43}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load_bus3100.p, bus_3100.o[3]) annotation (Line(
      points={{-195.8,49.95},{-186.9,49.95},{-186.9,45},{-178,45}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine18.n, bus_3100.o[4]) annotation (Line(
      points={{-193,73.5},{-193,52},{-184,52},{-184,47},{-178,47}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine19.n, bus_3100.o[5]) annotation (Line(
      points={{-187,73.5},{-187,58},{-182,58},{-182,48},{-180,48},{-180,49},
          {-178,49}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine20.n, bus_3100.o[6]) annotation (Line(
      points={{-181,73.5},{-181,62},{-180,62},{-180,50},{-178,50},{-178,51}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine9.n, bus_6701.o[1]) annotation (Line(
      points={{-204,-39.5},{-204,-60},{-172,-60},{-172,-84},{-146,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_3701.u[1], pwLine32.n) annotation (Line(
      points={{-116,-60},{-108,-60},{-108,-69},{-98.5,-69}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_3244.u[1], pwLine33.n) annotation (Line(
      points={{-176,-96},{-160,-96},{-160,-111},{-114.5,-111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_6700.u[1], pwLine35.n) annotation (Line(
      points={{-76,-88},{-70,-88},{-70,-91},{-54.5,-91}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine34.n, bus_6700.u[2]) annotation (Line(
      points={{-54.5,-85},{-70.25,-85},{-70.25,-84},{-76,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine33.p, bus_6500.o[1]) annotation (Line(
      points={{-107.5,-111},{-46,-111},{-46,-119},{-24,-119},{-24,-111},{-20,
          -111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load3_bus6500.p, bus_6500.o[2]) annotation (Line(
      points={{-31.8,-114.05},{-25.9,-114.05},{-25.9,-106.6},{-20,-106.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load2_bus6500.p, bus_6500.o[3]) annotation (Line(
      points={{-31.8,-106.05},{-25.9,-106.05},{-25.9,-102.2},{-20,-102.2}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load1_bus6500.p, bus_6500.o[4]) annotation (Line(
      points={{-31.8,-98.05},{-25.9,-98.05},{-25.9,-97.8},{-20,-97.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine35.p, bus_6500.o[5]) annotation (Line(
      points={{-47.5,-91},{-38.75,-91},{-38.75,-93.4},{-20,-93.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine34.p, bus_6500.o[6]) annotation (Line(
      points={{-47.5,-85},{-38.75,-85},{-38.75,-89},{-20,-89}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(bus_5100.u[1], pwLine37.n) annotation (Line(
      points={{24,-67},{32,-67},{32,-65},{37.5,-65}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine38.n, bus_3359.u[1]) annotation (Line(
      points={{-68.5,11},{-118,11},{-118,67.5333},{-122,67.5333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine39.n, bus_3359.u[2]) annotation (Line(
      points={{-68.5,17},{-114,17},{-114,71.4},{-122,71.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G6_bus3359.pwPin, bus_3359.u[3]) annotation (Line(
      points={{-98.3,67},{-111.94,67},{-111.94,75.2667},{-122,75.2667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G5_bus3359.pwPin, bus_3359.u[4]) annotation (Line(
      points={{-98.3,75},{-109.94,75},{-109.94,79.1333},{-122,79.1333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G4_bus3359.pwPin, bus_3359.u[5]) annotation (Line(
      points={{-98.3,83},{-110.15,83},{-110.15,83},{-122,83}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G3_bus3359.pwPin, bus_3359.u[6]) annotation (Line(
      points={{-98.3,91},{-110.94,91},{-110.94,86.8667},{-122,86.8667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus3359.pwPin, bus_3359.u[7]) annotation (Line(
      points={{-98.3,99},{-111.94,99},{-111.94,90.7333},{-122,90.7333}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus3359.pwPin, bus_3359.u[8]) annotation (Line(
      points={{-98.3,107},{-112.94,107},{-112.94,94.6},{-122,94.6}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine38.p, bus_5101.o[1]) annotation (Line(
      points={{-61.5,11},{15.25,11},{15.25,4},{22,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine39.p, bus_5101.o[2]) annotation (Line(
      points={{-61.5,17},{15.25,17},{15.25,8},{22,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5101.u[1], pwLine42.n) annotation (Line(
      points={{24,4},{32,4},{32,3},{39.5,3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5101.u[2], pwLine41.n) annotation (Line(
      points={{24,8},{32,8},{32,9},{39.5,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5101.u[3], pwLine40.n) annotation (Line(
      points={{24,12},{32,12},{32,15},{39.5,15}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine40.p, bus_5103.o[1]) annotation (Line(
      points={{46.5,15},{63.25,15},{63.25,48},{80,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine45.n, bus_5103.u[1]) annotation (Line(
      points={{93.5,41},{87.75,41},{87.75,44},{82,44}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine43.n, bus_5103.u[2]) annotation (Line(
      points={{93.5,47},{87.75,47},{87.75,48},{82,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine44.n, bus_5103.u[3]) annotation (Line(
      points={{93.5,53},{87.75,53},{87.75,52},{82,52}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine46.p, bus_5304.o[1]) annotation (Line(
      points={{116,52.5},{116,76},{122,76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine43.p, bus_5304.o[2]) annotation (Line(
      points={{100.5,47},{108,47},{108,80},{122,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine44.p, bus_5304.o[3]) annotation (Line(
      points={{100.5,53},{104,53},{104,84},{122,84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine41.p, bus_5102.o[1]) annotation (Line(
      points={{46.5,9},{84.25,9},{84.25,10},{122,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5102.o[2], pwLine45.p) annotation (Line(
      points={{122,14},{112,14},{112,24},{104,24},{104,41},{100.5,41}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine46.n, bus_5102.o[3]) annotation (Line(
      points={{116,45.5},{116,18},{122,18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5102.u[1], pwLine47.n) annotation (Line(
      points={{124,14},{132.5,14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine50.n, bus_5304.u[1]) annotation (Line(
      points={{155.5,75},{139.75,75},{139.75,76},{124,76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine49.n, bus_5304.u[2]) annotation (Line(
      points={{141,93.5},{141,80},{124,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine48.n, bus_5304.u[3]) annotation (Line(
      points={{135,93.5},{135,84},{124,84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine49.p, bus_5305.o[1]) annotation (Line(
      points={{141,100.5},{141,117},{162,117}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine48.p, bus_5305.o[2]) annotation (Line(
      points={{135,100.5},{135,123},{162,123}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5305.u[1], pwLine51.p) annotation (Line(
      points={{164,120},{183,120},{183,100.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine52.p, bus_5301.o[1]) annotation (Line(
      points={{172,56.5},{172,64},{186,64},{186,76},{200,76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine50.p, bus_5301.o[2]) annotation (Line(
      points={{162.5,75},{181.25,75},{181.25,80},{200,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine51.n, bus_5301.o[3]) annotation (Line(
      points={{183,93.5},{183,84},{200,84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine53.p, bus_5300.u[1]) annotation (Line(
      points={{255.5,75},{248.75,75},{248.75,77},{242,77}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine54.p, bus_6100.o[1]) annotation (Line(
      points={{254,34.5},{254,40},{278,40},{278,43.2},{280,43.2}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine58.n, bus_5600.o[1]) annotation (Line(
      points={{258.5,-53},{272,-53},{272,-48.5},{280,-48.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load2_bus5600.p, bus_5600.o[2]) annotation (Line(
      points={{268.2,-44.05},{272.1,-44.05},{272.1,-45.5},{280,-45.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus5600.p, bus_5600.o[3]) annotation (Line(
      points={{268.2,-36.05},{272.1,-36.05},{272.1,-42.5},{280,-42.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine57.n, bus_5600.o[4]) annotation (Line(
      points={{268.5,-1},{274,-1},{274,-39.5},{280,-39.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5601.u[1], pwLine56.p) annotation (Line(
      points={{282,8},{289,8},{289,-11.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5620.u[1], pwLine59.n) annotation (Line(
      points={{282,-94},{288,-94},{288,-74.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine60.n, bus_5610.o[1]) annotation (Line(
      points={{233,-94.5},{233,-106},{242,-106}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5603.u[1], pwLine60.p) annotation (Line(
      points={{222,-79},{233,-79},{233,-87.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5610.u[1], Load1_bus5610.p) annotation (Line(
      points={{244,-106},{245.9,-106},{245.9,-106.05},{247.8,-106.05}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine61.p, bus_5603.o[1]) annotation (Line(
      points={{117.5,-89},{168,-89},{168,-100},{196,-100},{196,-79},{220,
          -79}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(Load2_bus5500.p, bus_5500.o[1]) annotation (Line(
      points={{66.2,-86.05},{71.1,-86.05},{71.1,-81.2},{76,-81.2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus5500.p, bus_5500.o[2]) annotation (Line(
      points={{66.2,-78.05},{70.1,-78.05},{70.1,-76.4},{76,-76.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine37.p, bus_5500.o[3]) annotation (Line(
      points={{44.5,-65},{60.25,-65},{60.25,-71.6},{76,-71.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine42.p, bus_5501.o[1]) annotation (Line(
      points={{46.5,3},{72,3},{72,-19},{80,-19}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5501.u[1], pwLine63.n) annotation (Line(
      points={{82,-16},{102.5,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine63.p, bus_5401.o[1]) annotation (Line(
      points={{109.5,-16},{111.25,-16},{111.25,-34},{122,-34}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine64.p, bus_6001.o[1]) annotation (Line(
      points={{138.5,-10},{138.5,2},{150,2},{150,18},{182,18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine65.n, bus_5401.u[1]) annotation (Line(
      points={{135,-46.5},{135,-38},{124,-38}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine65.p, bus_5602.o[1]) annotation (Line(
      points={{135,-53.5},{135,-76},{182,-76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine66.p, bus_5402.o[1]) annotation (Line(
      points={{188,-0.5},{188,-8},{194,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine47.p, bus_6001.o[2]) annotation (Line(
      points={{139.5,14},{146,14},{146,22},{182,22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_6001.o[3], pwLine52.n) annotation (Line(
      points={{182,26},{172,26},{172,49.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine57.p, bus_6000.u[1]) annotation (Line(
      points={{261.5,-1},{242,-1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_6000.u[2], pwLine54.n) annotation (Line(
      points={{242,5},{254,5},{254,27.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine42.n, shunt.p) annotation (Line(
      points={{39.5,3},{39.5,1.5},{37.92,1.5},{37.92,-0.72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine42.p, shunt1.p) annotation (Line(
      points={{46.5,3},{46.5,0.5},{47.92,0.5},{47.92,-0.72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine47.n, shunt2.p) annotation (Line(
      points={{132.5,14},{133,14},{133,11.28},{129.92,11.28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine47.p, shunt3.p) annotation (Line(
      points={{139.5,14},{139,14},{139,11.28},{141.92,11.28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt5.p, pwLine64.n) annotation (Line(
      points={{127.92,-14.72},{127.92,-10},{131.5,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine64.p, shunt4.p) annotation (Line(
      points={{138.5,-10},{142.92,-10},{142.92,-14.72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt6.p, pwLine61.n) annotation (Line(
      points={{105.92,-92.72},{110.5,-92.72},{110.5,-89}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine61.p, shunt7.p) annotation (Line(
      points={{117.5,-89},{117.5,-92.72},{121.92,-92.72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine58.p, bus_5603.u[2]) annotation (Line(
      points={{251.5,-53},{241.75,-53},{241.75,-73},{222,-73}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G3_bus7100.p, bus_7100.o[6]) annotation (Line(
      points={{-259.7,-23},{-257,-23},{-257,-28.725},{-252,-28.725}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus7100.p, bus_7100.o[7]) annotation (Line(
      points={{-259.7,-17},{-255,-17},{-255,-25.875},{-252,-25.875}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus7100.p, bus_7100.o[8]) annotation (Line(
      points={{-259.7,-11},{-254,-11},{-254,-24},{-252,-24},{-252,-23.025}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G7_bus3249.p, bus_3249.u[1]) annotation (Line(
      points={{-164.3,-37},{-169.15,-37},{-169.15,-36.92},{-174,-36.92}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G6_bus3249.p, bus_3249.u[2]) annotation (Line(
      points={{-164.3,-29},{-169.15,-29},{-169.15,-29.96},{-174,-29.96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G5_bus3249.p, bus_3249.u[3]) annotation (Line(
      points={{-164.3,-23},{-169.15,-23},{-169.15,-23},{-174,-23}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G4_bus3249.p, bus_3249.u[4]) annotation (Line(
      points={{-164.3,-15},{-169.15,-15},{-169.15,-16.04},{-174,-16.04}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus6700.p, bus_6700.o[1]) annotation (Line(
      points={{-91.7,-95},{-82,-95},{-82,-88.5},{-78,-88.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus6700.p, bus_6700.o[2]) annotation (Line(
      points={{-91.8,-76.05},{-84,-76.05},{-84,-85.5},{-78,-85.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine32.p, bus_6700.o[3]) annotation (Line(
      points={{-91.5,-69},{-82,-69},{-82,-82.5},{-78,-82.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus6700.p, bus_6700.u[3]) annotation (Line(
      points={{-64.3,-77},{-70.15,-77},{-70.15,-80},{-76,-80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_5401.u[2], pwLine64.n) annotation (Line(
      points={{124,-34},{132,-34},{132,-28},{131.5,-28},{131.5,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus5400.p, bus_5400.u[1]) annotation (Line(
      points={{195.7,-53},{188.85,-53},{188.85,-50},{182,-50}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine55.n, bus_5400.u[2]) annotation (Line(
      points={{218.5,-23},{206,-23},{206,-46},{182,-46}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus5300.p, bus_5300.u[2]) annotation (Line(
      points={{255.7,85},{248.85,85},{248.85,83},{242,83}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus6100.p, bus_6100.o[2]) annotation (Line(
      points={{268.3,45},{276,45},{276,45.6},{280,45.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load2_bus6100.p, bus_6100.o[3]) annotation (Line(
      points={{268.2,51.95},{271.1,51.95},{271.1,48},{280,48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus6100.p, bus_6100.o[4]) annotation (Line(
      points={{268.2,59.95},{274,59.95},{274,50.4},{280,50.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine53.n, bus_6100.o[5]) annotation (Line(
      points={{262.5,75},{276,75},{276,52.8},{280,52.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G5_bus6100.p, bus_6100.u[1]) annotation (Line(
      points={{289.7,37},{286,37},{286,43.5},{282,43.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G4_bus6100.p, bus_6100.u[2]) annotation (Line(
      points={{289.7,45},{287.85,45},{287.85,46.5},{282,46.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G3_bus6100.p, bus_6100.u[3]) annotation (Line(
      points={{289.7,53},{287.85,53},{287.85,49.5},{282,49.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus6100.p, bus_6100.u[4]) annotation (Line(
      points={{289.7,61},{286,61},{286,52.5},{282,52.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus5620.p, bus_5620.o[1]) annotation (Line(
      points={{272.2,-94.05},{271.9,-94.05},{271.9,-94},{280,-94}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine5.n, bus_3115.o[1]) annotation (Line(
      points={{-235.5,-26},{-233.75,-26},{-233.75,-6.5},{-228,-6.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus3115.p, bus_3115.o[2]) annotation (Line(
      points={{-235.8,-4.05},{-231.9,-4.05},{-231.9,-1.1},{-228,-1.1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G3_bus3115.p, bus_3115.o[3]) annotation (Line(
      points={{-235.7,3},{-231.85,3},{-231.85,4.3},{-228,4.3}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus3115.p, bus_3115.o[4]) annotation (Line(
      points={{-235.7,11},{-228,11},{-228,9.7}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus3115.p, bus_3115.o[5]) annotation (Line(
      points={{-235.7,17},{-228,17},{-228,15.1}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(pwLine6.n, bus_3115.o[6]) annotation (Line(
      points={{-235.5,29},{-233.5,29},{-233.5,20.5},{-228,20.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine5.p, bus_7100.u[2]) annotation (Line(
      points={{-242.5,-26},{-242.5,-26.5},{-250,-26.5},{-250,-27.3}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G4_bus6500.p, bus_6500.u[1]) annotation (Line(
      points={{-4.3,-117},{-12,-117},{-12,-110.56},{-18,-110.56}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G3_bus6500.p, bus_6500.u[2]) annotation (Line(
      points={{-4.3,-109},{-11.15,-109},{-11.15,-105.28},{-18,-105.28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus6500.p, bus_6500.u[3]) annotation (Line(
      points={{-4.3,-101},{-11.15,-101},{-11.15,-100},{-18,-100}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus6500.p, bus_6500.u[4]) annotation (Line(
      points={{-4.3,-93},{-11.15,-93},{-11.15,-94.72},{-18,-94.72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine36.n, bus_6500.u[5]) annotation (Line(
      points={{-0.5,-79},{-6,-79},{-6,-89.44},{-18,-89.44}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine10.p, bus_3115.u[1]) annotation (Line(
      points={{-212,-15.5},{-220,-15.5},{-220,-5.15},{-226,-5.15}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine9.p, bus_3115.u[2]) annotation (Line(
      points={{-204,-32.5},{-204.5,-32.5},{-204.5,2.95},{-226,2.95}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine8.n, bus_3115.u[3]) annotation (Line(
      points={{-210.5,11},{-218.25,11},{-218.25,11.05},{-226,11.05}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine7.n, bus_3115.u[4]) annotation (Line(
      points={{-209.5,34},{-209.5,19.15},{-226,19.15}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine55.p, bus_6000.o[1]) annotation (Line(
      points={{225.5,-23},{236,-23},{236,-2},{240,-2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus6000.p, bus_6000.o[2]) annotation (Line(
      points={{227.4,2},{233.7,2},{233.7,2},{240,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine36.p, bus_5100.o[1]) annotation (Line(
      points={{6.5,-79},{16,-79},{16,-68},{22,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus5100.p, bus_5100.o[2]) annotation (Line(
      points={{8.3,-65},{15.15,-65},{15.15,-64},{22,-64}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus5100.p, bus_5100.o[3]) annotation (Line(
      points={{8.2,-56.05},{16,-56.05},{16,-60},{22,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine12.p, bus_3020.u[1]) annotation (Line(
      points={{-272.5,79},{-276.25,79},{-276.25,80},{-280,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine62.p, bus_5400.o[1]) annotation (Line(
      points={{128.5,-63},{176,-63},{176,-50.5},{180,-50.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus5400.p, bus_5400.o[2]) annotation (Line(
      points={{168.3,-57},{174,-57},{174,-47.5},{180,-47.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load1_bus5400.p, bus_5400.o[3]) annotation (Line(
      points={{168.2,-48.05},{171.1,-48.05},{171.1,-44.5},{180,-44.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus5300.p, bus_5300.o[1]) annotation (Line(
      points={{226.3,67},{234,67},{234,76},{240,76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus5300.p, bus_5300.o[2]) annotation (Line(
      points={{224.2,79.95},{232.1,79.95},{232.1,80},{240,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine11.p, bus_3249.o[1]) annotation (Line(
      points={{-227.5,-45},{-184,-45},{-184,-37.9143},{-176,-37.9143}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G3_bus3249.p, bus_3249.o[2]) annotation (Line(
      points={{-191.7,-33},{-183.85,-33},{-183.85,-32.9429},{-176,-32.9429}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G2_bus3249.p, bus_3249.o[3]) annotation (Line(
      points={{-191.7,-25},{-183.85,-25},{-183.85,-27.9714},{-176,-27.9714}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(G1_bus3249.p, bus_3249.o[4]) annotation (Line(
      points={{-191.7,-17},{-183.85,-17},{-183.85,-23},{-176,-23}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Load_bus3249.p, bus_3249.o[5]) annotation (Line(
      points={{-191.8,-8.05},{-183.9,-8.05},{-183.9,-18.0286},{-176,
          -18.0286}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine8.p, bus_3249.o[6]) annotation (Line(
      points={{-203.5,11},{-194,11},{-194,-4},{-182,-4},{-182,-13.0571},{
          -176,-13.0571}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine31.n, bus_3249.o[7]) annotation (Line(
      points={{-189,11.5},{-189,0},{-180,0},{-180,-8.08571},{-176,-8.08571}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine16.n, bus_3245.o[1]) annotation (Line(
      points={{-252,11.5},{-252,-8},{-242,-8},{-242,-22},{-230,-22},{-230,-40},
          {-218,-40},{-218,-76},{-208,-76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine15.n, bus_3245.o[2]) annotation (Line(
      points={{-230.5,56},{-218,56},{-218,-34},{-214,-34},{-214,-72},{-208,
          -72}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine10.n, bus_3245.o[3]) annotation (Line(
      points={{-212,-22.5},{-212,-30},{-210,-30},{-210,-68},{-208,-68}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine59.p, bus_5600.u[1]) annotation (Line(
      points={{288,-67.5},{288,-56},{285,-56},{285,-48.5},{282,-48.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G2_bus5600.p, bus_5600.u[2]) annotation (Line(
      points={{289.7,-49},{285.85,-49},{285.85,-45.5},{282,-45.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus5600.p, bus_5600.u[3]) annotation (Line(
      points={{289.7,-41},{285.85,-41},{285.85,-42.5},{282,-42.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine56.n, bus_5600.u[4]) annotation (Line(
      points={{289,-18.5},{289,-38},{284,-38},{284,-39.5},{282,-39.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine61.n, bus_5500.u[1]) annotation (Line(
      points={{110.5,-89},{86,-89},{86,-80.4},{78,-80.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus5500.p, bus_5500.u[2]) annotation (Line(
      points={{89.7,-74},{78,-74}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine62.n, bus_5500.u[3]) annotation (Line(
      points={{121.5,-63},{88,-63},{88,-67.6},{78,-67.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G1_bus3245.p, bus_3245.u[1]) annotation (Line(
      points={{-200.3,-65},{-202,-65},{-202,-75},{-206,-75}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(pwLine66.n, bus_6001.u[1]) annotation (Line(
      points={{188,6.5},{188,18},{184,18}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND.From, bus_3244.o[1]) annotation (Line(
      points={{-183.3,-80},{-180,-80},{-180,-96},{-178,-96}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND.To, bus_3245.u[2]) annotation (Line(
      points={{-198.7,-80},{-202,-80},{-202,-69},{-206,-69}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND1.From, bus_3249.u[5]) annotation (Line(
      points={{-146.7,-10},{-160,-10},{-160,-9.08},{-174,-9.08}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND1.To, bus_3701.o[1]) annotation (Line(
      points={{-131.3,-10},{-124,-10},{-124,-60},{-118,-60}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(eqImpedance.From, bus_3359.u[9]) annotation (Line(
      points={{-119,140},{-124,140},{-124,132},{-116,132},{-116,98.4667},{
          -122,98.4667}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(eqImpedance.To, bus_3360.o[1]) annotation (Line(
      points={{-105,140},{-96,140}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND3.From, bus_5100.u[2]) annotation (Line(
      points={{30,-34.7},{30,-61},{24,-61}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND3.To, bus_5101.o[3]) annotation (Line(
      points={{30,-19.3},{30,-8},{10,-8},{10,12},{22,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND4.From, bus_5300.o[3]) annotation (Line(
      points={{227.3,90},{236,90},{236,84},{240,84}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND4.To, bus_5301.u[1]) annotation (Line(
      points={{214.7,90},{208,90},{208,80},{202,80}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND5.From, bus_5400.o[4]) annotation (Line(
      points={{157.3,-34},{174,-34},{174,-41.5},{180,-41.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND5.To, bus_5401.u[3]) annotation (Line(
      points={{144.7,-34},{134.35,-34},{134.35,-30},{124,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND6.From, bus_5400.u[3]) annotation (Line(
      points={{201,-34.7},{201,-42},{182,-42}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND6.To, bus_5402.u[1]) annotation (Line(
      points={{201,-19.3},{201,-8},{196,-8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND7.From, bus_5500.o[4]) annotation (Line(
      points={{70,-47.3},{70,-66.8},{76,-66.8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND7.To, bus_5501.o[2]) annotation (Line(
      points={{70,-34.7},{70,-13},{80,-13}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND8.From, bus_5601.o[1]) annotation (Line(
      points={{236.4,26},{250,26},{250,8},{280,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND8.To, bus_6001.u[2]) annotation (Line(
      points={{219.6,26},{201.8,26},{201.8,22},{184,22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND9.From, bus_5602.u[1]) annotation (Line(
      points={{194.7,-68},{190,-68},{190,-76},{184,-76}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND9.To, bus_5603.o[2]) annotation (Line(
      points={{207.3,-68},{212,-68},{212,-73},{220,-73}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND10.From, bus_6000.o[3]) annotation (Line(
      points={{216.4,15},{228,15},{228,6},{240,6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND10.To, bus_6001.u[3]) annotation (Line(
      points={{199.6,15},{194,15},{194,26},{184,26}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND11.From, bus_6700.o[4]) annotation (Line(
      points={{-111.3,-84},{-94,-84},{-94,-79.5},{-78,-79.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWND11.To, bus_6701.u[1]) annotation (Line(
      points={{-126.7,-84},{-144,-84}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-300,
            -220},{300,220}}),      graphics={
        Text(
          extent={{-278,12},{-290,16}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
7010"), Text(
          extent={{-266,-110},{-254,-114}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
7000"), Text(
          extent={{-280,-10},{-292,-6}},
          lineColor={0,128,0},
          textString="bus 7020",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-256,-54},{-244,-58}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
7100"), Text(
          extent={{-232,42},{-220,38}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3115"), Text(
          extent={{-264,44},{-252,40}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3000"), Text(
          extent={{-288,98},{-276,94}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3020"), Text(
          extent={{-224,84},{-212,80}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3300"), Text(
          extent={{-184,114},{-172,110}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3200"), Text(
          extent={{-182,34},{-170,30}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3100"), Text(
          extent={{-202,172},{-190,168}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
8500"), Text(
          extent={{-242,154},{-230,150}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
8700"), Text(
          extent={{-166,154},{-154,150}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
8600"), Text(
          extent={{-128,118},{-116,114}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3359"), Text(
          extent={{-100,156},{-88,152}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3360"), Text(
          extent={{-182,-54},{-170,-58}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3249"), Text(
          extent={{-124,-42},{-112,-46}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3701"), Text(
          extent={{-212,-84},{-200,-88}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3245"), Text(
          extent={{-182,-112},{-170,-116}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 
3244"), Text(
          extent={{-150,-96},{-138,-100}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
6701"), Text(
          extent={{-82,-96},{-70,-100}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
6700"), Text(
          extent={{-24,-124},{-12,-128}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
6500"), Text(
          extent={{18,-76},{30,-80}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5100"), Text(
          extent={{18,26},{30,22}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5101"), Text(
          extent={{74,66},{86,62}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5103"), Text(
          extent={{116,98},{128,94}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5304"), Text(
          extent={{118,0},{130,-4}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5102"), Text(
          extent={{158,138},{170,134}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5305"), Text(
          extent={{196,98},{208,94}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5301"), Text(
          extent={{236,98},{248,94}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5300"), Text(
          extent={{276,66},{288,62}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
6100"), Text(
          extent={{234,18},{246,14}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
6000"), Text(
          extent={{178,38},{190,34}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
6001"), Text(
          extent={{274,26},{286,22}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5601"), Text(
          extent={{276,-58},{288,-62}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5600"), Text(
          extent={{276,-108},{288,-112}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5620"), Text(
          extent={{238,-120},{250,-124}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5610"), Text(
          extent={{214,-88},{226,-92}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5603"), Text(
          extent={{178,-88},{190,-92}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5602"), Text(
          extent={{72,-92},{84,-96}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5500"), Text(
          extent={{76,-28},{88,-32}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5501"), Text(
          extent={{118,-46},{130,-50}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5401"), Text(
          extent={{176,-30},{188,-34}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5400"), Text(
          extent={{190,8},{202,4}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus
5402")}),
      Icon(coordinateSystem(extent={{-300,-220},{300,220}},
          preserveAspectRatio=false)));
end Nordic44;
