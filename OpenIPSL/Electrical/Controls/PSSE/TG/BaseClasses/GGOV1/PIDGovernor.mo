within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model PIDGovernor "GE GGOV1 General Governor Frequency Controller"
  parameter Integer Rselect=1 "Feedback signal for governor droop" annotation (Evaluate=true, choices(
      choice=1 "Electrical power",
      choice=0 "None (isochronous governor)",
      choice=-1 "Governor output (requested stroke)",
      choice=-2 "Fuel valve stroke (true stoke)"));
  parameter Types.PerUnit R=0.04 "Permanent droop";
  parameter Types.Time T_pelec=1 "Electrical power transducer time constant";
  parameter Types.PerUnit maxerr=0.05 "Maximum value for speed error signal";
  parameter Types.PerUnit minerr=-0.05 "Minimum value for speed error signal";
  parameter Types.PerUnit Kpgov=10 "Governor proportional gain";
  parameter Types.TimeAging Kigov=2 "Governor integral gain";
  parameter Types.Time Kdgov=0 "Governor derivative gain";
  parameter Types.Time Tdgov=1 "Governor derivative controller time constant";
  parameter Types.PerUnit Kturb=1.5 "Turbine gain";
  parameter Types.TimeAging Kimw=0 "Power controller (reset) gain";
  parameter Types.PerUnit db=0 "Speed governor deadband";
  parameter Types.PerUnit Wfnl=0.2 "No load fuel flow";
  parameter Types.PerUnit Dm=0 "Mechanical damping coefficient";
  Modelica.Blocks.Math.Gain KPGOV(k=Kpgov) annotation (Placement(transformation(extent={{60,16},{76,32}})));
  Modelica.Blocks.Continuous.Integrator s2(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s20) annotation (Placement(visible = true, transformation(origin = {84, -10}, extent = {{8, 8}, {-8, -8}}, rotation = 180)));
  Modelica.Blocks.Continuous.Derivative s1(
    k=Kdgov,
    T=Tdgov,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{58,58},{78,78}})));
  Modelica.Blocks.Math.Add3 GovernorPID annotation (Placement(transformation(extent={{102,4},{124,26}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=db, deadZoneAtInit=false) annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica.Blocks.Nonlinear.Limiter limiterSerror(uMax=maxerr, uMin=minerr) annotation (Placement(transformation(extent={{12,40},{32,60}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=-1, k3=-1) annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
  Modelica.Blocks.Math.Gain r(k=R) "Permanent droop" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,10})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{-76,44},{-64,56}})));
  Modelica.Blocks.Continuous.LimIntegrator s7(
    k=Kimw,
    outMax=1.1*R,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s70) "Power controller" annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-102,-122})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-102,-146})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag s0(
    T=T_pelec,
    y_start=s00,
    K=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-126,-194})));
  Modelica.Blocks.Math.Gain KPGOV1(k=Kigov) annotation (Placement(visible = true, transformation(origin = {62, -10}, extent = {{6, -6}, {-6, 6}}, rotation = 180)));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.RSELECT rSELECT(Rselect=Rselect)
    annotation (Placement(transformation(
        extent={{-18,-18},{18,18}},
        rotation=90,
        origin={-64,-42})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power (pu)"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}}), iconTransformation(extent={{-168,-118},{-134,-84}})));
  Modelica.Blocks.Interfaces.RealInput PMW_SET
  "Supervisory Load Controller Setpoint"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}}), iconTransformation(extent={{-168,-58},{-134,-24}})));
  Modelica.Blocks.Interfaces.RealInput P_REF annotation (Placement(transformation(extent={{-140,20},{-100,60}}), iconTransformation(extent={{-168,20},{-134,54}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}}),
                                                                       iconTransformation(extent={{-168,74},{-134,108}})));
  Modelica.Blocks.Interfaces.RealInput VSTROKE "Valve Stroke" annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=90,
        origin={-13,-205}),
                          iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={-29,-149})));
  Modelica.Blocks.Interfaces.RealInput GOVOUT1
    "Governor Output before Limiter"                                            annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={20,-216}),iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=90,
        origin={71,-149})));
  Modelica.Blocks.Interfaces.RealOutput FSRN annotation (Placement(transformation(extent={{136,6},{154,24}}), iconTransformation(extent={{140,-12},{164,12}})));
protected
  parameter Types.PerUnit Pe0(fixed=false);
  parameter Types.PerUnit Pmech0(fixed=false);
  parameter Types.PerUnit s00(fixed=false);
  parameter Types.PerUnit s20(fixed=false);
  parameter Types.PerUnit s70(fixed=false);
  parameter Types.PerUnit fsr0(fixed=false);
