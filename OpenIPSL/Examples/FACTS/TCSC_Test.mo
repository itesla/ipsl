within OpenIPSL.Examples.FACTS;
model TCSC_Test "Simple model to test the functionality of TCSC"
  extends Modelica.Icons.Example;
  Electrical.Machines.PSSE.GENCLS Syn1(M_b(displayUnit="MVA")) annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Electrical.Loads.PSAT.PQvar lOADPQ(dQ1=100000, dQ2=700000) annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Electrical.FACTS.PSAT.TCSCAlpha
                             tCSCAlpha(
    displayPF=true,
    alpha_TCSCO=1.5,
    pref=0.02,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Branches.PwLine pwLineInf(
    displayPF=true,
    R=0.0001,
    X=0,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Electrical.Buses.Bus busInf(displayPF=true) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Electrical.Buses.Bus busSplit(displayPF=true) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Electrical.Buses.Bus busLoad(displayPF=true) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  connect(tCSCAlpha.n, lOADPQ.p) annotation (Line(points={{41,0},{80,0},{80,-20}}, color={0,0,255}));
  connect(Syn1.p, pwLineInf.p) annotation (Line(points={{-70,0},{-39,0}}, color={0,0,255}));
  connect(pwLineInf.n, tCSCAlpha.p) annotation (Line(points={{-21,0},{19.1,0}}, color={0,0,255}));
  connect(Syn1.p, busInf.p) annotation (Line(points={{-70,0},{-60,0}}, color={0,0,255}));
  connect(pwLineInf.n, busSplit.p) annotation (Line(points={{-21,0},{0,0}}, color={0,0,255}));
  connect(tCSCAlpha.n, busLoad.p) annotation (Line(points={{41,0},{60,0}}, color={0,0,255}));
  annotation (experiment(StopTime=5), Documentation(info="<html>
<p>
Simulate for 5 seconds. 
</p>
<p>Variables of interest:</p>
<ul>
<li><code>TCSC.Q</code></code></li>
<li><code>TCSC.alpha</code></code></li>
</ul>
</html>"));
end TCSC_Test;
