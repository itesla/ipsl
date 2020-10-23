within OpenIPSL.Examples.Controls.PSSE.ES;
model ESST4B "SMIB model example of GENROU with Excitation System ESST4B"
  extends OpenIPSL.Examples.BaseClasses.SMIBpartial;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    angle_0=4.04626655578613,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    M_b=100000000,
    P_0=39999952.9123306,
    Q_0=5416571.34890556,
    v_0=1) annotation (Placement(transformation(extent={{-90,-12},{-68,12}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-5,-5},{5,5}}, origin={-75,-35})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESST4B eSST4B annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        origin={-46,-8})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-20,-40},{-30,-30}})));
equation
  connect(gENROU.p, eSST4B.Gen_terminal) annotation (Line(
      points={{-68,0},{-55,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROU.EFD0, eSST4B.EFD0) annotation (Line(
      points={{-66.9,-6},{-64,-6},{-64,-12},{-57,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(zero.y, eSST4B.VUEL) annotation (Line(
      points={{-69.5,-35},{-50,-35},{-50,-19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(
      points={{-66.9,6},{-60,6},{-60,20},{-100,20},{-100,6},{-92.2,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSST4B.EFD, gENROU.EFD) annotation (Line(
      points={{-35,-8},{-32,-8},{-32,-26},{-100,-26},{-100,-6},{-92.2,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, eSST4B.XADIFD) annotation (Line(
      points={{-66.9,-10.8},{-66.9,-24},{-38,-24},{-38,-19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSST4B.Bus, GEN1.p) annotation (Line(points={{-37,0},{-30,0}},
                                          color={0,0,255}));
  connect(plusInf.y, eSST4B.VOEL) annotation (Line(points={{-30.5,-35},{-46,-35},{-46,-19}}, color={0,0,127}));
  connect(eSST4B.VOTHSG, eSST4B.VUEL) annotation (Line(points={{-57,-4},{-60,-4},{-60,-35},{-50,-35},{-50,-19}}, color={0,0,127}));
  connect(gENROU.ETERM, eSST4B.ECOMP) annotation (Line(points={{-66.9,-3.6},{-62,-3.6},{-62,-8},{-57,-8}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end ESST4B;
