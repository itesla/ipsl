within iPSL.Electrical.Controls.PSSE.TG;
model TGOV1 "Steam Turbine-Governor"

  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
                                             annotation (Placement(
        transformation(extent={{-76,-32},{-66,-20}}), iconTransformation(extent={{-86,-40},
            {-66,-20}})));
  iPSL.NonElectrical.Continuous.ImLeadLag imLeadLag(
    T1=T_2,
    T2=T_3,
    K=1,
    nStartValue=P0)
    annotation (Placement(transformation(extent={{26,28},{78,66}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)"
                                              annotation (Placement(
        transformation(extent={{94,42},{104,54}}), iconTransformation(extent={{80,-10},
            {100,10}})));
parameter Real P0 "Power reference of the governor";
parameter Real R "Governor gain, 1/R (pu)";
parameter Real D_t "(pu)";
parameter Real T_1 "Control time constant (s)";
parameter Real T_2 "Control time constant (s)";
parameter Real T_3 "Control time constant (s)";
parameter Real V_MAX "Max. valve position (p.u. on M_b)";
parameter Real V_MIN "min. valve position (p.u. on M_b)";
Real V "Valve position (pu)";
  Modelica.Blocks.Interfaces.RealInput Reference "Speed reference (pu)"
    annotation (Placement(transformation(extent={{-88,46},{-78,58}}),
        iconTransformation(extent={{-86.9,19.9},{-66.9,39.9}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_7(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-74,38},{-52,60}})));
  iPSL.NonElectrical.Math.ImGain imGain9(K=1/R)
    annotation (Placement(transformation(extent={{-48,38},{-26,60}})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit       imLimitedSimpleLag(
    Ymin=V_MIN,
    Ymax=V_MAX,
    K=1,
    T=T_1,
    nStartValue=P0)
    annotation (Placement(transformation(extent={{-30,30},{28,66}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{76,36},{98,58}})));
  iPSL.NonElectrical.Math.ImGain imGain1(K=D_t)
    annotation (Placement(transformation(extent={{-32,0},{-10,24}})));
equation
  V = imLimitedSimpleLag.n0;
  connect(Reference, imSum2_7.p1) annotation (Line(
      points={{-83,52},{-80,52},{-80,51.2},{-68.61,51.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SPEED, imSum2_7.p2) annotation (Line(
      points={{-71,-26},{-68.61,-26},{-68.61,46.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_7.n1, imGain9.p1) annotation (Line(
      points={{-57.61,49},{-42.61,49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain9.n1, imLimitedSimpleLag.p1) annotation (Line(
      points={{-31.61,49},{-18.805,49},{-18.805,48},{-15.79,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLeadLag.n1, imSum2_1.p1) annotation (Line(
      points={{64.74,47},{72.37,47},{72.37,49.2},{81.39,49.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain1.n1, imSum2_1.p2) annotation (Line(
      points={{-15.61,12},{80,12},{80,44.8},{81.39,44.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain1.p1, SPEED) annotation (Line(
      points={{-26.61,12},{-59.805,12},{-59.805,-26},{-71,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.n1, PMECH) annotation (Line(
      points={{92.39,47},{95.195,47},{95.195,48},{99,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedSimpleLag.n0, imLeadLag.p1) annotation (Line(
      points={{13.21,48},{26,48},{26,47},{38.74,47}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(extent={{-80,-60},{80,60}},
          preserveAspectRatio=false,
        grid={1,1})),                           Icon(coordinateSystem(extent={{-80,-60},
            {80,60}},         preserveAspectRatio=false,
        grid={1,1}),                                     graphics={
        Rectangle(extent={{-80,60},{80,-60}},  lineColor={0,0,255}),
        Text(
          extent={{-69,-25},{-24,-36}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED"),
        Text(
          extent={{44,7},{79,-8}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH"),
        Text(
          extent={{-48,14},{42,-14}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="TGOV1"),
        Text(
          extent={{-63,37},{-24,23}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Referece")}),
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
end TGOV1;
