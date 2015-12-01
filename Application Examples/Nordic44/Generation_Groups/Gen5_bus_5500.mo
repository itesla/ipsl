within Nordic44.Generation_Groups;
model Gen5_bus_5500 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real M_b=S_b "Machine base, MW";

  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    R_a=0,
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    S10=0.1,
    S12=0.3,
    Tpd0=7.198,
    H=3,
    Xd=1.2364,
    Xq=0.65567,
    Xpd=0.37415,
    Xppd=0.22825,
    Xppq=0.22825,
    Xl=0.16194,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b)
    annotation (Placement(transformation(extent={{-56,-38},{18,36}})));
  iPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    T_r=5 "Governor time constant, s",
    T_f=0.05 "Filter time constant, s",
    T_g=0.2 "Servo time constant, s",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    G_MAX=1 "Maximum gate limit, p.u",
    G_MIN=0 "Minimum gate limit, p.u",
    T_w=1 "Water time constant, s",
    A_t=1.1 "Turbine gain, p.u",
    D_turb=0.5 "Turbine damping, p.u",
    q_NL=0.1 "Water flow at no load. p.u")
    annotation (Placement(transformation(extent={{-80,39},{48,71}})));
  iPSL.Electrical.Controls.PSSE.ES.SEXS.SEXS sEXS(
    T_AT_B=0.05,
    T_B=100,
    K=200,
    T_E=0.5,
    E_MIN=0,
    E_MAX=4,
    Ec0=V_0)
    annotation (Placement(transformation(extent={{-2,-96},{94,-32}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-13,-59},{-3,-49}})));
  iPSL.Connectors.PwPin p annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
equation
  connect(cte.y, sEXS.VOEL) annotation (Line(
      points={{-2.5,-54},{6,-54},{6,-54.08},{19.0462,-54.08}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VUEL) annotation (Line(
      points={{-2.5,-54},{6,-54},{6,-60.48},{19.0462,-60.48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sEXS.VOTHSG) annotation (Line(
      points={{-2.5,-54},{6,-54},{6,-48.32},{19.0462,-48.32}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENSAL.p, p) annotation (Line(
      points={{21.7,-1},{74.1,-1},{74.1,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{20.96,32.3},{20,32.3},{20,74},{-60,74},{-60,63},{-78.4,63}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{20.96,-12.1},{28,-12.1},{28,77},{-68,77},{-68,47},{-78.4,47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{51.2,55},{16,55},{16,40},{-52,40},{-52,17.5},{-55.26,17.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(
      points={{20.96,17.5},{14,17.5},{14,-41.92},{19.0462,-41.92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(
      points={{20.96,-26.9},{11,-26.9},{11,-73.92},{19.0462,-73.92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(
      points={{65.9385,-57.6},{72,-57.6},{72,-84},{-54,-84},{-54,-19.5},{-55.26,
          -19.5}},
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
end Gen5_bus_5500;
