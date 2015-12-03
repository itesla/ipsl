within iPSL.Examples.N44_Groups.Configuration;
model Group1 "Machine configuration of synchronous machine with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  from Nordic 44 model: Buses 3000, 7000.
  Configuration values at bus 3000"
  Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    V_0=1.0 "terminal voltage",
    angle_0=1.12 "Power flow, node angle in degree",
    P_0=900 "active power MVA",
    Q_0=812.6167 "reactive power MVA",
    M_b=1300 "system base power rating MVA",
    Tpd0=5 "d-axis transient open-circuit time constant s",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    H=5.97 "inertia constant s",
    D=0 "Damping",
    Xd=2.22 "d-axis reactance",
    Xq=2.13 "q-axis reactance",
    Xpd=0.36 "d-axis transient reactance",
    Xpq=0.468 "d-axis transient reactance",
    Xppd=0.225 "d-axis sub-transient reactance",
    Xppq=0.225 "q-axis sub-transient reactance",
    Xl=0.1688 "leakage reactance",
    S10=0.1089,
    S12=0.378,
    S_b=1000) annotation (Placement(transformation(extent={{-7,-11},{39,35}})));
  Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01 "controller lag (s)",
    T_2=0 "controller lead compensation (s)",
    T_3=0.15 "governor lag (s)",
    T_4=0.3 "delay due to steam inlet volumes associated with steam chest and inlet piping(s)",
    T_5=8 "reheater delay including hot and cold leads (s)",
    T_6=0.4 "delay due to IP-LP turbine, crossover pipes, and LP end hoods (s)",
    K_1=0 "1/p.u regulation ",
    K_2=0.7 "fraction ",
    K_3=0.43 "fraction ",
    P_MAX=1 "upper power limit",
    P_MIN=0 "lower power limit") annotation (Placement(transformation(
        extent={{-33,-27.5},{33,27.5}},
        rotation=0,
        origin={-56,30.5})));
  Electrical.Controls.PSSE.ES.IEEET2.IEEET2 iEEET2(
    V_0=1,
    T_R=0 "Voltage input time constant (s)",
    K_A=729 "AVR gain",
    T_A=0.04 "AVR time constant (s)",
    V_RMAX=5.32 "Maximum AVR output (pu)",
    V_RMIN=-4.05 "Minimum AVR output (pu)",
    K_E=1 "Exciter field gain, s",
    T_E=0.44 "Exciter time constant (s)",
    K_F=0.0667 "Rate feedback gain (pu)",
    T_F1=2 "Rate feedback time constant (s)",
    T_F2=0.44 "Rate feedback time constant (s)",
    E_1=6.5 "Exciter saturation point 1 (pu)",
    S_EE_1=0.054 "Saturation at E1",
    E_2=8 "Exciter saturation point 2 (pu)",
    S_EE_2=0.2020 "Saturation at E2") annotation (Placement(transformation(
        extent={{-28.5,-20},{28.5,20}},
        rotation=0,
        origin={-51.5,0})));
  Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    T_2=2 "controller lead compensation (s)",
    K_3=0 "fraction ",
    T_3=2 "governor lag (s)",
    K_4=0.55,
    K_5=1,
    T_5=0.01,
    H_LIM=0.03) annotation (Placement(transformation(extent={{-141,24},{-99,39}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-120,-14},{-110,-4}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(cte.y, iEEET2.VOEL) annotation (Line(
      points={{-109.5,-9},{-104,-9},{-104,0},{-79.05,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, iEEET2.VUEL) annotation (Line(
      points={{-109.5,-9},{-104,-9},{-104,-8},{-79.05,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEEET2.EFD, gENROU.EFD) annotation (Line(
      points={{-20.8625,0},{-27,0},{-27,0.5},{-6.54,0.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(
      points={{40.84,-4.1},{54,-4.1},{54,-53},{-86,-53},{-86,-16},{-79.05,-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(
      points={{40.84,23.5},{66,23.5},{66,57},{-86,57},{-86,16},{-79.05,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC)
    annotation (Line(
      points={{40.84,0.5},{60,0.5},{60,-11},{73,-11},{73,-59},{-146,-59},{-146,31.5},{-140.427,31.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{40.84,32.7},{56,32.7},{56,49},{-83,49},{-83,46.2143},{-87.35,46.2143}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(
      points={{-97.0909,31.5},{-93,31.5},{-93,8},{-79.05,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{40.84,5.1},{63,5.1},{63,-57},{-90,-57},{-90,18.7143},{-87.35,18.7143}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.p, pwPin) annotation (Line(
      points={{41.3,12},{76.475,12},{76.475,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROU.PMECH, iEESGO.PMECH0) annotation (Line(points={{-6.54,23.5},{-14,23.5},{-14,42},{48,42},{48,5},{63,5},{63,-57},{-90,-57},{-90,18.7143},{-87.35,18.7143}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1})),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={1,1}), graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textString="GENROU & 
IEESGO & 
STAB2A & 
IEEET2",  textStyle={TextStyle.Italic})}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end Group1;

