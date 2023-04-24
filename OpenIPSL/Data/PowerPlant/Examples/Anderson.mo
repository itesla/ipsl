within OpenIPSL.Data.PowerPlant.Examples;
model Anderson
  "SMIB system to learn how to use the data set records (Anderson book)"
  extends OpenIPSL.Tests.BaseClasses.SMIB(constantLoad(
      P_0=powerFlow.powerflow.loads.PL1,
      Q_0=powerFlow.powerflow.loads.QL1,
      v_0=powerFlow.powerflow.bus.v3,
      angle_0=powerFlow.powerflow.bus.A3), gENCLS(
      P_0=powerFlow.powerflow.machines.PG2,
      Q_0=powerFlow.powerflow.machines.QG2,
      v_0=powerFlow.powerflow.bus.v2,
      angle_0=powerFlow.powerflow.bus.A2));
  GenerationGroup.Generator2  generator1(
    P_0=powerFlow.powerflow.machines.PG1,
    enableP_0=true,
    Q_0=powerFlow.powerflow.machines.QG1,
    enableQ_0=true,
    v_0=powerFlow.powerflow.bus.v1,
    enablev_0=true,
    angle_0=powerFlow.powerflow.bus.A1,
    enableangle_0=true,
    redeclare record GUnitDynamics =
        OpenIPSL.Data.PowerPlant.Anderson.Steam.Fossil.AndersonF15)
    annotation (Placement(transformation(rotation=0, extent={{-60,-10},{-40,10}})));
  PFData.PowerFlow powerFlow(redeclare record PowerFlow = PFData.PF00050)
    annotation (Placement(transformation(extent={{-90,32},{-70,52}})));
equation
  connect(generator1.pwPin, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  annotation (
experiment(
      StopTime=20,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>
This example demonstrates the use of records with synchronous machine,
excitation system, power system stabilizer and turbine-governor model parameters,
based on data sets published in the &quot;Power System Control and Stability&quot; book.
The generator group for this example includes a
<a href=\"modelica://OpenIPSL.Electrical.Machines.PSSE.GENROE\">GENROE</a>
machine together with an
<a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.ES.ESDC1A\">ESDC1A</a>
excitation system model, an
<a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.PSS.IEE2ST\">IEE2ST</a>
PSS model and an
<a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO\">IEESGO</a>
turbine-governor model.
</p>
<h5>Instructions</h5>
<p>
Please start by completing the 3 first steps of the instructions in
<a href=\"modelica://OpenIPSL.Data.PowerPlant.GenerationGroup.Generator2\">
<code>GenerationGroup.Generator2</code></a>.
A <code>OpenIPSL.Data.PowerPlant.GUDynamics</code> record must be dragged and dropped
into that model and its <code>GUnitDynamics</code> parameter must be propagated before
continuing with the following steps:
</p>
<ol>
<li>Open the parameter window of the generation group component.</li>
<li>Choose the appropriate parameter data set for the generating unit dynamics
    from the <code>GUnitDynamics</code> dropdown list. To do this, double-click the
    <code>generator1</code> component. Then, expand the drop-down list of the
    <code>GUnitDynamics</code> parameter. Finally, choose the
    <em>Anderson Fossil Steam Unit 15 (448 MVA)</em> option.</li>
<li>Choose the right data set for the <code>powerFlow</code> record.
    The procedure is very similar as in the previous step.
    This time just expand the drop-down list of the <code>PowerFlow</code>
    parameter of the <code>powerFlow</code> record.
    <em>Choose the PF solutions for Pload = 50 MW</em> option.</li>
<li>Insert component references to the <code>powerFlow</code> record to define
    the initial power flow values. This has to be done for the following components:
    <ul>
    <li>generator1: <code>P_0=powerFlow.powerflow.machines.PG1</code>;
        <code>Q_0=powerFlow.powerflow.machines.QG1</code>;
        <code>v_0=powerFlow.powerflow.bus.v1</code>;
        <code>angle_0=powerFlow.powerflow.bus.A1</code>.</li>
    <li>gENCLS: <code>P_0=powerFlow.powerflow.machines.PG2</code>;
        <code>Q_0=powerFlow.powerflow.machines.QG2</code>;
        <code>v_0=powerFlow.powerflow.bus.v2</code>;
        <code>angle_0=powerFlow.powerflow.bus.A2</code>.</li>
    <li>constantLoad: P_0=<code>powerFlow.powerflow.loads.PL1</code>;
        <code>Q_0=powerFlow.powerflow.loads.QL1</code>;
        <code>v_0=powerFlow.powerflow.bus.v3</code>;
        <code>angle_0=powerFlow.powerflow.bus.A3</code>.</li>
    </ul></li>
<li>Go back to the instructions in
<a href=\"modelica://OpenIPSL.Data.PowerPlant.GenerationGroup.Generator2\">
<code>GenerationGroup.Generator2</code></a>
and follow step 4.</li>
</ol>
<h5>Source</h5>
<ul>
<li>Anderson, P. M., &amp; Fouad, A. A. (2008). Power system control and stability. John Wiley &amp; Sons. Pages: 566-580.</li>
</ul>
</html>"));
end Anderson;
