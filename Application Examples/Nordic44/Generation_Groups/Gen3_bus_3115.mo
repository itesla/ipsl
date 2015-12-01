within Nordic44.Generation_Groups;
model Gen3_bus_3115 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX, STAB2A; 
  Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100"
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b=S_b "Machine base, MW";

  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    R_a=0,
    D=0 "Speed Damping",
    Tpd0=7.57,
    Tppd0=0.045,
    Tppq0=0.1,
    H=4.741,
    Xd=0.946,
    Xq=0.565,
    Xpd=0.29,
    Xppd=0.23,
    Xppq=0.23,
    Xl=0.11077,
    S10=0.10239,
    S12=0.2742,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b)
    annotation (Placement(transformation(extent={{-66,-28},{10,56}})));
  iPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    T_r=5 "Governor time constant, s",
    T_f=0.05 "Filter time constant, s",
    T_g=0.2 "Servo time constant, s",
    G_MAX=1 "Maximum gate limit, p.u",
    G_MIN=0 "Minimum gate limit, p.u",
    T_w=1 "Water time constant, s",
    D_turb=0.5 "Turbine damping, p.u",
    q_NL=0.1 "Water flow at no load. p.u",
    VELM=0.1,
    A_t=1.0577)
    annotation (Placement(transformation(extent={{-90,58},{44,96}})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    T_B=13 "TB (sec)",
    T_E=0.05 "TE (sec)",
    E_MIN=0 "EMIN (pu on EFD base)",
    E_MAX=4 "EMAX (pu on EFD base)",
    C_SWITCH=0 "Cswitch",
    r_cr_fd=0 "rc/rfd",
    T_AT_B=0.25385,
    K=31,
    V_0=V_0,
    V_c0=V_0)
    annotation (Placement(transformation(extent={{12,-84},{66,-30}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-27,-81},{-17,-71}})));
  iPSL.Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    T_2=4.5 "controller lead compensation (s)",
    T_3=2 "governor lag (s)",
    K_5=1,
    T_5=0.01,
    K_3=0.87,
    K_4=0.087,
    H_LIM=0.04)
    annotation (Placement(transformation(extent={{-73,-63},{-15,-31}})));
  iPSL.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(gENSAL.p, p) annotation (Line(
      points={{13.8,14},{66.1,14},{66.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{13.04,51.8},{6,51.8},{14,51.8},{14,94},{-70,94},{-70,86.5},{
          -88.325,86.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{13.04,1.4},{8,1.4},{18,1.4},{18,98},{-76,98},{-76,67.5},{-88.325,
          67.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{47.35,77},{8,77},{8,60},{-70,60},{-70,35},{-65.24,35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(
      points={{12.225,-33.51},{6,-33.51},{6,35},{13.04,35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{13.04,-23.8},{13.04,-60.51},{11.775,-60.51}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{11.775,-69.42},{6,-69.42},{6,35},{13.04,35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{13.04,-15.4},{2,-15.4},{2,-78.87},{12.225,-78.87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{12.225,-47.55},{-4,-47.55},{-4,-76},{-16.5,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{12.225,-54.57},{-4,-54.57},{-4,-76},{-16.5,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-12.3636,-47},{-10.6103,-47},{-10.6103,-41.07},{12.225,-41.07}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{13.04,-7},{16,-7},{16,-24},{-2,-24},{-2,-36},{-74,-36},{-74,-47},
          {-72.2091,-47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{66.9,-56.73},{74,-56.73},{74,-88},{-78,-88},{-78,-7},{-65.24,-7}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(graphics={Ellipse(extent={{-100,-100},{101,100}},
            lineColor={0,0,255}), Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
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
end Gen3_bus_3115;
