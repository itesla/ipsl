within OpenIPSL.Examples.Tutorial.Example_4.Experiments;
model SMIB
  extends Modelica.Icons.Example;
  extends BaseModels.BaseNetwork.SMIBPartial( pf(redeclare record PowerFlow =
          PFData.PF00000));
  replaceable BaseModels.GeneratingUnits.GeneratorTurbGovAVR genunit(
    P_0=pf.powerflow.machine.PG1,
    Q_0=pf.powerflow.machine.QG1,
    v_0=pf.powerflow.bus.v1,
    angle_0=pf.powerflow.bus.A1,
    displayPF=true) constrainedby OpenIPSL.Interfaces.Generator
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
equation
  connect(genunit.pwPin, B01.p)
    annotation (Line(points={{-69,0},{-60,0}}, color={0,0,255}));
  annotation (experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06));
end SMIB;
