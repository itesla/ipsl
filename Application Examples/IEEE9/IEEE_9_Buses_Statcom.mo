within IEEE9;
model IEEE_9_Buses_Statcom
  parameter Real S_b= 100 "(MVA) @{conditions|System base power}";
  parameter Real f_b= 60 "(Hz) @{conditions|System frequency}";
  //Generator 1
  parameter Real ra1(min=0.00,max=0.02) = 0.00
    "Armature resistance (pu) @{Generator 1|slider:Armature resistance r_a}";
  parameter Real xd1(min=0.6,max=2.3) = 0.8958
    "d-axis reactance (pu) @{Generator 1|slider:d-axis reactance X_d}";
  parameter Real xq1(min=0.4,max=2.3) = 0.8645
    "q-axis reactance (pu) @{Generator 1|slider:q-axis reactance X_d}";
  parameter Real x1d1(min=0.15,max=0.5) = 0.1198
    "d-axis transient reactance (pu) @{Generator 1|slider:d-axis transient reactance Xp_d}";
  parameter Real x1q1(min=0.15,max=1.0) = 0.1969
    "q-axis transient reactance (pu) @{Generator 1|slider:q-axis transient reactance Xp_d}";
  parameter Real T1d1(min=1.5,max=9.0) = 6
    "d-axis transient time constant (s) @{Generator 1|slider:d-axis transient time constant Tp_d}";
  parameter Real T1q1(min=1.5,max=10) = 0.5350
    "q-axis transient time constant (s) @{Generator 1|slider:q-axis transient time constant Tp_q}";
  parameter Real M1 = 12.8
    "Machanical starting time (2H) (kWs/kVA) @{Generator 1|Mechanical starting time (2H) M}";
  parameter Real D1 = 0
    "Damping coefficient @{Generator 1|Damping coefficient D}";
    // Generator 2
  parameter Real ra2(min=0.00,max=0.02) = 0
    "Armature resistance (pu) @{Generator 2|slider:Armature resistance r_a}";
  parameter Real xd2(min=0.6,max=2.3) = 1.3125
    "d-axis reactance (pu) @{Generator 2|slider:d-axis reactance X_d}";
  parameter Real xq2(min=0.4,max=2.3) = 1.2578
    "q-axis reactance (pu) @{Generator 2|slider:q-axis reactance X_d}";
  parameter Real x1d2(min=0.15,max=0.5) = 0.1813
    "d-axis transient reactance (pu) @{Generator 2|slider:d-axis transient reactance Xp_d}";
  parameter Real x1q2(min=0.3,max=1.0) = 0.2500
    "q-axis transient reactance (pu) @{Generator 2|slider:q-axis transient reactance Xp_d}";
  parameter Real T1d2(min=1.5,max=9.0) = 5.89
    "d-axis transient time constant (s) @{Generator 2|slider:d-axis transient time constant Tp_d}";
  parameter Real T1q2(min=1.5,max=10) = 0.6
    "q-axis transient time constant (s) @{Generator 2|slider:q-axis transient time constant Tp_q}";
  parameter Real M2 = 6.02
    "Machanical starting time (2H) (kWs/kVA) @{Generator 2|Mechanical starting time (2H) M}";
  parameter Real D2 = 0
    "Damping coefficient @{Generator 2|Damping coefficient D}";
    //Generator 3
  parameter Real ra3(min=0.0,max=0.02) = 0.00
    "Armature resistance (pu) @{Generator 2|slider:Armature resistance r_a}";
  parameter Real xd3(min=0.6,max=2.3) = 0.1460
    "d-axis reactance (pu) @{Generator 2|slider:d-axis reactance X_d}";
  parameter Real xq3(min=0.05,max=2.3) = 0.0969
    "q-axis reactance (pu) @{Generator 2|slider:q-axis reactance X_d}";
  parameter Real x1d3(min=0.05,max=0.5) = 0.0608
    "d-axis transient reactance (pu) @{Generator 2|slider:d-axis transient reactance Xp_d}";
  parameter Real x1q3(min=0.05,max=1.0) = 0.0969
    "q-axis transient reactance (pu) @{Generator 2|slider:q-axis transient reactance Xp_d}";
  parameter Real T1d3(min=1.5,max=9.0) = 8.96
    "d-axis transient time constant (s) @{Generator 2|slider:d-axis transient time constant Tp_d}";
  parameter Real T1q3(min=0.3,max=10) = 0.310
    "q-axis transient time constant (s) @{Generator 2|slider:q-axis transient time constant Tp_q}";
  parameter Real M3 = 47.28
    "Machanical starting time (2H) (kWs/kVA) @{Generator 2|Mechanical starting time (2H) M}";
  parameter Real D3 = 0
    "Damping coefficient @{Generator 2|Damping coefficient D}";
 //STATCOM
  parameter Real Kr=100 "Regulator gain @{STATCOM|Regulator gain}";
  parameter Real Tr=0.1
    "Regulator time constant (s) @{STATCOM|Regulator time constant}";
  parameter Real i_Max(min=0.1,max=1.5)= 1.2
    "Maximum current (pu) @{STATCOM|slider:Maximum current}";
  parameter Real i_Min(min=-1.5,max=-0.1)= -0.8
    "Minimum current (pu) @{STATCOM|slider:Minimum current}";
  //Fault
  parameter Real R( min=0.001,max=10) = 0.1
    "Resistance (pu) @{3-phase-to-ground fault|slider:Fault resistance}";
  parameter Real X( min=0.001,max=10) = 0.1
    "Reactance (pu) @{3-phase-to-ground fault|slider:Fault reactance}";
  parameter Real t1 = 2
    "Start time of the fault (s) @{3-phase-to-ground fault|Fault start time}";
  parameter Real t2 = 2.15
    "End time of the fault (s) @{3-phase-to-ground fault|Fault end time}";
  parameter Boolean switch = false
    "@{3-phase-to-ground fault|switch:Enable/Disable fault}";
 //Load1
  parameter Real P1 = 1 "(pu) @{Load|Load 1 - Active power}";
  parameter Real Q1 = 0.35 "(pu) @{Load|Load 1 - Reactive power}";
 //Load1
  parameter Real P2 = 1.25 "(pu) @{Load|Load 2 - Active power}";
  parameter Real Q2 = 0.5 "(pu) @{Load|Load 2 - Reactive power}";
 //Load1
  parameter Real P3 = 0.90 "(pu) @{Load|Load 3 - Active power}";
  parameter Real Q3 = 0.30 "(pu) @{Load|Load 3 - Reactive power}";
 //Line Fault
 parameter Real t1_Line = 100 "(s) @{Line opening|Line opening time}";
 parameter Real t2_Line = 100.15 "(s) @{Line opening|Line reclosing time}";
 //AVR1
   parameter Real Ka_1=20 "@{AVR on Generator 1|Amplifier gain}";
   parameter Real Ta_1=0.2 "(s) @{AVR on Generator 1|Amplifier time constant}";
   parameter Real Kf_1=0.063 "@{AVR on Generator 1|Stabilizer gain}";
   parameter Real Tf_1=0.35
    "(s) @{AVR on Generator 1|Stabilizer time constant}";
   parameter Real Ke_1=1
    "@{AVR on Generator 1|Field circuit integral deviation}";
   parameter Real Te_1=0.314
    "(s) @{AVR on Generator 1|Field circuit time constant}";
   parameter Real Tr_1=0.001
    "(s) @{AVR on Generator 1|Measurement time constant}";
   parameter Real Ae_1=0.0039 "@AVR on Generator 1|1st ceiling coefficient}";
   parameter Real Be_1=1.555 "@{AVR on Generator 1|2nd ceiling coefficient}";
 //AVR2
   parameter Real Ka_2=20 "@{AVR on Generator 2|Amplifier gain}";
   parameter Real Ta_2=0.2 "(s) @{AVR on Generator 2|Amplifier time constant}";
   parameter Real Kf_2=0.063 "@{AVR on Generator 2|Stabilizer gain}";
   parameter Real Tf_2=0.35
    "(s) @{AVR on Generator 2|Stabilizer time constant}";
   parameter Real Ke_2=1
    "@{AVR on Generator 2|Field circuit integral deviation}";
   parameter Real Te_2=0.314
    "(s) @{AVR on Generator 2|Field circuit time constant}";
   parameter Real Tr_2=0.001
    "(s) @{AVR on Generator 2|Measurement time constant}";
   parameter Real Ae_2=0.0039 "@AVR on Generator 2|1st ceiling coefficient}";
   parameter Real Be_2=1.555 "@{AVR on Generator 2|2nd ceiling coefficient}";
 //AVR3
   parameter Real Ka_3=20 "@{AVR on Generator 3|Amplifier gain}";
   parameter Real Ta_3=0.2 "(s) @{AVR on Generator 3|Amplifier time constant}";
   parameter Real Kf_3=0.063 "@{AVR on Generator 3|Stabilizer gain}";
   parameter Real Tf_3=0.35
    "(s) @{AVR on Generator 3|Stabilizer time constant}";
   parameter Real Ke_3=1
    "@{AVR on Generator 3|Field circuit integral deviation}";
   parameter Real Te_3=0.314
    "(s) @{AVR on Generator 3|Field circuit time constant}";
   parameter Real Tr_3=0.001
    "(s) @{AVR on Generator 3|Measurement time constant}";
   parameter Real Ae_3=0.0039 "@AVR on Generator 1|1st ceiling coefficient}";
   parameter Real Be_3=1.555 "@{AVR on Generator 3|2nd ceiling coefficient}";

   //Reference disturbance 1
   parameter Real height_1 = 0.05
    "(pu) @{Change of voltage reference 1|Magnitude of disturbance}";
   parameter Real tstart_1 = 2
    "(s) @{Change of voltage reference 1|Time of disturbance}";
   parameter Boolean refdisturb_1 = false
    "(s) @{Change of voltage reference 1|switch:Enable/Disable disturbance}";
