within OpenIPSL.Examples.IEEE9;
model IEEE_9_Buses_Statcom "IEEE (WSCC) 9-bus 3-machine test system with STATCOM"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    V_b=16500,
    Vn=16500,
    rT=0,
    xT=0.0576) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-66})));
  OpenIPSL.Electrical.Branches.PwLine line_6_4(
    R=0.017,
    X=0.092,
    G=0,
    B=0.079) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=90,
        origin={86,-21})));
  OpenIPSL.Electrical.Branches.PwLine line_4_5(
    G=0,
    R=0.01,
    X=0.085,
    B=0.088) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=90,
        origin={-72,-21})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent lOADPQ(
    V_b=230000,
    v_0=0.995630859628167,
    angle_0=-0.0696176932,
    P_0=125000000,
    Q_0=50000000) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        origin={-99,-9})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent PQ1(
    V_b=230000,
    v_0=1.012654326639182,
    angle_0=-0.06435727083,
    P_0=90000000,
    Q_0=30000000) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        origin={109,-13})));
  OpenIPSL.Electrical.Branches.PwLine line_9_6(
    G=0,
    R=0.039,
    X=0.170,
    B=0.179) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=90,
        origin={86,57})));
  OpenIPSL.Electrical.Branches.PwLine line_5_7(
    G=0,
    R=0.032,
    X=0.161,
    B=0.153) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=90,
        origin={-72,53})));
  OpenIPSL.Electrical.Branches.PwLine line_8_9(
    G=0,
    R=0.0119,
    X=0.1008,
    B=0.1045) annotation (Placement(transformation(
        extent={{-9,-6.00001},{9.00001,6.00001}},
        origin={35,90})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer1(
    V_b=13800,
    Vn=13800,
    rT=0,
    xT=0.0586) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={102,90})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer2(
    Sn=100000000,
    V_b=18000,
    Vn=18000,
    rT=0,
    xT=0.0625) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-102,90})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent lOADPQ1(
    v_0=1.015882581760390,
    angle_0=0.01269796844,
    V_b=230000,
    P_0=100000000,
    Q_0=35000000) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        origin={-9,65})));
  OpenIPSL.Electrical.FACTS.PSAT.STATCOM sTATCOM3_1(
    Q_0=128730.182132440,
    Tr=0.1,
    Sn=100000000,
    fn=60,
    v_0=1.015882581760390,
    V_b=230000,
    Vn=230000,
    S_b=SysData.S_b,
    angle_0=0.011660880329004,
    i_Min=-0.8,
    Kr=100,
    i_Max=1.2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={12,66})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{-130,80},{-110,100}})));
  OpenIPSL.Electrical.Buses.Bus B7
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  OpenIPSL.Electrical.Buses.Bus B8(v_0=1.025) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        origin={0,90})));
  OpenIPSL.Electrical.Buses.Bus B9
    annotation (Placement(transformation(extent={{70,80},{90,100}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{110,80},{130,100}})));
  OpenIPSL.Electrical.Buses.Bus B6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={86,20})));
  OpenIPSL.Electrical.Buses.Bus B5 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-72,20})));
  OpenIPSL.Electrical.Buses.Bus B4 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-46})));
  OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-86})));
  OpenIPSL.Electrical.Branches.PwLine line_7_8(
    R=0.0085,
    X=0.072,
    G=0,
    B=0.0745,
    t2=110,
    t1=30,
    opening=1)
    annotation (Placement(transformation(extent={{-48,84},{-30,96}})));
  Generation_Groups.Gen1 gen1(
    V_b=18000,
    v_0=1.025,
    vref0=1.120103884682511,
    vf0=1.789323314329606,
    height_1=0.05,
    tstart_1=2,
    angle_0=0.161966652912444,
    P_0=163000000,
    Q_0=6653656.0198189,
    refdisturb_1=false)
    annotation (Placement(transformation(extent={{-160,80},{-140,100}})));

  Generation_Groups.Gen2 gen2(
    V_b=13800,
    v_0=1.025,
    height_2=0.05,
    tstart_2=2,
    refdisturb_2=false,
    vref0=1.097573933623472,
    vf0=1.402994304406186,
    P_0=85000000,
    Q_0=-10859708.8920594,
    angle_0=0.08141611894)
    annotation (Placement(transformation(extent={{160,80},{140,100}})));
  Generation_Groups.Gen3 gen3(
    v_0=1.040000000000000,
    angle_0=0,
    height_3=0.05,
    tstart_3=2,
    refdisturb_3=false,
    V_b=16500,
    vref0=1.095242742681042,
    vf0=1.082148046273888,
    P_0=71641021.4993680,
    Q_0=27045927.9594234) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-106})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60)
    annotation (Placement(transformation(extent={{80,-120},{180,-80}})));
  OpenIPSL.Electrical.Events.PwFault pwFault2(
    X=0.01,
    R=0.01,
    t1=3,
    t2=3.1) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={59,67})));
  Modelica.Blocks.Sources.Constant no_pss(k=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,30})));
