within KundurSMIB;
model SMIB

  iPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  iPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{-32,-12},{-8,12}})));
  iPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{48,-12},{72,12}})));
  Generation_Groups.Generator G1 annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  iPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    Sn=2220,
    x=0.15,
    r=0,
    V_b=400,
    Vn=400) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  iPSL.Electrical.Branches.PwLine line_1(
    R=0,
    G=0,
    B=0,
    X=0.5) annotation (Placement(transformation(extent={{10,10},{30,30}})));
  iPSL.Electrical.Loads.PSAT.LOADPQ load(
    Sn=100,
    P_0=19.979999999894400,
    Q_0=-0.870664705119217) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={80,-26})));
  iPSL.Electrical.Buses.InfiniteBus infinite_bus(V=0.90081, angle=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={110,0})));
  iPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01) annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  iPSL.Electrical.Branches.PwLine line_2(
    R=0,
    G=0,
    B=0,
    X=0.93) annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
  inner iPSL.Electrical.SystemBase SysData(S_b=2220, fn=60) annotation (Placement(transformation(extent={{-140,80},{-86,100}})));
equation
  connect(G1.pwPin, B1.p) annotation (Line(points={{-99,0},{-80,0}}, color={0,0,255}));
  connect(B1.p, transformer.p) annotation (Line(points={{-80,0},{-70,0},{-61,0}}, color={0,0,255}));
  connect(transformer.n, B2.p) annotation (Line(points={{-39,0},{-20,0}}, color={0,0,255}));
  connect(B2.p, line_1.p) annotation (Line(points={{-20,0},{-14,0},{-10,0},{-10,20},{13,20}}, color={0,0,255}));
  connect(line_1.n, B3.p) annotation (Line(points={{27,20},{50,20},{50,0},{60,0}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p) annotation (Line(points={{60,0},{80,0},{99,0}}, color={0,0,255}));
  connect(load.p, infinite_bus.p) annotation (Line(points={{80,-19.4},{80,0},{99,0},{99,1.38778e-015}}, color={0,0,255}));
  connect(fault.p, line_1.p) annotation (Line(points={{-1.66667,-50},{-14,-50},{-14,0},{-10,0},{-10,20},{13,20}}, color={0,0,255}));
  connect(line_2.n, B3.p) annotation (Line(points={{27,-20},{50,-20},{50,0},{60,0}}, color={0,0,255}));
  connect(line_2.p, line_1.p) annotation (Line(points={{13,-20},{-10,-20},{-10,20},{13,20}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}}, preserveAspectRatio=false), graphics={Text(
          extent={{-120,100},{100,80}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Example 1: Single-machine infinite bus model*"), Text(
          extent={{-164,-88},{54,-106}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="*P. Kundur, \"Power System Stability and Control\", Example 13.2")}),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput);
end SMIB;
