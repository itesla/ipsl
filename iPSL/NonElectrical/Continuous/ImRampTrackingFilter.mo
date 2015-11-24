within iPSL.NonElectrical.Continuous;
model ImRampTrackingFilter "Ramp-tracking filter"

  parameter Real T_1;
  parameter Real T_2;
  parameter Integer M;
  parameter Integer N;
  parameter Real startValue;

 input Modelica.Blocks.Interfaces.RealInput p
    annotation (Placement(transformation(extent={{-124,-20},{-84,20}}),
        iconTransformation(extent={{-124,-20},{-84,20}})));
 output Modelica.Blocks.Interfaces.RealOutput n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  ImLeadLag LL_1(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-94,66},{-48,114}})));
  ImLeadLag LL_2(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-54,66},{-8,114}})));
  ImLeadLag LL_3(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-94,16},{-48,64}})));
  ImLeadLag LL_4(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-52,16},{-6,64}})));
  ImLeadLag LL_5(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{8,66},{54,114}})));
  ImLeadLag LL_6(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{46,66},{92,114}})));
  ImLeadLag LL_7(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{8,16},{54,64}})));
  ImLeadLag LL_8(
    K=1,
    T1=T_1,
    T2=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{46,16},{92,64}})));
protected
  Modelica.Blocks.Interfaces.RealInput LL_out
    annotation (Placement(transformation(extent={{-126,-100},{-86,-60}})));
public
  ImSimpleLag SL_1(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-98,-104},{-50,-56}})));
  ImSimpleLag SL_2(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-58,-104},{-10,-56}})));
  ImSimpleLag SL_3(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-98,-54},{-50,-6}})));
  ImSimpleLag SL_4(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{-60,-54},{-12,-6}})));
  ImSimpleLag SL_5(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{2,-104},{50,-56}})));
  ImSimpleLag SL_6(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{42,-104},{90,-56}})));
  ImSimpleLag SL_7(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{0,-54},{48,-6}})));
  ImSimpleLag SL_8(
    K=1,
    T=T_2,
    nStartValue=startValue)
    annotation (Placement(transformation(extent={{42,-54},{90,-6}})));
protected
  Modelica.Blocks.Interfaces.RealInput SL_out
    annotation (Placement(transformation(extent={{10,-20},{50,20}})));
initial equation

equation
  if (N == 1) then
    LL_1.n1 = LL_out;
  elseif (N == 2) then
    LL_2.n1 = LL_out;
  elseif (N == 3) then
    LL_3.n1 = LL_out;
  elseif (N == 4) then
    LL_4.n1 = LL_out;
  elseif (N == 5) then
    LL_5.n1 = LL_out;
  elseif (N == 6) then
    LL_6.n1 = LL_out;
  elseif (N == 7) then
    LL_7.n1 = LL_out;
  else
    LL_8.n1 = LL_out;
  end if;
  if not
        (M == 0) then
    connect(SL_out, n);
  else
    connect(p,n);
  end if;
  if (M == 1) then
    SL_1.n1 = SL_out;
  elseif (M == 2) then
    SL_2.n1 = SL_out;
  elseif (M == 3) then
    SL_3.n1 = SL_out;
  elseif (M == 4) then
    SL_4.n1 = SL_out;
  elseif (M == 5) then
    SL_5.n1 = SL_out;
  elseif (M == 6) then
    SL_6.n1 = SL_out;
  elseif (M == 7) then
    SL_7.n1 = SL_out;
  else
    SL_8.n1 = SL_out;
  end if;
  connect(p, LL_1.p1) annotation (Line(points={{-104,0},{-92,0},{-92,90},{
          -82.73,90}},
                color={0,0,127}));
  connect(LL_1.n1, LL_2.p1)
    annotation (Line(points={{-59.73,90},{-42.73,90}}, color={0,0,127}));
  connect(LL_2.n1, LL_3.p1) annotation (Line(points={{-19.73,90},{-14,90},{-14,60},
          {-88,60},{-88,40},{-82.73,40}}, color={0,0,127}));
  connect(LL_3.n1, LL_4.p1) annotation (Line(points={{-59.73,40},{-40.73,40},{-40.73,
          40}}, color={0,0,127}));
  connect(LL_4.n1, LL_5.p1) annotation (Line(points={{-17.73,40},{2,40},{2,90},{
          19.27,90}}, color={0,0,127}));
  connect(LL_5.n1, LL_6.p1) annotation (Line(points={{42.27,90},{57.27,90},{57.27,
          90}}, color={0,0,127}));
  connect(LL_6.n1, LL_7.p1) annotation (Line(points={{80.27,90},{86,90},{86,58},
          {10,58},{10,40},{19.27,40}}, color={0,0,127}));
  connect(LL_7.n1, LL_8.p1) annotation (Line(points={{42.27,40},{57.27,40},{57.27,
          40}}, color={0,0,127}));
  connect(LL_out, SL_1.p1) annotation (Line(points={{-106,-80},{-94,-80},{-81.44,
          -80}}, color={0,0,127}));
  connect(SL_1.n1, SL_2.p1) annotation (Line(points={{-57.2,-80},{-50,-80},{-41.44,
          -80}}, color={0,0,127}));
  connect(SL_2.n1, SL_3.p1) annotation (Line(points={{-17.2,-80},{-10,-80},{-10,
          -60},{-88,-60},{-88,-30},{-81.44,-30}}, color={0,0,127}));
  connect(SL_3.n1, SL_4.p1)
    annotation (Line(points={{-57.2,-30},{-43.44,-30}}, color={0,0,127}));
  connect(SL_4.n1, SL_5.p1) annotation (Line(points={{-19.2,-30},{0,-30},{0,-80},
          {18.56,-80}}, color={0,0,127}));
  connect(SL_5.n1, SL_6.p1)
    annotation (Line(points={{42.8,-80},{58.56,-80}}, color={0,0,127}));
  connect(SL_6.n1, SL_7.p1) annotation (Line(points={{82.8,-80},{90,-80},{90,-60},
          {10,-60},{10,-30},{16.56,-30}}, color={0,0,127}));
  connect(SL_7.n1, SL_8.p1)
    annotation (Line(points={{40.8,-30},{58.56,-30}}, color={0,0,127}));
    annotation (Line(points={{30,0},{110,0}}, color={0,0,127}),
              Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
            -100},{100,100}},
        initialScale=0.05)),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Text(
          extent={{-58,40},{40,-4}},
          lineColor={28,108,200},
          textString="1+sT"),
        Text(
          extent={{-64,20},{56,-58}},
          lineColor={28,108,200},
          textString="(1+sT )"),
        Text(
          extent={{22,28},{44,-4}},
          lineColor={28,108,200},
          textString="1"),
        Text(
          extent={{24,-10},{46,-42}},
          lineColor={28,108,200},
          textString="2"),
        Text(
          extent={{54,2},{66,-16}},
          lineColor={28,108,200},
          textString="M"),
        Line(
          points={{-60,40},{-74,40},{-74,-40},{-60,-40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{60,40},{76,40},{76,-40},{60,-40}},
          color={28,108,200},
          thickness=1),
        Text(
          extent={{76,48},{94,28}},
          lineColor={28,108,200},
          textString="N"),
        Line(
          points={{-68,0},{70,0}},
          color={28,108,200},
          thickness=1)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
Ramp-tracking filter up to M*N<=8
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
2015-08-03
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
end ImRampTrackingFilter;
