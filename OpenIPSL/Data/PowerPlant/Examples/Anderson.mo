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
<p>This example demonstrates the use of records with synchronous machine, excitation system, power system stabilizer and turbine-governor model parameters, based on data sets published in the &quot;Power System Control and Stability&quot; book. The generator group for this example includes a <strong>GENROE</strong> machine together with an <strong>ESDC1A</strong> excitation system model, an <strong>IEE2ST</strong> PSS model and an <strong>IEESGO</strong> turbine-governor model.</p>
<p>Source:</p>
<ul>
<li>Anderson, P. M., &amp; Fouad, A. A. (2008). Power system control and stability. John Wiley &amp; Sons. Pages: 566-580.</li>
</ul>
</html>"),
    Diagram(graphics={
        Rectangle(
          extent={{-60,96},{100,54}},
          lineColor={28,108,200},
          radius=5,
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-42,84},{78,76}},
          textColor={0,0,0},
          textString=
              "Open the parameter window of the generation group component."),
        Line(
          points={{-78,-24},{-60,-8}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=0.5,
          pattern=LinePattern.Dash),
        Text(
          extent={{-76,-18},{-58,-28}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="1"),
        Line(
          points={{-44,40},{-68,40}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=0.5,
          pattern=LinePattern.Dash),
        Line(
          points={{-44,40},{-48,10}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=0.5,
          pattern=LinePattern.Dash),
        Text(
          extent={{-48,36},{-30,26}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="2"),
        Text(
          extent={{-52,66},{102,54}},
          textColor={0,0,0},
          textString=
              "Insert component references to the power_Flow record to define the initial values."),
        Text(
          extent={{-48,80},{92,62}},
          textColor={0,0,0},
          textStyle={TextStyle.Italic},
          textString="Choose the appropriate parameter data set for the generating unit dynamics from the
GUnitDynamics dropdown list."),
        Text(
          extent={{-52,84},{-40,76}},
          textColor={0,0,125},
          textStyle={TextStyle.Bold},
          textString="1."),
        Text(
          extent={{-60,64},{-48,56}},
          textColor={0,0,125},
          textStyle={TextStyle.Bold},
          textString="2."),
        Text(
          extent={{-58,92},{96,86}},
          textColor={217,67,180},
          textStyle={TextStyle.Italic},
          textString="Start setting up the generating unit dynamics data set as explained
in GenerationGroup.Generator2.")}));
end Anderson;
