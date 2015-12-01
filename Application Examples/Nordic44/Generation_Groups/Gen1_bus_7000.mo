within Nordic44.Generation_Groups;
model Gen1_bus_7000 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3000, 7000"
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b=1278 "Machinebase, MW";

  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    R_a=0 "amature resistance",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
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
    M_b=M_b,
    Tpd0=10,
    H=5.5,
    V_0=V_0,
    angle_0=angle_0,
    P_0 = P_0,
    Q_0 = Q_0)
    annotation (Placement(transformation(extent={{-16,-42},{71,43}})));
  iPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
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
        extent={{-36,-26},{36,26}},
        rotation=0,
        origin={-42,29})));

  iPSL.Electrical.Controls.PSSE.ES.IEEET2.IEEET2 iEEET2(
    T_R=0 "Voltage input time const., s",
    T_A=0.04 "AVR time const., s",
    V_RMAX=5.32 "Max. AVR output, p.u",
    V_RMIN=-4.05 "Min. AVR output, p.u",
    K_E=1 "Exciter field gain, s",
    T_E=0.44 "Exciter time const., s",
    K_F=0.0667 "Rate feedback gain, p.u",
    T_F1=2 "Rate feedback time const., s",
    T_F2=0.44 "Rate feedback time const., s",
    E_1=6.5 "Exciter sat. point 1, p.u",
    S_EE_1=0.054 "Saturation at E1",
    E_2=8 "Exciter sat. point 2, p.u",
    S_EE_2=0.2020 "Saturation at E2",
    K_A=800,
    V_0=V_0)     annotation (Placement(transformation(
        extent={{-34,-28.5},{34,28.5}},
        rotation=0,
        origin={-41,-7.5})));
  iPSL.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    K_3=0 "fraction ",
    T_3=2 "governor lag (s)",
    K_4=0.55,
    K_5=1,
    T_5=0.01,
    H_LIM=0.03,
    T_2=1)    annotation (Placement(transformation(extent={{-19,58},{39,103}})));

  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-96,-9},{-86,1}})));

  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation
  connect(cte.y, iEEET2.VOEL) annotation (Line(
      points={{-85.5,-4},{-82,-4},{-82,-7.5},{-73.8667,-7.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, iEEET2.VUEL) annotation (Line(
      points={{-85.5,-4},{-82,-4},{-82,-18.9},{-73.8667,-18.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{0,29},{-15,29},{-15,21.75},{-15.13,21.75}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(iEEET2.EFD, gENROU.EFD) annotation (Line(
      points={{-4.45,-7.5},{-16,-7.5},{-16,-20.75},{-15.13,-20.75}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.EFD0, iEEET2.EFD0) annotation (Line(
      points={{74.48,-29.25},{65,-29.25},{65,-53},{-75,-53},{-75,-30.3},{
          -73.8667,-30.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, iEEET2.ECOMP) annotation (Line(
      points={{74.48,21.75},{77,21.75},{77,57},{-75,57},{-75,15.3},{-73.8667,
          15.3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{74.48,38.75},{63,38.75},{63,36},{70,36},{70,49},{-72,49},{-72,42},
          {-76.8,42}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{74.48,-12.25},{74,-12.25},{74,-57},{-79,-57},{-79,16},{-76.8,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, iEEET2.VOTHSG) annotation (Line(
      points={{41.6364,80.5},{47.5,80.5},{47.5,63},{-82.5,63},{-82.5,3.9},{
          -73.8667,3.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{74.48,-20.75},{85,-20.75},{85,-64},{-98,-64},{-98,80.5},{
          -18.2091,80.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.p, pwPin) annotation (Line(
      points={{75.35,0.5},{82.975,0.5},{82.975,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1}), graphics), Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={1,1}), graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
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
end Gen1_bus_7000;
