within iPSL.Examples.N44_Groups.Configuration;
model Group4 "Machine configuration of synchronous machine with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  from Nordic 44 model: Buses 3300, 3359, 8500.
  Configuration values at bus 3300"
  Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    V_0=1.0 "terminal voltage",
    angle_0=0 "Power flow, node angle in degree",
    P_0=440.3163 "active power MVA",
    Q_0=190.2056 "reactive power MVA",
    M_b=1100 "system base power rating MVA",
    Tpd0=10.8 "d-axis transient open-circuit time constant s",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    H=6 "inertia constant s",
    D=0 "Damping",
    Xd=2.42 "d-axis reactance",
    Xq=2 "q-axis reactance",
    Xpd=0.23 "d-axis transient reactance",
    Xpq=0.4108 "d-axis transient reactance",
    Xppd=0.16 "d-axis sub-transient reactance",
    Xppq=0.16 "q-axis sub-transient reactance",
    Xl=0.1481 "leakage reactance",
    S10=0.1089,
    S12=0.378,
    S_b=1000) annotation (Placement(transformation(extent={{-56,-14},{-6,38}})));
  Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01 "controller lag (s)",
    T_2=0 "controller lead compensation (s)",
    T_3=0.15 "governor lag (s)",
    T_4=0.3
      "delay due to steam inlet volumes associated with steam chest and inlet piping(s)",

    T_5=8 "reheater delay including hot and cold leads (s)",
    T_6=0.4 "delay due to IP-LP turbine, crossover pipes, and LP end hoods (s)",

    K_1=0 "1/p.u regulation ",
    K_2=0.7 "fraction ",
    K_3=0.43 "fraction ",
    P_MAX=1 "upper power limit",
    P_MIN=0 "lower power limit") annotation (Placement(transformation(
        extent={{-14.5,-9.5},{14.5,9.5}},
        rotation=0,
        origin={-68.5,38.5})));
  Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    V_c0=1 "initial value of ECOMP",
    V_0=1 "initial value of ETERM",
    T_AT_B=0 "TA/TB",
    T_B=0.04 "TB (sec)",
    K=10 "K",
    T_E=0.04 "TE (sec)",
    E_MIN=0 "EMIN (pu on EFD base)",
    E_MAX=5 "EMAX (pu on EFD base)",
    r_cr_fd=0 "rc/rfd",
    C_SWITCH=false) annotation (Placement(transformation(
        extent={{-16,-16.5},{16,16.5}},
        rotation=0,
        origin={-67,9.5})));

  Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    T_2=4.5 "controller lead compensation (s)",
    K_3=0 "fraction ",
    T_3=2 "governor lag (s)",
    K_4=0.55,
    K_5=1,
    T_5=0.01,
    H_LIM=0.03)
    annotation (Placement(transformation(extent={{-119,5},{-92,26}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-103,-3},{-93,7}})));
  Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{
            100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{-53.0938,39.8571},{-56,39.8571},{-56,25},{-55.5,25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{-4,35.4},{-11,35.4},{-11,48},{-81,48},{-81,43.9286},{-82.275,
          43.9286}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(
      points={{-50.4667,9.665},{-54,9.665},{-54,-1},{-55.5,-1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-90.7727,15.5},{-87,15.5},{-87,19.235},{-82.8667,19.235}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{-4,-1},{-9,-1},{-9,5},{-4,5},{-4,-25},{-120,-25},{-120,15.5},{-118.632,
          15.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VOEL) annotation (Line(
      points={{-92.5,2},{-89,2},{-89,15.275},{-82.8667,15.275}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VUEL) annotation (Line(
      points={{-92.5,2},{-89,2},{-89,10.985},{-82.8667,10.985}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(
      points={{-4,-6.2},{-10,-6.2},{-10,-20},{-82,-20},{-82,-3.865},{-82.8667,-3.865}},

      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{-4,4.2},{-6,4.2},{-6,50},{-83,50},{-83,34.4286},{-82.275,34.4286}},

      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(
      points={{-4,25},{-8,25},{-8,24},{-3,24},{-3,52},{-85,52},{-85,23.855},{-82.8667,
          23.855}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, sCRX.ETERM) annotation (Line(
      points={{-4,25},{-51,25},{-51,23},{-87,23},{-87,1.91},{-83.1333,1.91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-4,-11.4},{-4,-22},{-84,-22},{-84,7.355},{-83.1333,7.355}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, gENROU.p) annotation (Line(points={{110,0},{44,0},{44,12},{-3.5,12}},
        color={0,0,255}));
  annotation (Icon(graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,
          255}),Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor
          ={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENROU & 
STAB2A &
SCRX & 
IEESGO")}), Documentation(info="<html>
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
end Group4;

