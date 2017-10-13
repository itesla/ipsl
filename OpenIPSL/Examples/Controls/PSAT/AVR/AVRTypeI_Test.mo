within OpenIPSL.Examples.Controls.PSAT.AVR;
model AVRTypeI_Test
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
    P_0=16.0352698692006,
    Q_0=11.859436505981)
    annotation (Placement(transformation(extent={{-58,-32},{6,32}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{100,80},{124,100}})));
  Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={70,-18},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLinewithOpening1(
    G=0,
    R=0.01,
    X=0.1,
    opening=1,
    B=0.0005,
    t1=2,
    t2=2.15) annotation (Placement(visible=true, transformation(
        origin={110,6},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={70,6},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine3(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={112,-20},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Electrical.Branches.PwLine pwLine4(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(visible=true, transformation(
        origin={110,30},
        extent={{-5.99999,-5.99998},{5.99999,6}},
        rotation=0)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=8,
    Q_0=6,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={144,18},
        extent={{-6,-6},{6,6}},
        rotation=90)));
  Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=8,
    Q_0=6,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={144.034,-20.2889},
        extent={{-6.2889,-6.0335},{6.2889,6.0335}},
        rotation=90)));
  Electrical.Buses.Bus bus
    annotation (Placement(transformation(extent={{40,-16},{60,4}})));
  Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{80,-16},{100,4}})));
  Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{120,8},{140,28}})));
  Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{120,-30},{140,-10}})));
  Electrical.Controls.PSAT.AVR.AVRTypeI aVRI(vrmax=7.57)
    annotation (Placement(transformation(extent={{-26,86},{-46,106}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=20,
    startTime=1,
    height=-0.1) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=0,
        origin={13,99})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-6,96},{-16,106}})));
equation

  connect(order6Type2_Inputs_Outputs.pm0, order6Type2_Inputs_Outputs.pm)
    annotation (Line(points={{-51.6,-35.2},{-51.6,-42},{-51.6,-60},{-80,-60},{-80,
          -16},{-64.4,-16}}, color={0,0,127}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(points={{64.6,6},{56,6},{56,-18},
          {64.6,-18}}, color={0,0,255}));
  connect(pwLine2.n, pwLine1.n) annotation (Line(points={{75.4,6},{84,6},{84,-18},
          {75.4,-18}}, color={0,0,255}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(points={{104.6,30},
          {98,30},{98,6},{104.6,6}}, color={0,0,255}));
  connect(pwLine4.n, pwLinewithOpening1.n) annotation (Line(points={{115.4,30},
          {122,30},{122,6},{115.4,6}}, color={0,0,255}));
  connect(bus.p, pwLine1.p) annotation (Line(points={{50,-6},{56,-6},{56,-18},{
          64.6,-18}}, color={0,0,255}));
  connect(bus1.p, pwLine1.n) annotation (Line(points={{90,-6},{84,-6},{84,-18},
          {75.4,-18}},color={0,0,255}));
  connect(bus1.p, pwLinewithOpening1.p) annotation (Line(points={{90,-6},{94,-6},
          {94,14},{98,14},{98,6},{104.6,6}}, color={0,0,255}));
  connect(pwLine3.p, pwLinewithOpening1.p) annotation (Line(points={{106.6,-20},
          {94,-20},{94,14},{98,14},{98,6},{104.6,6}}, color={0,0,255}));
  connect(bus2.p, pwLoadPQ1.p)
    annotation (Line(points={{130,18},{138,18}}, color={0,0,255}));
  connect(bus2.p, pwLinewithOpening1.n) annotation (Line(points={{130,18},{122,
          18},{122,6},{115.4,6}}, color={0,0,255}));
  connect(bus3.p, pwLoadPQ2.p) annotation (Line(points={{130,-20},{138,-20},{
          138,-20.2889}}, color={0,0,255}));
  connect(pwLine3.n, bus3.p) annotation (Line(points={{117.4,-20},{117.4,-20},{
          130,-20}}, color={0,0,255}));
  connect(bus.p, order6Type2_Inputs_Outputs.p)
    annotation (Line(points={{50,-6},{30,-6},{30,0},{6,0}}, color={0,0,255}));
  connect(aVRI.vf, order6Type2_Inputs_Outputs.vf) annotation (Line(points={{-48,
          96},{-80,96},{-80,16},{-64.4,16}}, color={0,0,127}));
  connect(aVRI.v, order6Type2_Inputs_Outputs.v) annotation (Line(points={{-24,
          90},{22,90},{22,9.6},{9.2,9.6}}, color={0,0,127}));
  connect(aVRI.vf0, order6Type2_Inputs_Outputs.vf0) annotation (Line(points={{-36,
          84},{-42,84},{-42,35.2},{-51.6,35.2}}, color={0,0,127}));
  connect(aVRI.vref0, add.u1) annotation (Line(points={{-36,108},{-36,114},{-5,
          114},{-5,104}}, color={0,0,127}));
  connect(ramp.y, add.u2) annotation (Line(points={{7.5,99},{0.75,99},{0.75,98},
          {-5,98}}, color={0,0,127}));
  connect(add.y, aVRI.vref) annotation (Line(points={{-16.5,101},{-19.25,101},{
          -19.25,102},{-24,102}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation);
end AVRTypeI_Test;
