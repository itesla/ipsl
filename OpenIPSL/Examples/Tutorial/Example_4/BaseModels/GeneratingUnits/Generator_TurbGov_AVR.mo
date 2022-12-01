within OpenIPSL.Examples.Tutorial.Example_4.BaseModels.GeneratingUnits;
model Generator_TurbGov_AVR "Machine with Turbine, Governor and Excitation System"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    v_0=v_0,
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0 "Speed Damping",
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    V_b=100000,
    M_b=100000000,
    S10=0.11,
    S12=0.39,
    R_a=0,
    angle_0=angle_0,
    P_0(displayUnit="MW") = P_0,
    Q_0=Q_0,
    Xpq=0.6,
    Tpq0=0.9) annotation (Placement(transformation(extent={{-50,-18},{40,40}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEEEG1 iEEEG1_1(
    P0=0.4,
    K=20,
    T_1=0.15,
    T_2=0,
    T_3=0.2,
    U_o=0.1,
    U_c=-0.1,
    P_MAX=0.903,
    P_MIN=0,
    T_4=0.25,
    K_1=0.25,
    K_2=0,
    T_5=7.5,
    K_3=0.25,
    K_4=0,
    T_6=0.4,
    K_5=0.5)
    annotation (Placement(transformation(extent={{-168,90},{-114,36}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESST1A eSST1A1(
    V_IMAX=0.3,
    V_IMIN=-0.3,
    T_C=2,
    T_B=10,
    T_C1=0.08,
    T_B1=0.083,
    K_A=300,
    V_AMAX=7,
    V_AMIN=-7,
    V_RMAX=5.2,
    V_RMIN=-5.2,
    K_C=0.38,
    K_F=1,
    T_F=1,
    K_LR=1,
    I_LR=0,
    T_A=0.1,
    T_R=0.1)
    annotation (Placement(transformation(extent={{-110,-68},{-170,-8}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{0,-102},{-20,-82}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-202,-102},{-182,-82}})));
  Modelica.Blocks.Sources.Constant const2(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-88,-108},{-108,-88}})));
  Modelica.Blocks.Sources.Constant const3(k=0)
    annotation (Placement(transformation(extent={{-12,-46},{-32,-26}})));
equation
  connect(eSST1A1.EFD, gENROE.EFD) annotation (Line(points={{-173,-38},{-186,
          -38},{-186,12},{-100,12},{-100,-6.4},{-59,-6.4}},
                                                       color={102,44,145}));
  connect(gENROE.SPEED, iEEEG1_1.SPEED_HP) annotation (Line(points={{44.5,31.3},
          {54,31.3},{54,32},{70,32},{70,110},{-186,110},{-186,63},{-162.6,63}},
        color={0,140,72}));
  connect(gENROE.ETERM, eSST1A1.VT) annotation (Line(points={{44.5,2.3},{80,2.3},
          {80,-68},{-92,-68},{-92,-61.475},{-107.075,-61.475}}, color={102,44,
          145}));
  connect(gENROE.EFD0, eSST1A1.EFD0) annotation (Line(points={{44.5,-3.5},{68,-3.5},
          {68,-50},{-107,-50}}, color={102,44,145}));
  connect(const.y, eSST1A1.VUEL) annotation (Line(points={{-21,-92},{-60,-92},{-60,
          -80},{-128,-80},{-128,-71}}, color={0,0,0}));
  connect(eSST1A1.VOTHSG2, eSST1A1.VUEL) annotation (Line(points={{-107,-14},{-60,
          -14},{-60,-80},{-128,-80},{-128,-71}}, color={0,0,0}));
  connect(gENROE.XADIFD, eSST1A1.XADIFD) annotation (Line(points={{44.5,-15.1},{
          60,-15.1},{60,-116},{-164,-116},{-164,-71}}, color={0,0,127}));
  connect(eSST1A1.ECOMP, eSST1A1.VT) annotation (Line(points={{-107,-38},{-92,-38},
          {-92,-61.475},{-107.075,-61.475}}, color={102,44,145}));
  connect(const1.y, eSST1A1.VUEL2) annotation (Line(points={{-181,-92},{-149.03,-92},
          {-149.03,-70.97}}, color={0,0,0}));
  connect(eSST1A1.VUEL3, eSST1A1.VUEL2) annotation (Line(points={{-155.555,-70.985},
          {-155.555,-92},{-149.03,-92},{-149.03,-70.97}}, color={0,0,127}));
  connect(const2.y, eSST1A1.VOEL) annotation (Line(points={{-109,-98},{-140,-98},
          {-140,-71}}, color={0,0,0}));
  connect(iEEEG1_1.PMECH_HP, gENROE.PMECH) annotation (Line(points={{-111.3,
          52.2},{-96,52.2},{-96,28.4},{-59,28.4}}, color={0,140,72}));
  connect(gENROE.p, pwPin) annotation (Line(points={{40,11},{90,11},{90,0},{110,
          0}}, color={0,0,255}));
  connect(const3.y, eSST1A1.VOTHSG) annotation (Line(points={{-33,-36},{-72,-36},
          {-72,-26},{-107,-26}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-120},{100,120}})));
end Generator_TurbGov_AVR;
