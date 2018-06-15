within FOSSEE1.Examples.Loads.PSAT;
model Loadtest3 "TODO Document what this model is about"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.001/2) annotation (Placement(visible=true, transformation(
        origin={39.8634,-10.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={39.8634,9.3286},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={85,-10},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={85,10},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add31 annotation (Placement(visible=true,
        transformation(
        origin={-45,38.9829},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true,
        transformation(
        origin={-79.1062,59.6621},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2) annotation (
      Placement(visible=true, transformation(
        origin={-107.783,65.985},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1) annotation (
     Placement(visible=true, transformation(
        origin={-107.783,50.985},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2) annotation (
      Placement(visible=true, transformation(
        origin={-107.783,35.4652},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={-79.1062,39.6621},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-107.382,19.4802},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine3(
    amplitude=0.001,
    freqHz=0.2,
    startTime=10) annotation (Placement(visible=true, transformation(
        origin={-107.382,-51.5048},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(visible=true,
        transformation(
        origin={-79.1062,-31.3229},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Sources.Sine sine4(
    amplitude=0.001,
    freqHz=0.2,
    startTime=5) annotation (Placement(visible=true, transformation(
        origin={-107.783,-35.5198},
        extent={{-4.4802,-4.4802},{4.4802,4.4802}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1) annotation (
     Placement(visible=true, transformation(
        origin={-107.783,-20},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7) annotation (
      Placement(visible=true, transformation(
        origin={-107.783,-5},
        extent={{-5.0,-5.0},{5.0,5.0}},
        rotation=0)));
  Modelica.Blocks.Math.Add add4 annotation (Placement(visible=true,
        transformation(
        origin={-79.1062,-11.3229},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}},
        rotation=0)));
  Modelica.Blocks.Math.Add3 add32 annotation (Placement(visible=true,
        transformation(
        origin={-45,-32.0021},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_Inputs_Outputs1(
    P_0=0.0800989878477798,
    Q_0=0.0570163388727956,
    Sn=20,
    V_b=400,
    V_0=1,
    angle_0=0,
    Vn=400,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    xd=1.9,
    T1d0=8,
    xq=1.7) annotation (Placement(visible=true, transformation(
        origin={3.3113,4.2487},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  FOSSEE1.Loads.PSAT.ThermostatLoad3 ThLoad(
    Sn=10,
    Q_0=0.6,
    P_0=0.8) annotation (Placement(visible=true, transformation(
        origin={117.154,-25},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{50,80},{115,100}})));
equation
  connect(pwLine4.n, ThLoad.p) annotation (Line(
      visible=true,
      origin={101.577,10},
      points={{-7.577,0},{15.577,0},{15.577,-25}}));
  connect(pwLine4.n, pwLine3.n) annotation (Line(
      visible=true,
      origin={92,0},
      points={{2,10},{2,5},{5,5},{5,0},{2,0},{2,-10}}));
  connect(pwLine3.p, pwLine4.p) annotation (Line(
      visible=true,
      origin={78,0},
      points={{-2,-10},{-2,-5},{-5,-5},{-5,0},{-2,0},{-2,10}}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      visible=true,
      origin={67.2159,-10.3357},
      points={{-18.3525,-0.3357},{4.7841,-0.3357},{4.7841,0.3357},{8.7841,
          0.3357}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      visible=true,
      origin={67.2159,9.6643},
      points={{-18.3525,-0.3357},{4.7841,-0.3357},{4.7841,0.3357},{8.7841,
          0.3357}}));
  connect(order3_Inputs_Outputs1.pm0, add32.u3) annotation (Line(
      visible=true,
      origin={-44.0108,-56.4898},
      points={{39.3221,49.7385},{41.1619,49.7385},{41.1619,-23.5102},{
          -38.8284,-23.5102},{-38.8284,16.4877},{-12.9892,16.4877}},
      color={0,0,127}));
  connect(order3_Inputs_Outputs1.vf0, add31.u3) annotation (Line(
      visible=true,
      origin={-21.3443,22.0517},
      points={{16.6556,-6.803},{38.6557,-6.803},{38.6557,-0.1282},{-38.6557,-0.1282},
          {-38.6557,8.9312},{-35.6557,8.9312}},
      color={0,0,127}));
  connect(add31.y, order3_Inputs_Outputs1.vf) annotation (Line(
      visible=true,
      origin={-28.1135,19.629},
      points={{-5.8865,19.3539},{-2.8865,19.3539},{-2.8865,-9.629},{-3.8826,
          -9.629},{-3.8826,-10.3803},{19.4248,-10.3803}},
      color={0,0,127}));
  connect(add32.y, order3_Inputs_Outputs1.pm) annotation (Line(
      visible=true,
      origin={-28.216,-20.5845},
      points={{-5.784,-11.4176},{-2.784,-11.4176},{-2.784,-9.4155},{-4.0877,
          -9.4155},{-4.0877,19.8332},{19.5273,19.8332}},
      color={0,0,127}));
  connect(step3.y, add4.u2) annotation (Line(
      visible=true,
      origin={-92.0911,-17.5583},
      points={{-10.1919,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,
          2.44166}},
      color={0,0,127}));
  connect(add3.y, add32.u2) annotation (Line(
      visible=true,
      origin={-62.2878,-31.6625},
      points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
      color={0,0,127}));
  connect(step4.y, add4.u1) annotation (Line(
      visible=true,
      origin={-92.0911,-6.2646},
      points={{-10.1919,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,
          -1.26456}},
      color={0,0,127}));
  connect(add4.y, add32.u1) annotation (Line(
      visible=true,
      origin={-62.2878,-17.6625},
      points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
      color={0,0,127}));
  connect(add3.u2, sine3.y) annotation (Line(
      visible=true,
      origin={-95.6692,-44.1821},
      points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78458,
          -5.4041},{-6.78458,-7.3227}},
      color={0,0,127}));
  connect(sine4.y, add3.u1) annotation (Line(
      visible=true,
      origin={-93.5606,-30.5207},
      points={{-9.29418,-4.9991},{-1.4394,-4.9991},{-1.4394,2.99154},{
          6.86692,2.99154}},
      color={0,0,127}));
  connect(sine1.y, add2.u1) annotation (Line(
      visible=true,
      origin={-93.5606,40.4643},
      points={{-9.29418,-4.9991},{-1.4394,-4.9991},{-1.4394,2.99154},{
          6.86692,2.99154}},
      color={0,0,127}));
  connect(add2.u2, sine2.y) annotation (Line(
      visible=true,
      origin={-95.6692,26.8029},
      points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78458,
          -5.4041},{-6.78458,-7.3227}},
      color={0,0,127}));
  connect(step2.y, add1.u2) annotation (Line(
      visible=true,
      origin={-92.0911,53.4267},
      points={{-10.1919,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,
          2.44166}},
      color={0,0,127}));
  connect(step1.y, add1.u1) annotation (Line(
      visible=true,
      origin={-92.0911,64.7204},
      points={{-10.1919,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,
          -1.26456}},
      color={0,0,127}));
  connect(add1.y, add31.u1) annotation (Line(
      visible=true,
      origin={-62.2878,53.3225},
      points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
      color={0,0,127}));
  connect(add2.y, add31.u2) annotation (Line(
      visible=true,
      origin={-62.2878,39.3225},
      points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
      color={0,0,127}));
  connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
      visible=true,
      origin={25.2254,6.7135},
      points={{-11.9141,-2.4648},{1.638,-2.4648},{1.638,2.6151},{5.638,2.6151}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={46.8634,-0.6714},
      points={{2,-10},{2,-5},{5,-5},{5,0},{2,0},{2,10}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={32.8634,-0.6714},
      points={{-2,10},{-2,5},{-5,5},{-5,0},{-2,0},{-2,-10}}));

end Loadtest3;
