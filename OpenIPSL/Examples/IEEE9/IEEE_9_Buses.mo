within OpenIPSL.Examples.IEEE9;
model IEEE_9_Buses "WSCC 9-bus 3-machine base test system"
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
        rotation=270,
        origin={86,-21})));
  OpenIPSL.Electrical.Branches.PwLine line_4_5(
    G=0,
    R=0.01,
    X=0.085,
    B=0.088) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=270,
        origin={-72,-21})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent lOADPQ(
    V_b=230000,
    v_0=0.995630859628167,
    Sn=100000000,
    P_0=125000000,
    Q_0=50000000,
    angle_0=-0.0696176932) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-99,-11})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent PQ1(
    V_b=230000,
    v_0=1.012654326639182,
    Sn=100000000,
    P_0=90000000,
    Q_0=30000000,
    angle_0=-0.06435727083) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
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
        extent={{-9,-6},{9,6}},
        rotation=180,
        origin={39,90})));
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
        rotation=0,
        origin={-102,90})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent lOADPQ1(
    V_b=230000,
    v_0=1.015882581760390,
    Sn=100000000,
    P_0=100000000,
    Q_0=35000000,
    angle_0=0.01269796844) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={7,53})));
  OpenIPSL.Electrical.Buses.Bus B2(
    v_0=1.025,
    V_b=18000,
    angle_0=0.16196655458)
    annotation (Placement(transformation(extent={{-130,80},{-110,100}})));
  OpenIPSL.Electrical.Buses.Bus B7(
    V_b=230000,
    v_0=1.0258,
    angle_0=0.06492101218)
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  OpenIPSL.Electrical.Buses.Bus B8(
    v_0=1.015882581760390,
    V_b=230000,
    angle_0=0.01269796844) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,90})));
  OpenIPSL.Electrical.Buses.Bus B9(
    V_b=230000,
    v_0=1.0324,
    angle_0=0.03432539039)
    annotation (Placement(transformation(extent={{70,80},{90,100}})));
  OpenIPSL.Electrical.Buses.Bus B3(
    v_0=1.025,
    V_b=13800,
    angle_0=0.08141611894)
    annotation (Placement(transformation(extent={{110,80},{130,100}})));
  OpenIPSL.Electrical.Buses.Bus B6(
    v_0=1.012654326639182,
    V_b=230000,
    angle_0=-0.06435727083) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={86,20})));
  OpenIPSL.Electrical.Buses.Bus B5(
    v_0=0.995630859628167,
    V_b=230000,
    angle_0=-0.0696176932) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-72,20})));
  OpenIPSL.Electrical.Buses.Bus B4(
    v_0=1.0258,
    V_b=230000,
    angle_0=-0.03869045885) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-46})));
  OpenIPSL.Electrical.Buses.Bus B1(
    angle_0=0,
    v_0=1.04,
    V_b=16500) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,-86})));
  Generation_Groups.Gen1 gen1(
    V_b=18000,
    v_0=1.025,
    height_1=0.05,
    tstart_1=2,
    refdisturb_1=false,
    vref0=1.120103884682511,
    vf0=1.789323314329606,
    angle_0=0.161966652912444,
    P_0=163000000,
    Q_0=6653656.0198189)
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
        origin={0,-104})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60)
    annotation (Placement(transformation(extent={{80,-120},{180,-80}})));
  OpenIPSL.Electrical.Events.PwFault pwFault2(
    X=0.01,
    t1=3,
    t2=3.1,
    R=0.01) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={57,61})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(
    R=0.0085,
    X=0.072,
    G=0,
    B=0.0745,
    t1=30,
    t2=35,
    opening=1)
    annotation (Placement(transformation(extent={{-50,84},{-32,96}})));
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
  connect(B6.p, line_9_6.p) annotation (Line(
      points={{86,20},{86,48.9}},
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
  connect(B2.p, gen1.pwPin)
    annotation (Line(points={{-120,90},{-139,90}}, color={0,0,255}));
  connect(B2.p, twoWindingTransformer2.p)
    annotation (Line(points={{-120,90},{-110,90},{-113,90}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.p)
    annotation (Line(points={{-91,90},{-91,90},{-80,90}}, color={0,0,255}));
  connect(gen2.pwPin, B3.p)
    annotation (Line(points={{139,90},{129.5,90},{120,90}}, color={0,0,255}));
  connect(lOADPQ.p, B5.p) annotation (Line(points={{-99,-4},{-99,4},{-72,4},{-72,
          20}}, color={0,0,255}));
  connect(B4.p, twoWindingTransformer.n)
    annotation (Line(points={{0,-46},{0,-55}}, color={0,0,255}));
  connect(gen3.pwPin, B1.p)
    annotation (Line(points={{0,-93},{0,-86}}, color={0,0,255}));
  connect(B8.p, lOADPQ1.p) annotation (Line(points={{0,90},{6,90},{6,88},{7,88},
          {7,60}}, color={0,0,255}));
  connect(line_8_9.p, B9.p)
    annotation (Line(points={{47.1,90},{47.1,90},{80,90}}, color={0,0,255}));
  connect(B8.p, line_8_9.n)
    annotation (Line(points={{0,90},{30.9,90}}, color={0,0,255}));
  connect(B5.p, line_4_5.p)
    annotation (Line(points={{-72,20},{-72,-12.9}}, color={0,0,255}));
  connect(B4.p, line_4_5.n) annotation (Line(points={{0,-46},{0,-42},{-72,-42},
          {-72,-29.1}}, color={0,0,255}));
  connect(B6.p, line_6_4.p)
    annotation (Line(points={{86,20},{86,-12.9}}, color={0,0,255}));
  connect(B4.p, line_6_4.n) annotation (Line(points={{0,-46},{-2,-46},{-2,-42},
          {86,-42},{86,-29.1}}, color={0,0,255}));
  connect(B6.p, PQ1.p) annotation (Line(points={{86,20},{86,20},{86,2},{86,4},{
          109,4},{109,-6}}, color={0,0,255}));
  connect(B9.p, pwFault2.p)
    annotation (Line(points={{80,90},{57,90},{57,69.1667}}, color={0,0,255}));
  connect(B7.p, pwLine2Openings.p)
    annotation (Line(points={{-80,90},{-49.1,90}}, color={0,0,255}));
  connect(B8.p, pwLine2Openings.n)
    annotation (Line(points={{0,90},{-32.9,90}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{
            180,120}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p>This example is composed by the base WSCC 9-bus 3-machine system. The system undergoes a three-phase-to-ground fault at 3s, lasting for 100ms. Simulate the system for 20 seconds.</p>
<p>Variables of interest are </p>
<ul>
<li><code>Bus7.v</code></li>
<li><code>Bus8.v</code></li>
<li><code>Bus9.v</code></li>
</ul>
<p>Compare the results with the ones obtained when simulating <strong>WSCC_9_Buses_Statcom</strong>.
</html>"),
    experiment(
      StopTime=20,
      Interval=0.001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput);
end IEEE_9_Buses;
