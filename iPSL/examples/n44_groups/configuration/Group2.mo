within iPSL.Examples.N44_Groups.Configuration;
model Group2 "Machine configuration of synchronous machine with regulators: GENSAL, HYGOV, SCRX;
  from Nordic 44 model: Buses 3100, 3245, 3249, 5600
  Configuration from Bus 3249"

  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    V_0=1 "power flow, terminal voltage",
    angle_0=42.77 "power flow, angle in degree",
    P_0=643 "power flow, active power, (MW)",
    Q_0=54.8304 "power flow, reactive power, (Mvar)",
    M_b=1357 "system base power rating (MVA)",
    Tpd0=5.0 "T'do (> 0)",
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    H=3.3 "Inertia",
    D=0 "Speed Damping",
    Xd=0.75 "d-axis reactance",
    Xq=0.5 "q-axis reactance",
    Xpd=0.25 "d-axis transient reactance",
    Xppd=0.1538 "d-axis subtransient reactance",
    Xppq=0.1538 "q-axis subtransient reactance",
    Xl=0.1154 "leakage reactance",
    S10=0.1024,
    S12=0.2742,
    S_b=1000)
    annotation (Placement(transformation(extent={{-80,-28},{-28,26}})));
  iPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop (pu)",
    r=0.4 "Temporary droop (pu)",
    T_r=5 "Governor time constant, s",
    T_f=0.05 "Filter time constant, s",
    T_g=0.2 "Servo time constant, s",
    VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
    G_MAX=1 "Maximum gate limit (pu)",
    G_MIN=0 "Minimum gate limit (pu)",
    T_w=1 "Water time constant, s",
    A_t=1.0577 "Turbine gain (pu)",
    D_turb=0.5 "Turbine damping (pu)",
    q_NL=0.1 "Water flow at no load. p.u")
    annotation (Placement(transformation(extent={{-128,0},{-76,28}})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    V_c0=1 "initial value of ECOMP",
    V_0=1 "initial value of ETERM",
    T_AT_B=0.1 "TA/TB",
    T_B=10 "TB (sec)",
    K=100 "K",
    T_E=0.05 "TE (sec)",
    E_MIN=0 "EMIN (pu on EFD base)",
    E_MAX=5 "EMAX (pu on EFD base)",
    C_SWITCH=0 "Cswitch",
    r_cr_fd=0 "rc/rfd")
    annotation (Placement(transformation(extent={{-118,-26},{-84,0}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-143,-17},{-133,-7}})));
  iPSL.Connectors.PwPin p annotation (Placement(transformation(rotation=0,
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(hYGOV.PMECH,gENSAL. PMECH) annotation (Line(
      points={{-74.7,14},{-79.9,14},{-79.9,12.5},{-79.48,12.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.SPEED,hYGOV. SPEED) annotation (Line(
      points={{-25.92,23.3},{-30,23.3},{-30,34},{-126,34},{-126,21},{-127.35,21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0,hYGOV. PMECH0) annotation (Line(
      points={{-25.92,-9.1},{-28,-9.1},{-28,38},{-128,38},{-128,7},{-127.35,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y,sCRX. VOEL) annotation (Line(
      points={{-132.5,-12},{-124,-12},{-124,-8.45},{-117.858,-8.45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y,sCRX. VUEL) annotation (Line(
      points={{-132.5,-12},{-124,-12},{-124,-11.83},{-117.858,-11.83}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0,sCRX. EFD0) annotation (Line(
      points={{-25.92,-19.9},{-30,-19.9},{-30,-36},{-116,-36},{-116,-23.53},
          {-117.858,-23.53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y,sCRX.VOTHSG) annotation (Line(
      points={{-132.5,-12},{-124,-12},{-124,-5.33},{-117.858,-5.33}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD,gENSAL. EFD) annotation (Line(
      points={{-83.4333,-12.87},{-82,-12.87},{-82,-14.5},{-79.48,-14.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM,sCRX. ETERM) annotation (Line(
      points={{-25.92,12.5},{-34,12.5},{-34,-40},{-118,-40},{-118,-18.98},{
          -118.142,-18.98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD,sCRX. XADIFD) annotation (Line(
      points={{-25.92,-25.3},{-25.92,-44},{-120,-44},{-120,-14.69},{
          -118.142,-14.69}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM,sCRX.ECOMP) annotation (Line(
      points={{-25.92,12.5},{-130,12.5},{-130,40},{-24,40},{-24,12},{-34,12},
          {-34,-40},{-118,-40},{-118,-1.69},{-117.858,-1.69}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, gENSAL.p) annotation (Line(points={{110,0},{32,0},{32,-1},{-25.4,
          -1}},    color={0,0,255}));
  connect(p, p) annotation (Line(
      points={{110,0},{104,0},{104,0},{110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),
        Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),
        Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),
        Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENSAL & 
SCRX & 
HYGOV")}),
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
end Group2;
