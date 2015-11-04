within iPSL.Electrical.Controls.PSSE.PSS.IEE2ST;
model IEE2ST "IEEE Stabilizing Model With Dual-Input Signals"
  parameter Real K_1;
  parameter Real K_2;
  parameter Real T_1 "(s)";
  parameter Real T_2 "(s)";
  parameter Real T_3 "(s), if T_3 equals 0, sT_3 will equal 1.0";
  parameter Real T_4 ">0 (s)";
  parameter Real T_5 "(s)";
  parameter Real T_6 "(s)";
  parameter Real T_7 "(s)";
  parameter Real T_8 "(s)";
  parameter Real T_9 "(s)";
  parameter Real T_10 "(s)";
  parameter Real L_SMAX;
  parameter Real L_SMIN;
  parameter Real V_CU "(pu)";
  parameter Real V_CL "(pu)";

  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-200,20},{-160,60}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-200,-60},{-160,-20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=L_SMAX, uMin=L_SMIN)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

protected
  Modelica.Blocks.Interfaces.RealOutput VSS
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
public
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal"
    annotation (Placement(transformation(extent={{180,-10},{200,10}})));
protected
  parameter Real ICS10(fixed = false);
  parameter Real ICS20(fixed = false);
public
  NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    K=T_3,
    T=T_4,
    pStartValue=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=K_1,
    T=T_1,
    nStartValue=K_1*ICS10)
    annotation (Placement(transformation(extent={{-160,18},{-110,62}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=K_2,
    T=T_2,
    nStartValue=ICS20)
    annotation (Placement(transformation(extent={{-160,-62},{-110,-18}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_5,
    T2=T_6,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-34,-24},{14,24}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag1(
    K=1,
    T1=T_7,
    T2=T_8,
    nStartValue=0)
    annotation (Placement(transformation(extent={{6,-24},{54,24}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag2(
    K=1,
    T1=T_9,
    T2=T_10,
    nStartValue=0)
    annotation (Placement(transformation(extent={{46,-24},{94,24}})));
  Modelica.Blocks.Interfaces.RealInput VCT
    "Compensated machine terminal voltage (pu)"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-60})));
initial equation
  ICS10=V_S1;
  ICS20=V_S2;

equation
 if V_CU == 0 and not V_CL == 0 then
    if VCT > V_CL then
      VOTHSG = VSS;
    else
      VOTHSG = 0;
    end if;
  elseif V_CL == 0 and not V_CU == 0 then
    if VCT < V_CU then
      VOTHSG = VSS;
    else
      VOTHSG = 0;
    end if;
  elseif V_CU == 0 and V_CL == 0 then
    VOTHSG = VSS;
  elseif VCT > V_CL and VCT < V_CU then
    VOTHSG = VSS;
  else
    VOTHSG = 0;
    end if;

  connect(limiter.y, VSS)
    annotation (Line(points={{121,0},{150,0}}, color={0,0,127}));
  connect(add.y, imDerivativeLag.p1) annotation (Line(
      points={{-79,0},{-59.9,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(V_S1, imSimpleLag.p1)
    annotation (Line(points={{-180,40},{-142.75,40}}, color={0,0,127}));
  connect(imSimpleLag.n1, add.u1) annotation (Line(points={{-117.5,40},{-110,
          40},{-110,6},{-102,6}},
                              color={0,0,127}));
  connect(V_S2, imSimpleLag1.p1) annotation (Line(points={{-180,-40},{-162,-40},
          {-142.75,-40}}, color={0,0,127}));
  connect(imSimpleLag1.n1, add.u2) annotation (Line(points={{-117.5,-40},{
          -110,-40},{-110,-6},{-102,-6}},
                                     color={0,0,127}));
  connect(imDerivativeLag.n1, imLeadLag.p1)
    annotation (Line(points={{-39.9,0},{-30,0},{-22.24,0}}, color={0,0,127}));
  connect(imLeadLag.n1, imLeadLag1.p1)
    annotation (Line(points={{1.76,0},{10,0},{17.76,0}}, color={0,0,127}));
  connect(limiter.u, imLeadLag2.n1)
    annotation (Line(points={{98,0},{90,0},{81.76,0}}, color={0,0,127}));
  connect(imLeadLag1.n1, imLeadLag2.p1)
    annotation (Line(points={{41.76,0},{57.76,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -60},{180,60}})), Icon(coordinateSystem(extent={{-180,-60},{180,
            60}},
          preserveAspectRatio=false), graphics={
        Text(
          extent={{-156,52},{-114,28}},
          lineColor={28,108,200},
          textString="ICS1"),
        Text(
          extent={{-158,-28},{-114,-54}},
          lineColor={28,108,200},
          textString="ICS2"),
        Text(
          extent={{-20,-20},{22,-42}},
          lineColor={28,108,200},
          textString="VCT"),
        Text(
          extent={{106,12},{178,-14}},
          lineColor={28,108,200},
          textString="VOTHSG"),
        Text(
          extent={{-50,32},{58,-32}},
          lineColor={28,108,200},
          textString="IEE2ST"),
        Rectangle(extent={{-180,60},{180,-60}}, lineColor={28,108,200})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
IEE2ST, PSSE Manual
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
2015-08-17
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end IEE2ST;