//Reference disturbance 2
   parameter Real height_2 = 0.05
    "(pu) @{Change of voltage reference 2|Magnitude of disturbance}";
   parameter Real tstart_2 = 2
    "(s) @{Change of voltage reference 2|Time of disturbance}";
   parameter Boolean refdisturb_2 = false
    "(s) @{Change of voltage reference 2|switch:Enable/Disable disturbance}";
//Reference disturbance 2
   parameter Real height_3 = 0.05
    "(pu) @{Change of voltage reference 3|Magnitude of disturbance}";
   parameter Real tstart_3 = 2
    "(s) @{Change of voltage reference 3|Time of disturbance}";
   parameter Boolean refdisturb_3 = false
    "(s) @{Change of voltage reference 3|switch:Enable/Disable disturbance}";
  PowerSystems.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer(
    V_b=16500,
    Vn=16500,
    kT=16.5/230,
    x=0.0576,
    r=0,
    fn=60) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-66})));
  PowerSystems.Electrical.Branches.PwLine line_6_4(
    R=0.017,
    X=0.092,
    G=0,
    B=0.079,
    S_b=S_b) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={86,-20})));
  PowerSystems.Electrical.Branches.PwLine line_4_5(
    G=0,
    R=0.01,
    X=0.085,
    B=0.088,
    S_b=S_b) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-72,-20})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lOADPQ(
    S_b=S_b,
    P_0=P2,
    Q_0=Q2)
    annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-91,-13})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ PQ1(
    S_b=S_b,
    P_0=P3,
    Q_0=Q3)                                                        annotation (
      Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={111,-13})));
  PowerSystems.Electrical.Branches.PwLine line_9_6(
    G=0,
    R=0.039,
    X=0.170,
    B=0.179,
    S_b=S_b) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={86,58})));
  PowerSystems.Electrical.Branches.PwLine line_5_7(
    G=0,
    R=0.032,
    X=0.161,
    B=0.153,
    S_b=S_b) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-72,54})));
  PowerSystems.Electrical.Branches.PwLine line_8_9(
    G=0,
    R=0.0119,
    X=0.1008,
    B=0.1045,
    S_b=S_b) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,90})));
  PowerSystems.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer1(
    r=0,
    V_b=13800,
    Vn=13800,
    fn=60,
    kT=13.8/230,
    x=0.0586) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={102,90})));
  PowerSystems.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer2(
    r=0,
    V_b=18000,
    Vn=18000,
    kT=18/230,
    x=0.0625,
    Sb=S_b,
    fn=f_b)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-102,90})));
  PowerSystems.Electrical.Loads.PSAT.LOADPQ lOADPQ1(
    S_b=S_b,
    P_0=P1,
    Q_0=Q1)                                                         annotation (
      Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-9,65})));
  PowerSystems.Electrical.Controls.PSAT.FACTS.STATCOM.STATCOM sTATCOM3_1(
    Vbus=230000,
    Vn=230000,
    Qg=0.128730182132440,
    V_0=1.025000000000000,
    angle_0=0.011660880329005,
    Kr=Kr,
    Tr=Tr,
    i_Max=i_Max,
    i_Min=i_Min,
    Sb=S_b,
    fn=f_b)                    annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={9,65})));
  PowerSystems.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{-130,80},{-110,100}})));
  PowerSystems.Electrical.Buses.Bus B7
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  PowerSystems.Electrical.Buses.Bus B8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,90})));
  PowerSystems.Electrical.Buses.Bus B9
    annotation (Placement(transformation(extent={{70,80},{90,100}})));
  PowerSystems.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{110,80},{130,100}})));
  PowerSystems.Electrical.Buses.Bus B6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={86,20})));
  PowerSystems.Electrical.Buses.Bus B5 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-72,20})));
  PowerSystems.Electrical.Buses.Bus B4 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-46})));
  PowerSystems.Electrical.Buses.Bus B1 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-86})));
  PowerSystems.Electrical.Events.PwFaultPQ pwFaultPQ(
    X=0.001,
    t1=3,
    t2=3.1,
    R=8) annotation (Placement(transformation(extent={{14,100},{34,120}})));

    output Real v_1 "(pu) @{Voltages|plot:Bus 1 voltage magnitude}";
    output Real ang_1 "(deg) @{Voltages|plot:Bus 1 voltage angle}";
    output Real v_2 "(pu) @{Voltages|plot:Bus 2 voltage magnitude}";
    output Real ang_2 "(deg) @{Voltages|plot:Bus 2 voltage angle}";
    output Real v_3 "(pu) @{Voltages|plot:Bus 3 voltage magnitude}";
    output Real ang_3 "(deg) @{Voltages|plot:Bus 3 voltage angle}";
    output Real v_4 "(pu) @{Voltages|plot:Bus 4 voltage magnitude}";
    output Real ang_4 "(deg) @{Voltages|plot:Bus 4 voltage angle}";
    output Real v_5 "(pu) @{Voltages|plot:Bus 5 voltage magnitude}";
    output Real ang_5 "(deg) @{Voltages|plot:Bus 5 voltage angle}";
    output Real v_6 "(pu) @{Voltages|plot:Bus 6 voltage magnitude}";
    output Real ang_6 "(deg) @{Voltages|plot:Bus 6 voltage angle}";
    output Real v_7 "(pu) @{Voltages|plot:Bus 7 voltage magnitude}";
    output Real ang_7 "(deg) @{Voltages|plot:Bus 7 voltage angle}";
    output Real v_8 "(pu) @{Voltages|plot:Bus 8 voltage magnitude}";
    output Real ang_8 "(deg) @{Voltages|plot:Bus 8 voltage angle}";
    output Real v_9 "(pu) @{Voltages|plot:Bus 9 voltage magnitude}";
    output Real ang_9 "(deg) @{Voltages|plot:Bus 9 voltage angle}";

    output Real P_1 "(pu) @{Generator 1|plot:Active power}";
    output Real P_2 "(pu) @{Generator 2|plot:Active power}";
    output Real P_3 "(pu) @{Generator 3|plot:Active power}";

    output Real P_11(min=0,max=2) "(pu) @{Generator 1|gauge:Active power}";
    output Real P_22(min=0,max=2) "(pu) @{Generator 2|gauge:Active power}";
    output Real P_33(min=0,max=2) "(pu) @{Generator 3|gauge:Active power}";

    output Real Q_1 "(pu) @{Generator 1|plot:Reactive power}";
    output Real Q_2 "(pu) @{Generator 2|plot:Reactive power}";
    output Real Q_3 "(pu) @{Generator 3|plot:Reactive power}";

    output Real Q_11(min=-2,max=2) "(pu) @{Generator 1|gauge:Reactive power}";
    output Real Q_22(min=-2,max=2) "(pu) @{Generator 2|gauge:Reactive power}";
    output Real Q_33(min=-2,max=2) "(pu) @{Generator 3|gauge:Reactive power}";

    output Real w_1 "(pu) @{Generator 1|plot:Generator speed}";
    output Real w_2 "(pu) @{Generator 2|plot:Generator speed}";
    output Real w_3 "(pu) @{Generator 3|plot:Generator speed}";

    output Real vf_1 "(pu) @{Generator 1|plot:Field voltage}";
    output Real vf_2 "(pu) @{Generator 2|plot:Field voltage}";
    output Real vf_3 "(pu) @{Generator 3|plot:Field voltage}";

    output Real i_SH "(pu) @{STATCOM|plot:Current}";
    output Real Q "(pu) @{STATCOM|plot:Reactive power output}";

    //Line 4 - 5
    output Real P12_45 "Active power 12_45 @{.animation|Active Power}";
    output Real Q12_45 "Reactive power 12_45 @{.animation|Reactive Power}";
    output Real P21_45 "Active power 21_45 @{.animation|Reactive Power}";
    output Real Q21_45 "Reactive power 21_45  @{.animation|Active Power}";

    //Line 6 - 4
    output Real P12_64 "Active power 12_64 @{.animation|Active Power}";
    output Real Q12_64 "Reactive power 12_64 @{.animation|Reactive Power}";
    output Real P21_64 "Active power 21_64 @{.animation|Reactive Power}";
    output Real Q21_64 "Reactive power 21_64  @{.animation|Active Power}";

    //Line 9 - 6
    output Real P12_96 "Active power 12_96 @{.animation|Active Power}";
    output Real Q12_96 "Reactive power 12_96 @{.animation|Reactive Power}";
    output Real P21_96 "Active power 21_96 @{.animation|Reactive Power}";
    output Real Q21_96 "Reactive power 21_96  @{.animation|Active Power}";

    //Line 5 - 7
    output Real P12_57 "Active power 12_57 @{.animation|Active Power}";
    output Real Q12_57 "Reactive power 12_57 @{.animation|Reactive Power}";
    output Real P21_57 "Active power 21_57 @{.animation|Reactive Power}";
    output Real Q21_57 "Reactive power 21_57  @{.animation|Active Power}";

    //Line 7 - 8
    output Real P12_78 "Active power 12_78 @{.animation|Active Power}";
    output Real Q12_78 "Reactive power 12_78 @{.animation|Reactive Power}";
    output Real P21_78 "Active power 21_78 @{.animation|Reactive Power}";
    output Real Q21_78 "Reactive power 21_78  @{.animation|Active Power}";

    //Line 8 - 9
    output Real P12_89 "Active power 12_89 @{.animation|Active Power}";
    output Real Q12_89 "Reactive power 12_89 @{.animation|Reactive Power}";
    output Real P21_89 "Active power 21_89 @{.animation|Reactive Power}";
    output Real Q21_89 "Reactive power 21_89  @{.animation|Active Power}";

    output Real PL1 "Load active power 1 @{.animation|Active Power}";
    output Real QL1 "Load reactive power 1 @{.animation|Reactive Power}";

    output Real PL2 "Load active power 2 @{.animation|Active Power}";
    output Real QL2 "Load reactive power 2 @{.animation|Reactive Power}";

    output Real PL3 "Load active power 3 @{.animation|Active Power}";
    output Real QL3 "Load reactive power 3 @{.animation|Reactive Power}";

  PowerSystems.Electrical.Branches.PwLine2Openings ine_7_8(
    R=0.0085,
    X=0.072,
    G=0,
    B=0.0745,
    t1=t1_Line,
    t2=t2_Line,
    S_b=S_b) annotation (Placement(transformation(extent={{-50,80},{-30,100}})));

    function Angle
      input Real slack_r;
      input Real slack_i;
      input Real bus_r;
      input Real bus_i;
      output Real angle;
    algorithm
      angle := acos((slack_r*bus_r+slack_i*bus_i)/(sqrt(slack_r^2+slack_i^2)*sqrt(bus_r^2+bus_i^2)))/Modelica.Constants.pi*180;
    end Angle;

  Generation_Groups.Gen1 gen1(
    ra1=ra1,
    xd1=xd1,
    xq1=xq1,
    x1d1=x1d1,
    x1q1=x1q1,
    T1d1=T1d1,
    T1q1=T1q1,
    M1=M1,
    D1=D1,
    S_b=S_b,
    f_b=f_b,
    Ka_1=Ka_1,
    Ta_1=Ta_1,
    Kf_1=Kf_1,
    Tf_1=Tf_1,
    Ke_1=Ke_1,
    Te_1=Te_1,
    Tr_1=Tr_1,
    Ae_1=Ae_1,
    Be_1=Be_1,
    height_1=height_1,
    tstart_1=tstart_1,
    refdisturb_1=refdisturb_1)
    annotation (Placement(transformation(extent={{-160,80},{-140,100}})));
  Generation_Groups.Gen2 gen2(
    ra2=ra2,
    xd2=xd2,
    xq2=xq2,
    x1d2=x1d2,
    x1q2=x1q2,
    T1d2=T1d2,
    T1q2=T1q2,
    M2=M2,
    D2=D2,
    S_b=S_b,
    f_b=f_b,
    Ka_2=Ka_2,
    Ta_2=Ta_2,
    Kf_2=Kf_2,
    Tf_2=Tf_2,
    Ke_2=Ke_2,
    Te_2=Te_2,
    Tr_2=Tr_2,
    Ae_2=Ae_2,
    Be_2=Be_2,
    height_2=height_2,
    tstart_2=tstart_2,
    refdisturb_2=refdisturb_2)
    annotation (Placement(transformation(extent={{160,80},{140,100}})));
  Generation_Groups.Gen3 gen3(
    ra3=ra3,
    xd3=xd3,
    xq3=xq3,
    x1d3=x1d3,
    x1q3=x1q3,
    T1d3=T1d3,
    T1q3=T1q3,
    M3=M3,
    D3=D3,
    S_b=S_b,
    f_b=f_b,
    Ka_3=Ka_3,
    Ta_3=Ta_3,
    Kf_3=Kf_3,
    Tf_3=Tf_3,
    Ke_3=Ke_3,
    Te_3=Te_3,
    Tr_3=Tr_3,
    Ae_3=Ae_3,
    Be_3=Be_3,
    height_3=height_3,
    tstart_3=tstart_3,
    refdisturb_3=refdisturb_3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-106})));
