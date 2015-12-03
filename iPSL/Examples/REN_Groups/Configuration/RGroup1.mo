within iPSL.Examples.REN_Groups.Configuration;
model RGroup1 "Machine configuration of synchronous machine with regulators: GENSAL, ESST1A, HYGOV, IEEEST; 
  from REN model: Buses XXX
  Configuration from Bus 78013
  Exciter reg_esst1a_8d802b32_f9a2_11e4_b5b1_78acc0ae2875
  Stabilizer reg_pss2a_8d802b32_f9a2_11e4_b5b1_78acc0ae2875
  Governor reg_hygov_8d802b32_f9a2_11e4_b5b1_78acc0ae2875"
  //Notes
  //1. In GENSAL: Sbase could be necessary
  //2. In ESST1A: cont.y connected always to VUEL1 and VOTHSG
  //3. We don't know how to connect them: eSST1A.ILR, eSST1A.VOTHSG2, eSST1A.VUEL2,eSST1A.VUEL3,eSST1A.XADIFD
  Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    Tpd0=5.15,
    Tppd0=0.05,
    Tppq0=0.05,
    H=3.86,
    D=1.0,
    Xd=1.592,
    Xq=0.97,
    Xpd=0.407,
    Xppd=0.29,
    Xppq=0.29,
    Xl=0.17,
    S10=0.11,
    S12=0.4,
    V_0=1,
    M_b=57.400001525878906,
    angle_0=-0.1014632,
    P_0=5,
    Q_0=17.88221)
    annotation (Placement(transformation(extent={{-56,-22},{-4,32}})));
  Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.05,
    r=0.08,
    T_r=1.22,
    T_f=0.05,
    T_g=0.5,
    VELM=0.167,
    G_MAX=0.93,
    G_MIN=0.0,
    T_w=0.3,
    A_t=1.2,
    D_turb=0.5,
    q_NL=0.08) annotation (Placement(transformation(extent={{6,14},{62,42}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-111,-55},{-101,-45}})));
  Electrical.Controls.PSSE.ES.ESST1A.ESST1A eSST1A(
    T_R=0.04,
    V_IMAX=0.03,
    V_IMIN=-0.03,
    T_B=1,
    T_C=5,
    T_B1=0.01,
    T_C1=0.01,
    K_A=200,
    T_A=0,
    V_AMAX=7,
    V_AMIN=-7,
    V_RMAX=5.2,
    V_RMIN=-5.2,
    K_F=0,
    T_F=1,
    K_C=0.38,
    K_LR=0,
    I_LR=0,
    V_0=1) annotation (Placement(transformation(extent={{-74,-78},{-18,-38}})));
  Modelica.Blocks.Sources.Constant cte1(k=-9999)
    annotation (Placement(transformation(extent={{-81,-113},{-71,-103}})));
  Modelica.Blocks.Sources.Constant cte2(k=9999)
    annotation (Placement(transformation(extent={{-81,-131},{-71,-121}})));
  Electrical.Controls.PSSE.PSS.PSS2A.PSS2A pSS2A(M=1, N=1)
    annotation (Placement(transformation(extent={{-130,-12},{-72,2}})));
  Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{
            100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(pSS2A.VOTHSG, eSST1A.VOTHSG) annotation (Line(points={{-71.0842,-5},{
          -50.6,-5},{-50.6,-35.75}}, color={0,0,127}));
  connect(cte.y, eSST1A.VOTHSG2) annotation (Line(points={{-100.5,-50},{-90,-50},
          {-90,-35.75},{-58.04,-35.75}}, color={0,0,127}));
  connect(eSST1A.ECOMP, gENSAL.ETERM) annotation (Line(points={{-71.86,-58.5},{
          -82,-58.5},{-82,-94},{0,-94},{0,18.5},{-1.92,18.5}}, color={0,0,127}));
  connect(eSST1A.VT, gENSAL.ETERM) annotation (Line(points={{-37.6,-79.75},{-37.6,
          -94},{0,-94},{0,18.5},{-1.92,18.5}}, color={0,0,127}));
  connect(eSST1A.XADIFD, gENSAL.XADIFD) annotation (Line(points={{-33.35,-77.3875},
          {-33.35,-86},{-14,-86},{-14,-28},{-1.92,-28},{-1.92,-19.3}}, color={0,
          0,127}));
  connect(eSST1A.EFD, gENSAL.EFD) annotation (Line(points={{-21.6,-57.85},{-8,-57.85},
          {-8,-28},{-60,-28},{-60,-8.5},{-55.48,-8.5}}, color={0,0,127}));
  connect(gENSAL.PMECH, hYGOV.PMECH) annotation (Line(points={{-55.48,18.5},{-66,
          18.5},{-66,54},{56,54},{56,28},{63.4,28}}, color={0,0,127}));
  connect(hYGOV.PMECH0, gENSAL.PMECH0) annotation (Line(points={{6.7,21},{8,21},
          {8,-3.1},{-1.92,-3.1}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-1.92,29.3},{12,
          29.3},{12,35},{6.7,35}}, color={0,0,127}));
  connect(eSST1A.EFD0, gENSAL.EFD0) annotation (Line(points={{-35.6,-36.175},{-35.6,
          -32},{-6,-32},{-6,-13.9},{-1.92,-13.9}}, color={0,0,127}));
  connect(cte2.y, eSST1A.VOEL) annotation (Line(points={{-70.5,-126},{-45.5,-126},
          {-45.5,-80.3}}, color={0,0,127}));
  connect(cte1.y, eSST1A.VUEL2) annotation (Line(points={{-70.5,-108},{-59.36,-108},
          {-59.36,-79.95}}, color={0,0,127}));
  connect(eSST1A.VUEL1, eSST1A.VUEL2) annotation (Line(points={{-65.66,-80},{-66,
          -80},{-66,-108},{-59.36,-108},{-59.36,-79.95}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-53.26,-80.225},
          {-53.26,-108},{-59.36,-108},{-59.36,-79.95}}, color={0,0,127}));
  connect(pSS2A.V_S2, gENSAL.PELEC) annotation (Line(points={{-130,-8.5},{-138,
          -8.5},{-138,-24},{4,-24},{4,-8.5},{-1.92,-8.5}}, color={0,0,127}));
  connect(gENSAL.p, p) annotation (Line(points={{-1.4,5},{84,5},{84,0},{110,0}},
        color={0,0,255}));
  connect(pSS2A.V_S1, hYGOV.SPEED) annotation (Line(points={{-130,-1.5},{-140,-1.5},
          {-140,42},{-4,42},{-4,28},{12,28},{12,35},{6.7,35}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),
          Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-100,-100},{101,100}}, lineColor
          ={0,0,255}),Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENSAL & 
STAB2A &
SCRX & 
HYGOV")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
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
end RGroup1;

