within OpenIPSL.Examples.Controls.PSAT.AVR;
model AVRTypeII_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6Type2_Inputs_Outputs(
    V_0=1,
    angle_0=0,
    V_b=200,
    Sn=370,
    Vn=200,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    P_0=16.0062,
    Q_0=12.476)
    annotation (Placement(transformation(extent={{-86,-18},{-46,22}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII exciter_Type_II(
    vrmin=-5,
    vrmax=5,
    Ta=0.1,
    Te=1,
    Tr=0.001,
    Ae=0.0006,
    Be=0.9,
    Kf=0.45,
    Tf=1,
    Ka=400,
    Ke=0.01) annotation (Placement(transformation(extent={{-70,34},{-94,56}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{76,78},{100,98}})));
  Electrical.Branches.PwLine pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    displayPF=true,
    B=2*0.0005) annotation (Placement(visible=true, transformation(
        origin={-4,2},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine3(
    G=0,
    R=0.01,
    X=0.1,
    B=2*0.0005) annotation (Placement(visible=true, transformation(
        origin={40,-18},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine4(
    G=0,
    R=0.01,
    X=0.1,
    displayPF=true,
    B=2*0.0005) annotation (Placement(visible=true, transformation(
        origin={38,22},
        extent={{-5.99999,-5.99998},{5.99999,6}},
        rotation=0)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=8,
    Q_0=6,
    V_b=200,
    V_0=0.97905,
    angle_0=-1.3001) annotation (Placement(visible=true, transformation(
        origin={72,22},
        extent={{-6,-6},{6,6}},
        rotation=90)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=8,
    Q_0=6,
    V_b=200,
    V_0=0.97905,
    angle_0=-1.3001) annotation (Placement(visible=true, transformation(
        origin={72.034,-18.2889},
        extent={{-6.2889,-6.0335},{6.2889,6.0335}},
        rotation=90)));
  Electrical.Buses.Bus Bus1(
    V_b=200,
    V_0=1,
    angle_0=0)
    annotation (Placement(transformation(extent={{-34,-8},{-14,12}})));
  Electrical.Buses.Bus Bus2(
    V_b=200,
    V_0=0.986,
    angle_0=-0.86075)
    annotation (Placement(transformation(extent={{6,-8},{26,12}})));
  Electrical.Buses.Bus Bus3(
    V_b=200,
    angle_0=-1.3001,
    V_0=0.97905)
    annotation (Placement(transformation(extent={{48,12},{68,32}})));
  Electrical.Buses.Bus Bus4(
    V_b=200,
    angle_0=-1.3001,
    V_0=0.97905)
    annotation (Placement(transformation(extent={{48,-28},{68,-8}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-48,46},{-58,56}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-0.1,
    duration=20,
    startTime=1) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=0,
        origin={-33,49})));
equation

  connect(order6Type2_Inputs_Outputs.v, exciter_Type_II.v) annotation (Line(
      points={{-44,8},{-40,8},{-40,38.4},{-67.6,38.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Bus3.p, pwLoadPQ1.p)
    annotation (Line(points={{58,22},{66,22}}, color={0,0,255}));
  connect(Bus4.p, pwLoadPQ2.p) annotation (Line(points={{58,-18},{66.0005,-18},
          {66.0005,-18.2889}}, color={0,0,255}));
  connect(pwLine3.n, Bus4.p)
    annotation (Line(points={{45.4,-18},{58,-18}}, color={0,0,255}));
  connect(Bus1.p, order6Type2_Inputs_Outputs.p)
    annotation (Line(points={{-24,2},{-46,2}}, color={0,0,255}));
  connect(exciter_Type_II.vref, add.y) annotation (Line(points={{-67.6,51.6},{
          -64,51.6},{-64,52},{-62,52},{-62,51},{-58.5,51}}, color={0,0,127}));
  connect(ramp.y, add.u2) annotation (Line(points={{-38.5,49},{-42.25,49},{
          -42.25,48},{-47,48}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.pm0, order6Type2_Inputs_Outputs.pm)
    annotation (Line(points={{-82,-20},{-82,-24},{-94,-24},{-94,-8},{-90,-8}},
        color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.vf, exciter_Type_II.vf) annotation (Line(
        points={{-90,12},{-96.4,12},{-96.4,45}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.vf0, exciter_Type_II.vf0)
    annotation (Line(points={{-82,24},{-82,31.8}}, color={0,0,127}));
  connect(Bus1.p, pwLine2.p)
    annotation (Line(points={{-24,2},{-9.4,2}}, color={0,0,255}));
  connect(pwLine2.n, Bus2.p)
    annotation (Line(points={{1.4,2},{16,2}}, color={0,0,255}));
  connect(pwLine4.p, Bus2.p) annotation (Line(points={{32.6,22},{28,22},{28,2},
          {16,2}}, color={0,0,255}));
  connect(Bus3.p, pwLine4.n)
    annotation (Line(points={{58,22},{43.4,22}}, color={0,0,255}));
  connect(pwLine3.p, Bus2.p) annotation (Line(points={{34.6,-18},{28,-18},{28,2},
          {16,2}}, color={0,0,255}));
  connect(add.u1, exciter_Type_II.vref0) annotation (Line(points={{-47,54},{-44,
          54},{-44,64},{-82,64},{-82,58.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation,
    experiment(StopTime=20),
    __Dymola_experimentSetupOutput);
end AVRTypeII_Test;
