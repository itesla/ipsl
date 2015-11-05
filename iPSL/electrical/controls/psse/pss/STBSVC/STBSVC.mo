within iPSL.Electrical.Controls.PSSE.PSS.STBSVC;
model STBSVC "WECC Supplementary Signal for Static var Compensator"
  parameter Real K_S1 ">0";
  parameter Real T_S7 "(s)";
  parameter Real T_S8 "(s)";
  parameter Real T_S9 ">0 (s)";
  parameter Real T_S13 ">0 (s)";
  parameter Real T_S14 ">0 (s)";
  parameter Real K_S3 ">0";
  parameter Real V_SCS;
  parameter Real K_S2;
  parameter Real T_S10 "(s)";
  parameter Real T_S11 "(s)";
  parameter Real T_S12 ">0, if K_S2 != 0 (s)";

  NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=K_S1,
    nStartValue=V_S10,
    T=T_S7)
    annotation (Placement(transformation(extent={{-94,26},{-46,74}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    nStartValue=V_S10,
    K=K_S2,
    T=T_S10)
    annotation (Placement(transformation(extent={{-94,-74},{-46,-26}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_S8,
    T2=T_S9,
    nStartValue=V_S10)
    annotation (Placement(transformation(extent={{-62,26},{-14,74}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag1(
    K=1,
    T1=T_S11,
    T2=T_S12,
    nStartValue=V_S20)
    annotation (Placement(transformation(extent={{-62,-74},{-14,-26}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    K=T_S13,
    T=T_S14,
    pStartValue=0)
    annotation (Placement(transformation(extent={{16,-10},{36,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S3)
    annotation (Placement(transformation(extent={{44,-10},{64,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_SCS, uMin=-V_SCS)
    annotation (Placement(transformation(extent={{74,-10},{94,10}})));
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-150,30},{-110,70}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-150,-70},{-110,-30}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "Stabilizer signal (pu)"
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
protected
  parameter Real V_S10(fixed=false);
  parameter Real V_S20(fixed=false);
initial equation
  V_S10 = V_S1;
  V_S20 = V_S2;

equation
  connect(imSimpleLag1.n1, imLeadLag1.p1) annotation (Line(points={{-53.2,-50},
          {-53.2,-50},{-50.24,-50}},
                              color={0,0,127}));
  connect(imSimpleLag.n1, imLeadLag.p1)
    annotation (Line(points={{-53.2,50},{-50.24,50}},
                                                    color={0,0,127}));
  connect(imLeadLag.n1, add.u1) annotation (Line(points={{-26.24,50},{-20,50},{-20,
          6},{-14,6}}, color={0,0,127}));
  connect(imLeadLag1.n1, add.u2) annotation (Line(points={{-26.24,-50},{-20,-50},
          {-20,-6},{-14,-6}}, color={0,0,127}));
  connect(add.y, imDerivativeLag.p1)
    annotation (Line(points={{9,0},{16.1,0}}, color={0,0,127}));
  connect(imDerivativeLag.n1, gain.u)
    annotation (Line(points={{36.1,0},{42,0}}, color={0,0,127}));
  connect(gain.y, limiter.u)
    annotation (Line(points={{65,0},{68,0},{72,0}}, color={0,0,127}));
  connect(V_S1, imSimpleLag.p1) annotation (Line(points={{-130,50},{-77.44,50},
          {-77.44,50}},
                    color={0,0,127}));
  connect(V_S2, imSimpleLag1.p1) annotation (Line(points={{-130,-50},{-77.44,
          -50},{-77.44,-50}},
                         color={0,0,127}));
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{95,0},{130,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-120,
            -100},{120,100}})), Icon(coordinateSystem(extent={{-120,-100},{120,
            100}}, preserveAspectRatio=true), graphics={
        Rectangle(extent={{-120,100},{120,-100}}, lineColor={28,108,200}),
        Text(
          extent={{-112,58},{-66,44}},
          lineColor={28,108,200},
          textString="V_S1"),
        Text(
          extent={{-120,-42},{-58,-56}},
          lineColor={28,108,200},
          textString="V_S2"),
        Text(
          extent={{70,10},{118,-6}},
          lineColor={28,108,200},
          textString="VOTHSG"),
        Text(
          extent={{-62,30},{66,-32}},
          lineColor={28,108,200},
          textString="STBSVC")}),
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
end STBSVC;
