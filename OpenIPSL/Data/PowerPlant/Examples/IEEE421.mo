within OpenIPSL.Data.PowerPlant.Examples;
model IEEE421
  "SMIB system to learn how to use the data set records (IEEE421.5 standard)"
  extends OpenIPSL.Tests.BaseClasses.SMIB(constantLoad(
      P_0=powerFlow.powerflow.loads.PL1,
      Q_0=powerFlow.powerflow.loads.QL1,
      v_0=powerFlow.powerflow.bus.v3,
      angle_0=powerFlow.powerflow.bus.A3), gENCLS(
      P_0=powerFlow.powerflow.machines.PG2,
      Q_0=powerFlow.powerflow.machines.QG2,
      v_0=powerFlow.powerflow.bus.v2,
      angle_0=powerFlow.powerflow.bus.A2));
  GenerationGroup.Generator1  generator1(
    P_0=powerFlow.powerflow.machines.PG1,
    enableP_0=true,
    Q_0=powerFlow.powerflow.machines.QG1,
    enableQ_0=true,
    v_0=powerFlow.powerflow.bus.v1,
    enablev_0=true,
    angle_0=powerFlow.powerflow.bus.A1,
    enableangle_0=true,
    redeclare record GUnitDynamics =
        OpenIPSL.Data.PowerPlant.IEEE421.ST.ESST1A1 (redeclare record ExcSystem =
            OpenIPSL.Data.PowerPlant.IEEE421.ESData.ST.ESST1A1 (
            T_F=1,
            K_LR=1,
            I_LR=0))) annotation (Placement(transformation(rotation=0, extent={
            {-60,-10},{-40,10}})));
  PFData.PowerFlow powerFlow(redeclare record PowerFlow = PFData.PF00050)
    annotation (Placement(transformation(extent={{-90,32},{-70,52}})));
equation
  connect(generator1.pwPin, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  annotation (
experiment(
      StopTime=20,
      Tolerance=1e-06), Documentation(info="<html>
<p>
This example demonstrates the use of records with synchronous machine, excitation system,
and power system stabilizer parameters, based on data sets published in the IEEE421.5 standard.
The generator group for this example includes a
<a href=\"modelica://OpenIPSL.Electrical.Machines.PSSE.GENSAE\">GENSAE</a>
machine together with an
<a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.ES.ESST1A\">ESST1A</a>
excitation system model and a
<a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2B\">PSS2B</a>
PSS model.
</p>
<h5>Instructions</h5>
<p>
Please start by completing the 3 first steps of the instructions in 
<a href=\"modelica://OpenIPSL.Data.PowerPlant.GenerationGroup.Generator1\">
<code>GenerationGroup.Generator1</code></a>.
A <code>OpenIPSL.Data.PowerPlant.GUDynamics</code> record must be dragged and 
dropped into that model and its <code>GUnitDynamics</code> parameter must be
propagated before continuing with the following steps:
</p>
<ol>
<li>Open the parameter window of the generation group component.</li>
<li>Choose the appropriate parameter data set for the generating unit dynamics
    from the <code>GUnitDynamics</code> dropdown list. To do this, double-click 
    the <code>generator1</code> component. Then, expand the drop-down list of 
    the <code>GUnitDynamics</code> parameter. Finally, choose the 
    <em>IEEE421.5 ST1A Type Excitation System Model Data Set 1</em> option.</li>
<li>Choose the right data set for the <code>powerFlow</code> record. 
    The procedure is very similar as in the previous step. 
    This time just expand the drop-down list of the <code>PowerFlow</code> parameter
    of the <code>powerFlow</code> record. 
    <em>Choose the PF solutions for <code>Pload = 50 MW</code></em> option.</li>
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
    <li>constantLoad: <code>P_0=powerFlow.powerflow.loads.PL1</code>;
        <code>Q_0=powerFlow.powerflow.loads.QL1</code>;
        <code>v_0=powerFlow.powerflow.bus.v3</code>;
        <code>angle_0=powerFlow.powerflow.bus.A3</code>.</li>
    </ul></li>
<li>Go back to the instructions in 
<a href=\"modelica://OpenIPSL.Data.PowerPlant.GenerationGroup.Generator1\">
<code>GenerationGroup.Generator1</code></a> and follow step 4.</li>
</ol>
<h5>Source</h5>
<ul>
<li>IEEE (2005), IEEE Recommended Practice for Excitation System Models for Power System Stability Studies. New York, NY 10016-5997, USA.</li>
</ul>
</html>"));
end IEEE421;
