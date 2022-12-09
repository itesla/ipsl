within OpenIPSL.Examples.Tutorial.Example_4.BaseModels.GeneratingUnits;
model GeneratorOnly "Machine-only Generator Unit"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=100000000,
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    R_a=0,
    Xpq=0.6,
    Tpq0=0.9) annotation (Placement(transformation(extent={{-36,-42},{56,42}})));
equation
  connect(gENROE.PMECH0, gENROE.PMECH) annotation (Line(points={{60.6,21},{80,
          21},{80,70},{-80,70},{-80,25.2},{-45.2,25.2}},
                                                     color={0,0,127}));
  connect(gENROE.EFD0, gENROE.EFD) annotation (Line(points={{60.6,-21},{80,
          -21},{80,-70},{-80,-70},{-80,-25.2},{-45.2,-25.2}},
                                                     color={0,0,127}));
  connect(gENROE.p, pwPin)
    annotation (Line(points={{56,0},{110,0}}, color={0,0,255}));
end GeneratorOnly;
