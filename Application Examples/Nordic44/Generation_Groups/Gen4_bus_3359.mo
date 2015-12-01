within Nordic44.Generation_Groups;
model Gen4_bus_3359 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3300, 3359, 8500"
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b=S_b "Machine base, MW";

  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENROU(
    R_a=0 "amature resistance",
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    S10=0.1089,
    Tpd0=4.75,
    H=4.82,
    Xd=2.13,
    Xq=2.03,
    Xpd=0.31,
    Xpq=0.403,
    Xppd=0.1937,
    Xppq=0.1937,
    Xl=0.14531,
    S12=0.37795,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b)
    annotation (Placement(transformation(extent={{-64,-20},{24,60}})));
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
        extent={{-44.5,-17.5},{44.5,17.5}},
        rotation=0,
        origin={-12.5,82.5})));

  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    T_E=0.04 "TE (sec)",
    E_MIN=0 "EMIN (pu on EFD base)",
    E_MAX=5 "EMAX (pu on EFD base)",
    C_SWITCH=0 "Cswitch",
    r_cr_fd=0 "rc/rfd",
    T_AT_B=0.2,
    T_B=10,
    K=165,
    V_0=V_0,
    V_c0=V_0) annotation (Placement(transformation(
        extent={{-27.5,-33.5},{27.5,33.5}},
        rotation=0,
        origin={54.5,-57.5})));
  iPSL.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    T_2=4.5 "controller lead compensation (s)",
    K_3=0 "fraction ",
    T_3=2 "governor lag (s)",
    K_5=1,
    T_5=0.01,
    H_LIM=0.03,
    K_4=0.68)
    annotation (Placement(transformation(extent={{-79,-53},{-30,-22}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-30,-55},{-20,-45}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation

  connect(gENROU.p, pwPin) annotation (Line(
      points={{28.4,20},{64,20},{64,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(
      points={{27.52,56},{28,56},{28,94},{-48,94},{-48,91.25},{-55.5167,91.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(
      points={{27.52,8},{34,8},{34,98},{-54,98},{-54,73.75},{-55.5167,73.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(
      points={{39.4167,82.5},{24,82.5},{24,68},{-64,68},{-64,40},{-63.12,40}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(
      points={{27.52,40},{23,40},{23,-28.355},{27.2292,-28.355}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-27.7727,-37.5},{-17.6795,-37.5},{-17.6795,-37.735},{27.2292,
          -37.735}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{27.52,-16},{27.52,-61.855},{26.7708,-61.855}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENROU.ETERM) annotation (Line(
      points={{26.7708,-72.91},{23,-72.91},{23,40},{27.52,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(
      points={{27.52,-8},{18,-8},{18,-84.635},{27.2292,-84.635}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VUEL) annotation (Line(
      points={{-19.5,-50},{-2,-50},{-2,-54.485},{27.2292,-54.485}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{27.2292,-45.775},{-2,-45.775},{-2,-50},{-19.5,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(
      points={{82.9167,-57.165},{90,-57.165},{90,-94},{-84,-94},{-84,0},{-63.12,
          0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{27.52,0},{44,0},{44,-14},{10,-14},{10,-28},{-80,-28},{-80,-37.5},
          {-78.3318,-37.5}},
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
end Gen4_bus_3359;
