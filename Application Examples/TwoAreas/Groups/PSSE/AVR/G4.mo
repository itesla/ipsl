within TwoAreas.Groups.PSSE.AVR;
model G4
  extends iPSL.Electrical.Essentials.pfComponent;

  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  iPSL.Electrical.Machines.PSSE.GENROU.GENROU gENSAL(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.175,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    R_a=0.0025,
    D=0.02,
    S12=0.802,
    S10=0.18600,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.55,
    Tpq0=0.4,
    M_b=350) annotation (Placement(transformation(extent={{4,-18},{44,18}})));
  iPSL.Electrical.Controls.PSSE.ES.ESDC1A.ESDC1A eSDC1A(
    T_R=0.05,
    K_A=20,
    T_A=0.055,
    T_B=1,
    T_C=1,
    V_RMAX=4,
    V_RMIN=-4,
    K_E=-0.072,
    T_E=0.36,
    K_F=0.125,
    T_F1=1.8,
    E_1=1,
    E_2=2,
    S_EE_1=0.0164,
    S_EE_2=0.0481) annotation (Placement(transformation(extent={{-32,-16},{0,-2}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-52,8},{-44,16}})));
equation

  connect(gENSAL.p, pwPin) annotation (Line(points={{46,0},{42,0},{70,0}}, color={0,0,255}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{4.4,9},{2,9},{2,14},{-8,14},{-8,32},{50,32},{50,-5.4},{45.6,-5.4}}, color={0,0,127}));
  connect(eSDC1A.EFD, gENSAL.EFD) annotation (Line(points={{0.888889,-9},{0.888889,-9},{2,-9},{4.4,-9}}, color={0,0,127}));
  connect(eSDC1A.EFD0, gENSAL.EFD0) annotation (Line(points={{-19.5556,-14.95},{-19.5556,-22},{50,-22},{50,-12.6},{45.6,-12.6}}, color={0,0,127}));
  connect(const.y, eSDC1A.VUEL) annotation (Line(points={{-43.6,12},{-38,12},{-38,-14.25},{-31.1111,-14.25}}, color={0,0,127}));
  connect(eSDC1A.VOEL, eSDC1A.VUEL) annotation (Line(points={{-31.1111,-10.75},{-38,-10.75},{-38,-14.25},{-31.1111,-14.25}}, color={0,0,127}));
  connect(eSDC1A.VOTHSG, eSDC1A.VUEL) annotation (Line(points={{-31.1111,-7.25},{-38,-7.25},{-38,-14.25},{-31.1111,-14.25}}, color={0,0,127}));
  connect(eSDC1A.ECOMP, eSDC1A.VUEL) annotation (Line(points={{-31.1111,-3.925},{-38,-3.925},{-38,-14.25},{-31.1111,-14.25}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-60,-60},{60,60}},
        initialScale=0.1)),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-60,-60},{60,60}},
        initialScale=0.1), graphics={
        Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
        Line(points={{-40,0},{-20,20}}, color={28,108,200}),
        Line(points={{-20,20},{20,-20},{40,0}}, color={28,108,200}),
        Text(
          extent={{-24,-22},{18,-52}},
          lineColor={28,108,200},
          textString="G4")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>", info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end G4;