equation
  connect(line_5_7.n, B7.p) annotation (Line(
      points={{-72,61.1},{-72,90},{-80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.n, B9.p) annotation (Line(
      points={{91,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_9_6.n, B9.p) annotation (Line(
      points={{86,65.1},{86,90},{80,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer1.p, B3.p) annotation (Line(
      points={{113,90},{120,90}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_6_4.n, B6.p) annotation (Line(
      points={{86,-12.9},{86,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B6.p, line_9_6.p) annotation (Line(
      points={{86,20},{86,48.9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_4_5.n, B5.p) annotation (Line(
      points={{-72,-12.9},{-72,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_5_7.p, B5.p) annotation (Line(
      points={{-72,44.9},{-72,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(twoWindingTransformer.p, B1.p) annotation (Line(
      points={{0,-77},{0,-86}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B7.p, line_7_8.p) annotation (Line(points={{-80,90},{-47.1,90},{-47.1,
          90}}, color={0,0,255}));
  connect(line_7_8.n, B8.p)
    annotation (Line(points={{-30.9,90},{-30.9,90},{0,90}}, color={0,0,255}));
  connect(B2.p, gen1.pwPin)
    annotation (Line(points={{-120,90},{-139,90}}, color={0,0,255}));
  connect(B2.p, twoWindingTransformer2.p)
    annotation (Line(points={{-120,90},{-110,90},{-113,90}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.p)
    annotation (Line(points={{-91,90},{-91,90},{-80,90}}, color={0,0,255}));
  connect(gen2.pwPin, B3.p)
    annotation (Line(points={{139,90},{129.5,90},{120,90}}, color={0,0,255}));
  connect(lOADPQ.p, B5.p) annotation (Line(points={{-99,-2},{-99,4},{-72,4},{-72,
          20}}, color={0,0,255}));
  connect(line_4_5.p, B4.p) annotation (Line(points={{-72,-29.1},{-72,-29.1},{-72,
          -42},{0,-42},{0,-46}}, color={0,0,255}));
  connect(line_6_4.p, B4.p) annotation (Line(points={{86,-29.1},{86,-42},{0,-42},
          {0,-46}}, color={0,0,255}));
  connect(PQ1.p, B6.p) annotation (Line(points={{109,-6},{109,0},{86,0},{86,20}},
        color={0,0,255}));
  connect(lOADPQ1.p, B8.p)
    annotation (Line(points={{-9,72},{-9,90},{0,90}}, color={0,0,255}));
  connect(B4.p, twoWindingTransformer.n)
    annotation (Line(points={{0,-46},{0,-55}}, color={0,0,255}));
  connect(gen3.pwPin, B1.p)
    annotation (Line(points={{0,-95},{0,-86}}, color={0,0,255}));
  connect(line_8_9.n, B9.p)
    annotation (Line(points={{43.1,90},{43.1,90},{80,90}}, color={0,0,255}));
  connect(B8.p, line_8_9.p)
    annotation (Line(points={{0,90},{26.9,90}}, color={0,0,255}));
  connect(sTATCOM3_1.p, line_8_9.p)
    annotation (Line(points={{12,72.6},{12,90},{26.9,90}}, color={0,0,255}));
  connect(B9.p, pwFault2.p)
    annotation (Line(points={{80,90},{59,90},{59,75.1667}}, color={0,0,255}));
  connect(no_pss.y, sTATCOM3_1.v_POD)
    annotation (Line(points={{0,41},{0,66},{4.8,66}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{
            180,120}})),
    Documentation(info="<html>
<p>This example is composed by the base IEEE (WSCC) 9-bus 3-machine system but with a STATCOM connected to bus 8. The system undergoes a three-phase-to-ground fault at 3s, lasting for 100ms. Simulate the system for 20 seconds.</p>
<p>Variables of interest are </p>
<ul>
<li><code>Bus7.v</code></li>
<li><code>Bus8.v</code></li>
<li><code>Bus9.v</code></li>
</ul>
<p>Compare the results with the ones obtained when simulating <strong>IEEE_9_Buses</strong>.</p>
</html>"),
    experiment(
      StopTime=20,
      Interval=0.001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"));
end IEEE_9_Buses_Statcom;
