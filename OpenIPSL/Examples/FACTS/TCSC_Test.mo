within OpenIPSL.Examples.FACTS;
model TCSC_Test "Simple model to test the functionality of TCSC"
  extends Modelica.Icons.Example;
  Electrical.Loads.PSAT.PQvar lOADPQ(
    P_0=50000000,
    Q_0=10000000,
    v_0=0.991992,
    angle_0=-0.576411,
    t_start_1=2,
    t_end_1=10,
    dP1=2000000)                                             annotation (Placement(transformation(extent={{-38,-58},
            {-18,-38}})));
  Electrical.FACTS.PSAT.TCSC2 tCSC(
    displayPF=true,
    ctrl=OpenIPSL.Types.Ctrl.xTCSC,
    alpha_min=0.87266462599716,
    alpha_max=1.5707963267949,
    Tr=0.01,
    Kp=2,
    Ki=20,
    XL=0.08,
    alpha0=1.0471975511966,
    pref=-0.0500733,
    G=0,
    B=0,
    xTCSC0=0.0133767)
         annotation (Placement(transformation(extent={{44,16},{64,36}})));
  inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Branches.PwLine pwLineInf(
    displayPF=true,
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
  Electrical.Buses.Bus Gen(angle_0=4.04614,
                           displayPF=true)
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  Electrical.Buses.Bus Load(
    v_0=0.991992,
    angle_0=-0.576411,      displayPF=true)
    annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
  Electrical.Buses.Bus Inf(displayPF=true)
    annotation (Placement(transformation(extent={{74,-10},{94,10}})));
  Electrical.Machines.PSAT.Order2          Gen1(
    D=0,
    angle_0=4.04614,
    ra=0.01,
    x1d=0.302,
    M=10,
    P_0=40000000,
    Q_0=5417240,
    Sn=100000000,
    v_0=1,
    V_b=400000,
    Vn=400000,
    w(fixed=true))
               annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
  Modelica.Blocks.Sources.Constant NoPSS(k=0)
    annotation (Placement(transformation(extent={{-4,50},{16,70}})));
  Electrical.Branches.PwLine pwLineInf1(
    opening=2,
    displayPF=true,
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-34},{40,-14}})));
  Electrical.Branches.PwLine pwLineInf3(
    B=0,
    displayPF=true,
    R=0.001,
    X=0.1,
    G=0) annotation (Placement(transformation(extent={{-8,16},{12,36}})));
  Electrical.Buses.Bus Inter(displayPF=true)
    annotation (Placement(transformation(extent={{20,16},{40,36}})));
  Electrical.Buses.InfiniteBus infiniteBus(P_0=10017100, Q_0=8005930)
    annotation (Placement(transformation(extent={{114,-10},{94,10}})));
equation
  connect(pwLineInf.n, Load.p)
    annotation (Line(points={{-47,0},{-28,0}}, color={0,0,255}));
  connect(tCSC.n, Inf.p)
    annotation (Line(points={{65,26},{76,26},{76,0},{84,0}}, color={0,0,255}));
  connect(Gen.p, pwLineInf.p)
    annotation (Line(points={{-82,0},{-65,0}}, color={0,0,255}));
  connect(Gen1.p, Gen.p)
    annotation (Line(points={{-92,0},{-82,0}}, color={0,0,255}));
  connect(Gen1.pm0, Gen1.pm) annotation (Line(points={{-110,-11},{-110,-16},{-120,
          -16},{-120,-5},{-114,-5}},
                              color={0,0,127}));
  connect(Gen1.vf0, Gen1.vf) annotation (Line(points={{-110,11},{-110,16},{-120,
          16},{-120,5},{-114,5}},
                            color={0,0,127}));
  connect(NoPSS.y, tCSC.Vs_pod)
    annotation (Line(points={{17,60},{54,60},{54,38}}, color={0,0,127}));
  connect(Load.p, pwLineInf1.p) annotation (Line(points={{-28,0},{-22,0},{-22,-24},
          {21,-24}}, color={0,0,255}));
  connect(pwLineInf3.p, pwLineInf1.p) annotation (Line(points={{-7,26},{-22,26},
          {-22,-24},{21,-24}}, color={0,0,255}));
  connect(pwLineInf3.n, Inter.p)
    annotation (Line(points={{11,26},{30,26}}, color={0,0,255}));
  connect(tCSC.p, Inter.p)
    annotation (Line(points={{43.1,26},{30,26}}, color={0,0,255}));
  connect(pwLineInf1.n, Inf.p) annotation (Line(points={{39,-24},{76,-24},{76,0},
          {84,0}}, color={0,0,255}));
  connect(Load.p, lOADPQ.p)
    annotation (Line(points={{-28,0},{-28,-38}}, color={0,0,255}));
  connect(Inf.p, infiniteBus.p)
    annotation (Line(points={{84,0},{94,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10), Documentation(info="<html>
<p>
The parameters are set for varying impedance TCSC. Simulate for 10 seconds. 
</p>
<p>Variables of interest:</p>
<ul>
<li><code>TCSC.pkm</code></code></li>
<li><code>TCSC.x1</code></code></li>
</ul>
</html>"));
end TCSC_Test;
