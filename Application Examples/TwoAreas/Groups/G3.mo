within TwoAreas.Groups;
model G3

  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    D=0,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    H=6.175,
    R_a=0.0025,
    S12=0.802,
    S10=0.18600,
    M_b=900,
    V_0=1.03,
    angle_0=-6.8,
    P_0=719.0941,
    Q_0=176.0262)
    annotation (Placement(transformation(extent={{-30,-30},{30,36}})));

  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,
            10}})));

  inner iPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-60,40},{-36,60}})));
equation
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-29.4,19.5},{-40,
          19.5},{-40,44},{30,44},{30,-6.9},{32.4,-6.9}},    color={0,0,127}));
  connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{32.4,-20.1},{38,-20.1},
          {38,-40},{-38,-40},{-38,0},{-38,-13.5},{-29.4,-13.5}},
                                                               color={0,0,127}));
  connect(gENSAL.p, pwPin) annotation (Line(points={{33,3},{46.5,3},{46.5,0},{70,
          0}},             color={0,0,255}));
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
          extent={{-22,-24},{18,-54}},
          lineColor={28,108,200},
          textString="G3")}));
end G3;
