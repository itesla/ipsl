within Nordic44.Generation_Groups;
model Gen4_bus_8500 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3300, 3359, 8500"
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b=S_b "Machine base, MW";

  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    R_a=0 "amature resistance",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    Xd=2.42 "d-axis reactance",
    Xq=2 "q-axis reactance",
    Xpd=0.23 "d-axis transient reactance",
    Xpq=0.4108 "d-axis transient reactance",
    S10=0.1089,
    Tpd0=10,
    H=7,
    Xppd=0.17062,
    Xppq=0.17062,
    Xl=0.14812,
    S12=0.37795,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b)
    annotation (Placement(transformation(extent={{-62,-22},{22,64}})));
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
        extent={{-44.5,-18.5},{44.5,18.5}},
        rotation=0,
        origin={-16.5,83.5})));

  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    T_AT_B=0 "TA/TB",
    T_B=0.04 "TB (sec)",
    K=10 "K",
    T_E=0.04 "TE (sec)",
    E_MIN=0 "EMIN (pu on EFD base)",
    E_MAX=5 "EMAX (pu on EFD base)",
    C_SWITCH=0 "Cswitch",
    r_cr_fd=0 "rc/rfd",
    V_0=V_0,
    V_c0=V_0) annotation (Placement(transformation(
        extent={{-27.5,-30.5},{27.5,30.5}},
        rotation=0,
        origin={60.5,-56.5})));
  iPSL.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    T_2=4.5 "controller lead compensation (s)",
    K_3=0 "fraction ",
    T_3=2 "governor lag (s)",
    K_4=0.55,
    K_5=1,
    T_5=0.01,
    H_LIM=0.03)
    annotation (Placement(transformation(extent={{-60,-59},{-6,-29}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-21,-79},{-11,-69}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(
      points={{26.2,21},{62,21},{62,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{25.36,59.7},{26,59.7},{26,94},{-52,94},{-52,92.75},{-59.5167,
          92.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{25.36,8.1},{32,8.1},{32,98},{-56,98},{-56,74.25},{-59.5167,74.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{35.4167,83.5},{22,83.5},{22,68},{-64,68},{-64,42.5},{-61.16,42.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(
      points={{25.36,42.5},{26,42.5},{26,-29.965},{33.2292,-29.965}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{25.36,-17.7},{25.36,-60.465},{32.7708,-60.465}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENROU.ETERM) annotation (Line(
      points={{32.7708,-70.53},{26,-70.53},{26,42.5},{25.36,42.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(
      points={{25.36,-9.1},{22,-9.1},{22,-81.205},{33.2292,-81.205}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-3.54545,-44},{0.123683,-44},{0.123683,-38.505},{33.2292,-38.505}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{25.36,-0.5},{16,-0.5},{16,-32},{-58,-32},{-58,-44},{-59.2636,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{33.2292,-45.825},{14,-45.825},{14,-74},{-10.5,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{33.2292,-53.755},{14,-53.755},{14,-74},{-10.5,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(
      points={{88.9167,-56.195},{94,-56.195},{94,-94},{-64,-94},{-64,-0.5},{
          -61.16,-0.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier), Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255})}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
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
end Gen4_bus_8500;
