within TwoAreas.Groups.PSSE;
model G4

  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.175,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    V_0=1.01,
    R_a=0.0025,
    D=0.02,
    S12=0.802,
    S10=0.18600,
    P_0=700,
    M_b=900,
    angle_0=-16.9921,
    Q_0=202.0827) annotation (Placement(transformation(extent={{-16,-14},{24,22}})));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-60,40},{-36,60}})));
equation

  connect(gENSAL.p, pwPin) annotation (Line(points={{26,4},{42,4},{42,0},{70,0}}, color={0,0,255}));
  connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{25.6,-8.6},{22,-8.6},{22,-20},{-18,-20},{-18,-5},{-15.6,-5}}, color={0,0,127}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-15.6,13},{-14,13},{-14,16},{-18,16},{-18,30},{26,30},{26,-1.4},{25.6,-1.4}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-60,-60},{60,60}},
        initialScale=0.1)), Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-60,-60},{60,60}},
        initialScale=0.1), graphics={
        Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
        Line(points={{-40,0},{-20,20}}, color={28,108,200}),
        Line(points={{-20,20},{20,-20},{40,0}}, color={28,108,200}),
        Text(
          extent={{-24,-22},{18,-52}},
          lineColor={28,108,200},
          textString="G4")}));
end G4;
