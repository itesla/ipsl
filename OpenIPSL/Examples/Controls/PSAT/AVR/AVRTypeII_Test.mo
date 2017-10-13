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
    annotation (Placement(transformation(extent={{-58,-32},{6,32}})));
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
    Ke=0.01) annotation (Placement(transformation(extent={{-22,54},{-84,106}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{100,80},{124,100}})));
  Electrical.Branches.PwLine pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    displayPF=true,
    B=2*0.0005) annotation (Placement(visible=true, transformation(
        origin={68,0},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine3(
    G=0,
    R=0.01,
    X=0.1,
    B=2*0.0005) annotation (Placement(visible=true, transformation(
        origin={112,-20},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine4(
    G=0,
    R=0.01,
    X=0.1,
    displayPF=true,
    B=2*0.0005) annotation (Placement(visible=true, transformation(
        origin={110,20},
        extent={{-5.99999,-5.99998},{5.99999,6}},
        rotation=0)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=8,
    Q_0=6,
    V_b=200,
    V_0=0.97905,
    angle_0=-1.3001) annotation (Placement(visible=true, transformation(
        origin={144,20},
        extent={{-6,-6},{6,6}},
        rotation=90)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=8,
    Q_0=6,
    V_b=200,
    V_0=0.97905,
    angle_0=-1.3001) annotation (Placement(visible=true, transformation(
        origin={144.034,-20.2889},
        extent={{-6.2889,-6.0335},{6.2889,6.0335}},
        rotation=90)));
  Electrical.Buses.Bus Bus1(
    V_b=200,
    V_0=1,
    angle_0=0) annotation (Placement(transformation(extent={{38,-10},{58,10}})));
  Electrical.Buses.Bus Bus2(
    V_b=200,
    V_0=0.986,
    angle_0=-0.86075)
    annotation (Placement(transformation(extent={{78,-10},{98,10}})));
  Electrical.Buses.Bus Bus3(
    V_b=200,
    angle_0=-1.3001,
    V_0=0.97905)
    annotation (Placement(transformation(extent={{120,10},{140,30}})));
  Electrical.Buses.Bus Bus4(
    V_b=200,
    angle_0=-1.3001,
    V_0=0.97905)
    annotation (Placement(transformation(extent={{120,-30},{140,-10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{12,90},{2,100}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-0.1,
    duration=20,
    startTime=1) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=0,
        origin={47,75})));
equation

  connect(order6Type2_Inputs_Outputs.v, exciter_Type_II.v) annotation (Line(
      points={{9.2,9.6},{24,9.6},{24,64.4},{-15.8,64.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Bus3.p, pwLoadPQ1.p)
    annotation (Line(points={{130,20},{134,20},{138,20}}, color={0,0,255}));
  connect(Bus4.p, pwLoadPQ2.p) annotation (Line(points={{130,-20},{138,-20},{
          138,-20.2889}}, color={0,0,255}));
  connect(pwLine3.n, Bus4.p) annotation (Line(points={{117.4,-20},{117.4,-20},{
          130,-20}}, color={0,0,255}));
  connect(Bus1.p, order6Type2_Inputs_Outputs.p)
    annotation (Line(points={{48,0},{30,0},{6,0}}, color={0,0,255}));
  connect(exciter_Type_II.vref, add.y) annotation (Line(points={{-15.8,95.6},{-5.9,
          95.6},{-5.9,95},{1.5,95}}, color={0,0,127}));
  connect(ramp.y, add.u2) annotation (Line(points={{41.5,75},{27.75,75},{27.75,
          92},{13,92}}, color={0,0,127}));
  connect(add.u1, exciter_Type_II.vref0) annotation (Line(points={{13,98},{14,
          98},{14,111.2},{-53,111.2}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.pm0, order6Type2_Inputs_Outputs.pm)
    annotation (Line(points={{-51.6,-35.2},{-51.6,-60},{-80,-60},{-80,-16},{-64.4,
          -16}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.vf, exciter_Type_II.vf) annotation (Line(
        points={{-64.4,16},{-80,16},{-80,18},{-90.2,18},{-90.2,80}}, color={0,0,
          127}));
  connect(order6Type2_Inputs_Outputs.vf0, exciter_Type_II.vf0) annotation (Line(
        points={{-51.6,35.2},{-51.6,41.6},{-53,41.6},{-53,48.8}}, color={0,0,
          127}));
  connect(Bus1.p, pwLine2.p)
    annotation (Line(points={{48,0},{56,0},{62.6,0}}, color={0,0,255}));
  connect(pwLine2.n, Bus2.p)
    annotation (Line(points={{73.4,0},{88,0}}, color={0,0,255}));
  connect(pwLine4.p, Bus2.p) annotation (Line(points={{104.6,20},{100,20},{100,
          0},{88,0}}, color={0,0,255}));
  connect(Bus3.p, pwLine4.n) annotation (Line(points={{130,20},{115.4,20},{
          115.4,20}}, color={0,0,255}));
  connect(pwLine3.p, Bus2.p) annotation (Line(points={{106.6,-20},{100,-20},{
          100,0},{88,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation,
    experiment(StopTime=20),
    __Dymola_experimentSetupOutput);
end AVRTypeII_Test;
