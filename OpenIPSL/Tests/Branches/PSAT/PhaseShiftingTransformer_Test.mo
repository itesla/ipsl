within OpenIPSL.Tests.Branches.PSAT;
model PhaseShiftingTransformer_Test "Simple model checking the phase shifting transformer"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.PQ lOADPQ annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,0})));
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=true)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=true)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Buses.InfiniteBus infiniteBus(displayPF=true) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Electrical.Branches.PSAT.PhaseShiftingTransformer phaseShiftingTransformer(
    V_b=400000,
    Vn=400000,
    m=0.95,
    pref=0.005,
    alpha0=0.34906585039887) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(lOADPQ.p, B2.p) annotation (Line(points={{60,0},{30,0}}, color={0,0,255}));
  connect(infiniteBus.p, B1.p) annotation (Line(points={{-60,0},{-30,0}}, color={0,0,255}));
  connect(B1.p, phaseShiftingTransformer.p) annotation (Line(points={{-30,0},{-11,0}}, color={0,0,255}));
  connect(phaseShiftingTransformer.n, B2.p) annotation (Line(points={{11,0},{30,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10000), Documentation(info="<html>
<p>
This model needs to be simulated for at least 10,000 seconds.
</p>
<p>Variables of interest:</p>
<ul>
<li><code>phaseShiftingTransformer.pref</code> vs <code>phaseShiftingTransformer.pk</code></li>
<li><code>phaseShiftingTransformer.anglevm</code> vs <code>phaseShiftingTransformer.anglevk</code></li>
</ul>
</html>"));
end PhaseShiftingTransformer_Test;
