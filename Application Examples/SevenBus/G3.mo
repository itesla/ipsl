within SevenBus;
model G3
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b "Machine base power (MVA)" annotation (Dialog(group="Power flow data"));
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b,
    D=0,
    Tpd0=8.094,
    Tppd0=0.08,
    Tppq0=0.084,
    H=5.4,
    Xq=2.22,
    Xpd=0.384,
    Xl=0.202,
    S10=0.215,
    S12=0.76968,
    Xpq=0.393,
    Tpq0=1.572,
    Xd=2.22,
    Xppq=0.264,
    Xppd=0.264,
    R_a=0.002796) annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  iPSL.Electrical.Controls.PSSE.ES.ST5B.ST5B sT5B(
    T_R=0,
    T_C1=0.8,
    T_B1=6,
    T_C2=0.08,
    T_B2=0.01,
    K_R=200,
    V_RMAX=5,
    V_RMIN=-4,
    T_1=0.004,
    K_C=0.004,
    T_UC1=2,
    T_UB1=10,
    T_UC2=0.1,
    T_UB2=0.05,
    T_OC1=0.1,
    T_OB1=2,
    T_OC2=0.08,
    T_OB2=0.08) annotation (Placement(transformation(extent={{30,-76},{-30,-44}})));
  iPSL.Electrical.Controls.PSSE.PSS.PSS2B.PSS2B pSS2B(
    T_w1=2,
    T_w2=2,
    T_6=0,
    T_w3=2,
    T_w4=0,
    T_7=2,
    K_S2=0.1564,
    K_S3=1,
    T_8=0,
    T_9=0,
    K_S1=10,
    T_1=0.25,
    T_2=0.03,
    T_3=0.15,
    T_4=0.015,
    T_10=0,
    T_11=0,
    V_S1MAX=999,
    V_S1MIN=-999,
    V_S2MAX=999,
    V_S2MIN=-999,
    V_STMAX=0.1,
    V_STMIN=-0.1,
    M=0,
    N=0) annotation (Placement(transformation(extent={{56,-100},{20,-92}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-100) annotation (Placement(transformation(extent={{-72,-92},{-60,-80}})));
  Modelica.Blocks.Sources.Constant VOEL(k=100) annotation (Placement(transformation(extent={{-72,-60},{-60,-48}})));
  Modelica.Blocks.Sources.Constant PSS_off(k=0) annotation (Placement(transformation(extent={{-72,-120},{-60,-108}})));
equation
  connect(gENROU.PMECH, gENROU.PMECH0) annotation (Line(points={{-29.4,15},{-40,15},{-40,40},{40,40},{40,-9},{32.4,-9}}, color={0,0,127}));
  connect(gENROU.p, pwPin) annotation (Line(points={{33,0},{72,0},{110,0}}, color={0,0,255}));
  connect(gENROU.ETERM, sT5B.ECOMP) annotation (Line(points={{32.4,15},{44,15},{44,-48},{29,-48}}, color={0,0,127}));
  connect(sT5B.ETERM, sT5B.ECOMP) annotation (Line(points={{29,-56},{44,-56},{44,-48},{29,-48}}, color={0,0,127}));
  connect(sT5B.XADIFD, gENROU.XADIFD) annotation (Line(points={{29,-64},{38,-64},{38,-27},{32.4,-27}}, color={0,0,127}));
  connect(sT5B.EFD0, gENROU.EFD0) annotation (Line(points={{29,-72},{40,-72},{40,-21},{32.4,-21}}, color={0,0,127}));
  connect(gENROU.SPEED, pSS2B.V_S1) annotation (Line(points={{32.4,27},{66,27},{66,-94},{56,-94}}, color={0,0,127}));
  connect(gENROU.PELEC, pSS2B.V_S2) annotation (Line(points={{32.4,-15},{72,-15},{72,-98},{56,-98}}, color={0,0,127}));
  connect(VUEL.y, sT5B.VUEL) annotation (Line(points={{-59.4,-86},{13,-86},{13,-74.6667}}, color={0,0,127}));
  connect(VOEL.y, sT5B.VOEL) annotation (Line(points={{-59.4,-54},{-52,-54},{-52,-80},{5,-80},{5,-74.6667}}, color={0,0,127}));
  connect(pSS2B.VOTHSG, sT5B.VOTHSG) annotation (Line(points={{19.4,-96},{6,-96},{6,-94},{-3,-94},{-3,-74.6667}}, color={0,0,127}));
  connect(gENROU.EFD, sT5B.EFD) annotation (Line(points={{-29.4,-15},{-40,-15},{-40,-60},{-31,-60}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
end G3;
