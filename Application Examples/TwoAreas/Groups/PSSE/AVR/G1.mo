within TwoAreas.Groups.PSSE.AVR;
model G1
  extends iPSL.Electrical.Essentials.pfComponent;

  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.5,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    R_a=0.0025,
    D=0.02,
    S12=0.802,
    S10=0.18600,
    M_b=900,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-16,-14},{24,22}})));
equation

  connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{25.6,-8.6},{26,-8.6},{26,-20},{-18,-20},{-18,-5},{-15.6,-5}}, color={0,0,127}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-15.6,13},{-18,13},{-18,30},{24,30},{24,-1.4},{25.6,-1.4}}, color={0,0,127}));
  connect(gENSAL.p, pwPin) annotation (Line(points={{26,4},{42,4},{42,0},{70,0}}, color={0,0,255}));
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
          extent={{-20,-24},{16,-54}},
          lineColor={28,108,200},
          textString="%name")}));
end G1;
