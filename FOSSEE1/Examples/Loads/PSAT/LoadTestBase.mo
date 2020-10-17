within FOSSEE1.Examples.Loads.PSAT;
partial model LoadTestBase "Base class for the different load cases"
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={9.9317,10.1643},
        extent={{-10.0683,-9.8357},{10.0683,9.8357}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.001/2) annotation (Placement(visible=true, transformation(
        origin={10,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={50,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={50,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Step Vstep1(height=0.0005, startTime=2) annotation (Placement(visible=true, transformation(
        origin={-84,64},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  Modelica.Blocks.Sources.Step Vstep2(height=-0.0005, startTime=2.1) annotation (Placement(visible=true, transformation(
        origin={-84,50},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine Vsine1(amplitude=0.001, freqHz=0.2) annotation (Placement(visible=true, transformation(
        origin={-84,32},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine Vsine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5,
    phase=3.1415926535898) annotation (Placement(visible=true, transformation(
        origin={-83.9311,16},
        extent={{-3.9311,-4},{3.9311,4}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine Psine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=10,
    phase=3.1415926535898) annotation (Placement(visible=true, transformation(
        origin={-84,-64},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine Psine1(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-84,-50},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  Modelica.Blocks.Sources.Step Pstep2(height=-0.0005, startTime=7.1) annotation (Placement(visible=true, transformation(
        origin={-84,-30},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  Modelica.Blocks.Sources.Step Pstep1(height=0.0005, startTime=7) annotation (Placement(visible=true, transformation(
        origin={-84,-16},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_Inputs_Outputs1(
    P_0=0.08009898784778,
    Q_0=0.057016338872796,
    Sn=20,
    V_b=400,
    angle_0=0,
    Vn=400,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    xd=1.9,
    T1d0=8,
    xq=1.7) annotation (Placement(visible=true, transformation(
        origin={-30,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Modelica.Blocks.Math.MultiSum sumV(nu=5) annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Modelica.Blocks.Math.MultiSum sumP(nu=5) annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
equation

  connect(Vstep1.y, sumV.u[1]) annotation (Line(points={{-79.6,64},{-68,64},{-68,45.6},{-60,45.6}}, color={0,0,127}));
  connect(Vstep2.y, sumV.u[2]) annotation (Line(points={{-79.6,50},{-70,50},{-70,42.8},{-60,42.8}}, color={0,0,127}));
  connect(Vsine1.y, sumV.u[3]) annotation (Line(points={{-79.6,32},{-70,32},{-70,40},{-60,40}}, color={0,0,127}));
  connect(Vsine2.y, sumV.u[4]) annotation (Line(points={{-79.6069,16},{-68,16},{-68,37.2},{-60,37.2}}, color={0,0,127}));
  connect(sumV.y, order3_Inputs_Outputs1.vf) annotation (Line(points={{-38.3,40},{-30,40},{-30,20},{-50,20},{-50,5},{-42,5}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.vf0, sumV.u[5]) annotation (Line(points={{-38,11},{-38,26},{-64,26},{-64,34},{-60,34},{-60,34.4}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.pm0, sumP.u[1]) annotation (Line(points={{-38,-11},{-38,-16},{-64,-16},{-64,-34.4},{-60,-34.4}}, color={0,0,127}));
  connect(Pstep1.y, sumP.u[2]) annotation (Line(points={{-79.6,-16},{-68,-16},{-68,-37.2},{-60,-37.2}}, color={0,0,127}));
  connect(Pstep2.y, sumP.u[3]) annotation (Line(points={{-79.6,-30},{-70,-30},{-70,-40},{-60,-40}}, color={0,0,127}));
  connect(Psine1.y, sumP.u[4]) annotation (Line(points={{-79.6,-50},{-70,-50},{-70,-42.8},{-60,-42.8}}, color={0,0,127}));
  connect(Psine2.y, sumP.u[5]) annotation (Line(points={{-79.6,-64},{-68,-64},{-68,-45.6},{-60,-45.6}}, color={0,0,127}));
  connect(sumP.y, order3_Inputs_Outputs1.pm) annotation (Line(points={{-38.3,-40},{-32,-40},{-32,-20},{-50,-20},{-50,-5},{-42,-5}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(points={{-20,0},{-8,0},{-8,10.1643},{0.87023,10.1643}}, color={0,0,255}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(points={{18.9932,10.1643},{41,10.1643},{41,10}}, color={0,0,255}));
  connect(pwLine4.n, pwLine3.n) annotation (Line(points={{59,10},{62,10},{62,-10},{59,-10}}, color={0,0,255}));
  connect(pwLine1.p, order3_Inputs_Outputs1.p) annotation (Line(points={{1,-10},{-8,-10},{-8,0},{-20,0}}, color={0,0,255}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(points={{19,-10},{41,-10}}, color={0,0,255}));
  connect(pwLine2.n, pwLine1.n) annotation (Line(points={{18.9932,10.1643},{30,10.1643},{30,-10},{19,-10}}, color={0,0,255}));
end LoadTestBase;