equation

        PL1 = lOADPQ1.P;
        QL1 = loadPQ1.Q;

        PL1 = lOADPQ.P;
        QL1 = loadPQ.Q;

        PL1 = PQ1.P;
        QL1 = PQ1.Q;

  //Line variables
        P12_45 = line_4_5.P12;
        Q12_45 = line_4_5.Q12;
        P21_45 = line_4_5.P21;
        Q21_45 = line_4_5.Q21;

    //Line 6 - 4
        P12_64 = line_6_4.P12;
        Q12_64 = line_6_4.Q12;
        P21_64 = line_6_4.P21;
        Q21_64 = line_6_4.Q21;

    //Line 9 - 6
        P12_96 = line_9_6.P12;
        Q12_96 = line_9_6.Q12;
        P21_96 = line_9_6.P21;
        Q21_96 = line_9_6.Q21;

    //Line 5 - 7
        P12_57 = line_5_7.P12;
        Q12_57 = line_5_7.Q12;
        P21_57 = line_5_7.P21;
        Q21_57 = line_5_7.Q21;

    //Line 7 - 8
        P12_78 = ine_7_8.P12;
        Q12_78 = ine_7_8.Q12;
        P21_78 = ine_7_8.P21;
        Q21_78 = ine_7_8.Q21;

    //Line 8 - 9
        P12_89 = line_8_9.P12;
        Q12_89 = line_8_9.Q12;
        P21_89 = line_8_9.P21;
        Q21_89 = line_8_9.Q21;

  i_SH = sTATCOM3_1.i_SH;
  Q = sTATCOM3_1.Q;
  vf_1 = gen1.AVR.vf;
  vf_2 = gen2.AVR.vf;
  vf_3 = gen3.AVR.vf;
  w_1 = gen1.gen.w;
  w_2 = gen2.gen.w;
  w_3 = gen3.gen.w;
  P_1 = gen1.gen.P;
  P_2 = gen2.gen.P;
  P_3 = gen3.gen.P;
  Q_1 = gen1.gen.Q;
  Q_2 = gen2.gen.Q;
  Q_3 = gen3.gen.Q;
  P_11 = gen1.gen.P;
  P_22 = gen2.gen.P;
  P_33 = gen3.gen.P;
  Q_11 = gen1.gen.Q;
  Q_22 = gen2.gen.Q;
  Q_33 = gen3.gen.Q;
  v_1 = B1.V;
  ang_1 = B1.anglevdeg;
  v_2 = B2.V;
  ang_2 = Angle(B1.p.vr,B1.p.vi,B2.p.vr,B2.p.vi);
  v_3 = B3.V;
  ang_3 = Angle(B1.p.vr,B1.p.vi,B3.p.vr,B3.p.vi);
  v_4 = B4.V;
  ang_4 = Angle(B1.p.vr,B1.p.vi,B4.p.vr,B4.p.vi);
  v_5 = B5.V;
  ang_5 = Angle(B1.p.vr,B1.p.vi,B5.p.vr,B5.p.vi);
  v_6 = B6.V;
  ang_6 = Angle(B1.p.vr,B1.p.vi,B6.p.vr,B6.p.vi);
  v_7 = B7.V;
  ang_7 = Angle(B1.p.vr,B1.p.vi,B7.p.vr,B7.p.vi);
  v_8 = B8.V;
  ang_8 = Angle(B1.p.vr,B1.p.vi,B8.p.vr,B8.p.vi);
  v_9 = B9.V;
  ang_9 = Angle(B1.p.vr,B1.p.vi,B9.p.vr,B9.p.vi);

  connect(line_5_7.n, B7.p) annotation (Line(
      points={{-72,61},{-72,90},{-80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.n, B9.p) annotation (Line(
      points={{91,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_9_6.n, B9.p) annotation (Line(
      points={{86,65},{86,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.p, B3.p) annotation (Line(
      points={{113,90},{120,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_6_4.n, B6.p) annotation (Line(
      points={{86,-13},{86,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, line_9_6.p) annotation (Line(
      points={{86,20},{86,51}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_4_5.n, B5.p) annotation (Line(
      points={{-72,-13},{-72,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_5_7.p, B5.p) annotation (Line(
      points={{-72,47},{-72,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.p, B1.p) annotation (Line(
      points={{0,-77},{0,-86}},
      color={0,0,255},
      smooth=Smooth.None));

  connect(B8.p, pwFaultPQ.p) annotation (Line(
      points={{0,90},{8,90},{8,111},{17,111}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B7.p, ine_7_8.p)
    annotation (Line(points={{-80,90},{-47,90}}, color={0,0,255}));
  connect(ine_7_8.n, B8.p)
    annotation (Line(points={{-33,90},{-33,90},{0,90}}, color={0,0,255}));
  connect(B2.p, gen1.pwPin)
    annotation (Line(points={{-120,90},{-139,90}}, color={0,0,255}));
  connect(B2.p, twoWindingTransformer2.p)
    annotation (Line(points={{-120,90},{-110,90},{-113,90}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.p)
    annotation (Line(points={{-91,90},{-91,90},{-80,90}}, color={0,0,255}));
  connect(gen2.pwPin, B3.p)
    annotation (Line(points={{139,90},{129.5,90},{120,90}}, color={0,0,255}));
  connect(lOADPQ.p, B5.p) annotation (Line(points={{-91,-5.3},{-91,4},{-72,4},{
          -72,20}}, color={0,0,255}));
  connect(line_4_5.p, B4.p) annotation (Line(points={{-72,-27},{-72,-27},{-72,
          -42},{0,-42},{0,-46}}, color={0,0,255}));
  connect(line_6_4.p, B4.p) annotation (Line(points={{86,-27},{86,-42},{0,-42},
          {0,-46}}, color={0,0,255}));
  connect(PQ1.p, B6.p) annotation (Line(points={{111,-5.3},{111,0},{86,0},{86,
          20}},   color={0,0,255}));
  connect(lOADPQ1.p, B8.p)
    annotation (Line(points={{-9,72.7},{-9,90},{0,90}}, color={0,0,255}));
  connect(B4.p, twoWindingTransformer.n) annotation (Line(points={{0,-46},{0,
          -55}},               color={0,0,255}));
  connect(gen3.pwPin, B1.p)
    annotation (Line(points={{0,-95},{0,-86}},              color={0,0,255}));
  connect(line_8_9.p, pwFaultPQ.p) annotation (Line(points={{33,90},{8,90},{8,111},
          {17,111}},      color={0,0,255}));
  connect(line_8_9.n, B9.p)
    annotation (Line(points={{47,90},{63.5,90},{80,90}}, color={0,0,255}));
  connect(sTATCOM3_1.p, pwFaultPQ.p) annotation (Line(points={{9,72.7},{9,90},{8,
          90},{8,111},{17,111}},   color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -120},{180,120}})),                Icon(coordinateSystem(extent={{-180,
            -120},{180,120}})),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end IEEE_9_Buses_Statcom;
