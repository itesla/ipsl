within OpenIPSL.Examples.Branches.PSAT;
model PhaseShiftingTransformer_Test "Simple model checking the phase shifting transformer."
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.PQ lOADPQ annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  OpenIPSL.Electrical.Branches.PSAT.PhaseShiftingTransformer.PSTransformer
    pSTransformer(
    Vbus1=400000,
    Vn1=400000,
    Kp=0.5,
    Ki=0.1,
    m=0.95,
    alpha0=2.0943951023932,
    vk0=0,
    vm0=0,
    anglevk0=0,
    anglevm0=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=true)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=true)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Buses.InfiniteBus infiniteBus(displayPF=true) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Electrical.Loads.PSAT.PQ          lOADPQ1
                                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,-50})));
  Electrical.Branches.PSAT.PhaseShiftingTransformer2
    phaseShiftingTransformer2_1(
    V_b=400000,
    Vn=400000,
    m=0.95,
    alpha0=2.0943951023932)
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  Electrical.Buses.Bus          B3(displayPF=true)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Electrical.Buses.Bus          B4(displayPF=true)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Electrical.Buses.InfiniteBus infiniteBus1(displayPF=true)
                                                           annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
equation
  connect(B1.p, pSTransformer.p) annotation (Line(points={{-30,0},{-11,0}}, color={0,0,255}));
  connect(B2.p, pSTransformer.n) annotation (Line(points={{30,0},{11,0}}, color={0,0,255}));
  connect(lOADPQ.p, B2.p) annotation (Line(points={{60,0},{30,0}}, color={0,0,255}));
  connect(infiniteBus.p, B1.p) annotation (Line(points={{-60,0},{-30,0}}, color={0,0,255}));
  connect(pSTransformer.pk, pSTransformer.u) annotation (Line(points={{11,-4},{14,-4},{14,-10},{-18,-10},{-18,5.6},{-12,5.6}}, color={0,0,127}));
  connect(B3.p, phaseShiftingTransformer2_1.p) annotation (Line(points={{-30,-50},{-11,-50}}, color={0,0,255}));
  connect(B4.p, phaseShiftingTransformer2_1.n) annotation (Line(points={{30,-50},{11,-50}}, color={0,0,255}));
  connect(lOADPQ1.p, B4.p) annotation (Line(points={{60,-50},{30,-50}}, color={0,0,255}));
  connect(infiniteBus1.p, B3.p) annotation (Line(points={{-60,-50},{-30,-50}}, color={0,0,255}));
  annotation (experiment(StopTime=10000));
end PhaseShiftingTransformer_Test;
