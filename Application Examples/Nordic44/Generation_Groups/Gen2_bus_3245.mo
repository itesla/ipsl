within Nordic44.Generation_Groups;
model Gen2_bus_3245 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
  Nordic 44 model: Buses 3245, 3249, 5600"
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b=S_b "Machine base, MW";

  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    R_a=0,
    Tpd0=5.0 "T'do (> 0)",
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    H=3.3 "Inertia",
    D=0 "Speed Damping",
    Xd=0.75 "d-axis reactance",
    Xq=0.5 "q-axis reactance",
    Xpd=0.25 "d-axis transient reactance",
    S12=0.2742,
    Xppd=0.15385,
    Xppq=0.15385,
    Xl=0.11538,
    S10=0.10239,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b,
    V_0=V_0)
    annotation (Placement(transformation(extent={{-63,-44},{33,46}})));
  iPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    T_r=5 "Governor time constant, s",
    T_f=0.05 "Filter time constant, s",
    T_g=0.2 "Servo time constant, s",
    VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
    G_MAX=1 "Maximum gate limit, p.u",
    G_MIN=0 "Minimum gate limit, p.u",
    T_w=1 "Water time constant, s",
    D_turb=0.5 "Turbine damping, p.u",
    q_NL=0.1 "Water flow at no load. p.u",
    A_t=1.01)
    annotation (Placement(transformation(extent={{-72,42},{58,94}})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    T_E=0.05 "TE (sec)",
    E_MIN=0 "EMIN (pu on EFD base)",
    C_SWITCH=0 "Cswitch",
    r_cr_fd=0 "rc/rfd",
    T_AT_B=0.25385,
    T_B=13,
    K=31,
    E_MAX=4,
    V_0=V_0,
    V_c0=V_0)
    annotation (Placement(transformation(extent={{35,-92},{89,-34}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-5,-85},{5,-75}})));
  iPSL.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation

  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.p, p) annotation (Line(
      points={{37.8,1},{60.1,1},{60.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{36.84,41.5},{34,41.5},{34,94},{-54,94},{-54,81},{-70.375,81}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{36.84,-12.5},{39,-12.5},{39,97},{-59,97},{-59,55},{-70.375,55}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{61.25,68},{24,68},{24,50},{-56,50},{-56,23.5},{-62.04,23.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(
      points={{36.84,23.5},{30,23.5},{30,-37.77},{35.225,-37.77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{36.84,-39.5},{36.84,-66.77},{34.775,-66.77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ETERM, gENSAL.ETERM) annotation (Line(
      points={{34.775,-76.34},{30,-76.34},{30,23.5},{36.84,23.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{36.84,-30.5},{23,-30.5},{23,-86.49},{35.225,-86.49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(
      points={{35.225,-45.89},{18,-45.89},{18,-80},{5.5,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOEL, cte.y) annotation (Line(
      points={{35.225,-52.85},{18,-52.85},{18,-80},{5.5,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VUEL, cte.y) annotation (Line(
      points={{35.225,-60.39},{18,-60.39},{18,-80},{5.5,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{89.9,-62.71},{94,-62.71},{94,-96},{-56,-96},{-56,-21.5},{-62.04,-21.5}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Ellipse(extent={{-100,-100},{101,
              100}}, lineColor={0,0,255}), Line(
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
end Gen2_bus_3245;
