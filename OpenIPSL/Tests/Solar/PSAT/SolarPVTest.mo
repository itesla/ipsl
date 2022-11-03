within OpenIPSL.Tests.Solar.PSAT;
model SolarPVTest
  "Solar inverter test model of PV variant from PSAT (controlled Active Power and Voltage (P and V))"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Solar.PSAT.ConstantPQPV.PV1 SPV(
    S_b=SysData.S_b,
    Sn=SysData.S_b,
    Q_0=5.416582/100,
    angle_0=0.070492225331847,
    v_0=1.0,
    vref=1.0,
    P_0=0.4) annotation (Placement(transformation(
        origin={-60,0.1033},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=180)));
equation
  connect(SPV.p, GEN1.p) annotation (Line(points={{-49,0.1033},{-39.5,0.1033},{
          -39.5,0},{-30,0}}, color={0,0,255}));
  annotation (                                     experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end SolarPVTest;