initial equation
  Pe0 = PELEC;
  Pmech0 = PELEC;
  s00 = Pe0;
  s20 = fsr0;
  s70 = 0;
  //assume s70=0
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(deadZone.y, limiterSerror.u) annotation (Line(
      points={{1,50},{10,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.u, limiterSerror.y) annotation (Line(
      points={{58.4,24},{44,24},{44,50},{33,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_2.y, deadZone.u) annotation (Line(
      points={{-29,50},{-22,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(r.y, add3_2.u3) annotation (Line(
      points={{-60,21},{-60,42},{-52,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, add3_2.u2) annotation (Line(
      points={{-63.4,50},{-52,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s7.y, add2.u2) annotation (Line(
      points={{-102,-113.2},{-102,46.4},{-77.2,46.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, s7.u) annotation (Line(
      points={{-102,-139.4},{-102,-131.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, add3.u2) annotation (Line(
      points={{-115,-194},{-98,-194},{-98,-153.2},{-98.4,-153.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.u, limiterSerror.y) annotation (Line(
      points={{56,68},{44,68},{44,50},{33,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.y, GovernorPID.u1) annotation (Line(
      points={{79,68},{90,68},{90,23.8},{99.8,23.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.y, GovernorPID.u2) annotation (Line(
      points={{76.8,24},{80,24},{80,15},{99.8,15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, rSELECT.Pelect) annotation (Line(
      points={{-115,-194},{-74.08,-194},{-74.08,-63.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rSELECT.y, r.u) annotation (Line(
      points={{-63.64,-22.2},{-59.72,-22.2},{-59.72,-2},{-60,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.u1, PMW_SET) annotation (Line(points={{-105.6,-153.2},{-105.6,-40},{-120,-40}},
                                                                                            color={0,0,127}));
  connect(add2.u1, P_REF) annotation (Line(points={{-77.2,53.6},{-111.6,53.6},{-111.6,40},{-120,40}}, color={0,0,127}));
  connect(add3_2.u1, SPEED) annotation (Line(points={{-52,58},{-60,58},{-60,80},{-120,80}},      color={0,0,127}));
  connect(PELEC, s0.u) annotation (Line(points={{-120,-80},{-140,-80},{-140,-194},{-138,-194}}, color={0,0,127}));
  connect(VSTROKE, rSELECT.ValveStroke) annotation (Line(points={{-13,-205},{-13,-40.56},{-42.4,-40.56}},        color={0,0,127}));
  connect(GOVOUT1, rSELECT.GovernorOutput) annotation (Line(points={{20,-216},{20,-26.88},{-42.4,-26.88}},
                                                                                                        color={0,0,127}));
  connect(FSRN, GovernorPID.y) annotation (Line(points={{145,15},{125.1,15}}, color={0,0,127}));
  connect(KPGOV1.y, s2.u) annotation (
    Line(points={{68.6,-10},{74.4,-10}},  color = {0, 0, 127}));
  connect(KPGOV1.u, limiterSerror.y) annotation (
    Line(points={{54.8,-10},{44,-10},{44,50},{33,50}},                  color = {0, 0, 127}));
  connect(s2.y, GovernorPID.u3) annotation (
    Line(points={{92.8,-10},{96,-10},{96,6},{99.8,6},{99.8,6.2}},      color = {0, 0, 127}));
  annotation (
    Diagram(graphics={Text(lineColor = {255, 0, 0}, extent = {{-108, 8}, {-96, 0}}, textString = "s7"),Text(lineColor = {255, 0, 0}, extent = {{86, 78}, {96, 70}}, textString = "s1"),Text(origin = {0, 12},lineColor = {255, 0, 0}, extent = {{66, -34}, {76, -42}}, textString = "s2"),Text(lineColor = {255, 0, 0}, extent={{-112,-198},{-100,-206}},   textString = "s0")}),
    Icon(graphics={Rectangle(lineColor = {0, 0, 255}, extent = {{-140, 140}, {140, -140}}),Text(lineColor = {28, 108, 200}, extent = {{-128, 104}, {-72, 80}}, textString = "SPEED"),Text(lineColor = {28, 108, 200}, extent = {{-128, 50}, {-72, 26}}, textString = "P_REF"),Text(lineColor = {28, 108, 200}, extent = {{-130, -20}, {-60, -66}}, textString = "PMW_SET"),Text(lineColor = {28, 108, 200}, extent = {{-128, -92}, {-72, -116}}, textString = "PELEC"),Text(lineColor = {28, 108, 200}, extent = {{90, 8}, {138, -10}}, textString = "FSRN"),Text(lineColor = {28, 108, 200}, extent = {{-64, 42}, {66, -40}}, textString = "Governor"),Text(lineColor = {28, 108, 200}, extent = {{-58, -110}, {-6, -140}}, textString = "VSTROKE"),Text(lineColor = {28, 108, 200}, extent = {{46, -114}, {100, -140}}, textString = "GOVOUT1")}),
    Documentation(info="<html>
<p>The following documentation is adapted from 
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>
Frequency control system for the general purpose Turbine/Governor models GGOV1. 
Note that four feedback variables can be chosen for the droop control. 
If the turbine is set to be isochronous, it is necessary to set the permanent droop to zero.
</p>
</blockquote>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-22</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a></p></td>
<td><p><a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end PIDGovernor;
