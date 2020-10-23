within OpenIPSL.Examples.Wind.PSAT;
model WT_Test
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3.PSAT_WT dfig_Turbine(
    V_b=1,
    angle_0=0.00161587015139445,
    P_0=0.016,
    Q_0=-0.002086945,
    fn=50,
    poles=2,
    vw_base=15,
    Pnom=10,
    ngb=1/89) annotation (Placement(transformation(origin={50,0}, extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    B=0.001,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(origin={-2,0}, extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Wind.WindGenerator windGenerator1(
    v0=0.537631527453836,
    typ=3,
    tstop=15,
    sigma=1,
    vmax=25/15,
    wmag=-0.2) annotation (Placement(transformation(
        origin={30,30},
        extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(angle_0=0, v_0=1) annotation (Placement(transformation(origin={-50,0}, extent={{-10,-10},{10,10}})));
  inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
equation
  connect(infiniteBus.p, pwLine.p) annotation (Line(
      origin={-14.8299,-1},
      points={{-25.1701,1},{3.8299,1}},
      color={0,0,255}));
  connect(windGenerator1.Vw, dfig_Turbine.Wind_Speed) annotation (Line(
      origin={37.101,18.2663},
      points={{3.899,11.7337},{12.899,11.7337},{12.899,-10.4673}},
      color={0,0,127}));
  connect(pwLine.n, dfig_Turbine.pin) annotation (Line(
      origin={18.6013,-1},
      points={{-11.6013,1},{20.3987,1}},
      color={0,0,255}));
  annotation (experiment(StopTime=20));
end WT_Test;
