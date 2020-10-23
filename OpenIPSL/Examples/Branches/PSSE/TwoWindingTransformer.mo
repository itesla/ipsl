within OpenIPSL.Examples.Branches.PSSE;
model TwoWindingTransformer "SMIB system with one load and GENROE model"
  extends BaseClasses.SMIB;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENROE(
    Tpd0=5,
    D=0,
    Xppd=0.2,
    Xl=0.12,
    Xppq=0.2,
    Tppd0=0.05,
    Tppq0=0.1,
    H=4,
    Xd=1.41,
    Xq=1.35,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    R_a=0.002,
    angle_0=4.747869,
    M_b=100000000,
    P_0=40000000,
    Q_0=-16460280,
    v_0=1,
    V_b=14700) annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    CZ=1,
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    S_n=1,
    ANG1=1,
    VB1=14.7,
    VB2=130,
    t1=0.8085,
    VNOM1=20,
    t2=1.02,
    VNOM2=130,
    CW=3) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-94.4,6},{-100,6},{-100,20},{-62,20},{-62,6},{-66.8,6}},
                                                       color={0,0,127}));
  connect(gENROE.EFD, gENROE.EFD0) annotation (Line(points={{-94.4,-6},{-100,-6},{-100,-20},{-62,-20},{-62,-6},{-66.8,-6}},
                                                       color={0,0,127}));
  connect(twoWindingTransformer.n, GEN1.p) annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  connect(gENROE.p, twoWindingTransformer.p) annotation (Line(points={{-68,0},{-64,0},{-64,0},{-61,0}}, color={0,0,255}));
  annotation (experiment(StopTime=1));
end TwoWindingTransformer;
