within OpenIPSL.Examples.FACTS;
model StatcomCode_Test2
  import Modelica.Constants.pi;
//   extends BaseClasses.SMIB(
//     pwLine(displayPF=true),
//     pwLine4(displayPF=true),
//     pwLine2(displayPF=true),
//     GEN1(displayPF=true),
//     GEN2(displayPF=true),
//     pwLine1(displayPF=true),
//     pwLine3(displayPF=true));
   extends Modelica.Icons.Example;
  OpenIPSL.Electrical.FACTS.PSAT.STATCOM sTATCOM3_1(
    angle_0(displayUnit="rad"),
    Qg=0.02,
    Kr=0.1)
    annotation (Placement(transformation(extent={{92,30},{72,50}})));
  Electrical.Machines.PSSE.GENCLS Syn1(M_b(displayUnit="MVA")) annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Electrical.Branches.PwLine pwLineSC(
    displayPF=true,
    R=0.0001,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Electrical.Loads.PSAT.PQvar                     lOADPQ(dQ1=100000, dQ2=700000)
                               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Electrical.Branches.PwLine pwLineLoad(
    displayPF=true,
    R=0.0001,
    X=0,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  inner Electrical.SystemBase          SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Branches.PwLine pwLineInf(
    displayPF=true,
    R=0.0001,
    X=0,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Electrical.Buses.Bus busInf(displayPF=true) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Electrical.Buses.Bus busSplit(displayPF=true) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Electrical.Buses.Bus busSC(displayPF=true) annotation (Placement(transformation(extent={{50,30},{70,50}})));
  Electrical.Buses.Bus busLoad(displayPF=true) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  connect(pwLineLoad.n, lOADPQ.p) annotation (Line(points={{39,0},{80,0},{80,-20}}, color={0,0,255}));
  connect(pwLineSC.n, sTATCOM3_1.p) annotation (Line(points={{39,40},{71,40}}, color={0,0,255}));
  connect(Syn1.p, pwLineInf.p) annotation (Line(points={{-70,0},{-39,0}}, color={0,0,255}));
  connect(pwLineInf.n, pwLineLoad.p) annotation (Line(points={{-21,0},{21,0}}, color={0,0,255}));
  connect(pwLineSC.p, pwLineLoad.p) annotation (Line(points={{21,40},{0,40},{0,0},{21,0}}, color={0,0,255}));
  connect(Syn1.p, busInf.p) annotation (Line(points={{-70,0},{-60,0}}, color={0,0,255}));
  connect(pwLineInf.n, busSplit.p) annotation (Line(points={{-21,0},{0,0}}, color={0,0,255}));
  connect(pwLineSC.n, busSC.p) annotation (Line(points={{39,40},{60,40}}, color={0,0,255}));
  connect(pwLineLoad.n, busLoad.p) annotation (Line(points={{39,0},{60,0}}, color={0,0,255}));
  annotation (
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>KTH own Model, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"), experiment(StopTime=10));
end StatcomCode_Test2;
