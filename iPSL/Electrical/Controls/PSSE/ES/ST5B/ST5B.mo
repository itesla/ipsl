within iPSL.Electrical.Controls.PSSE.ES.ST5B;
model ST5B "IEEE 421.5 2005 ST5B Excitation System"
   parameter Real T_R=0.025 "Regulator input filter time constant (s)";
   parameter Real T_C1=0.1
    "Lead time constant of first lead-lag block (voltage regulator channel) (s)";
   parameter Real T_B1=0.2
    "Lag time constant of first lead-lag block (voltage regulator channel) (s)";
   parameter Real T_C2=1
    "Lead time constant of second lead-lag block (voltage regulator channel) (s)";
   parameter Real T_B2=1
    "Lag time constant of second lead-lag block (voltage regulator channel) (s)";
   parameter Real K_R=1 "Voltage regulator gain (pu)";
   parameter Real V_RMAX=10 "Voltage regulator maximum limit (pu)";
   parameter Real V_RMIN=-10 "Voltage regulator minimum limit (pu)";
   parameter Real T_1=0.58 "voltage regulator time constant (s)";
   parameter Real K_C=0.3 "(pu)";
   parameter Real T_UC1=1
    "Lead time constant of first lead-lag block (under- excitation channel) (s)";
   parameter Real T_UB1=1
    "Lag time constant of first lead-lag block (under- excitation channel) (s)";
   parameter Real T_UC2=1
    "Lead time constant of second lead-lag block (under- excitation channel) (s)";
   parameter Real T_UB2=1
    "Lag time constant of second lead-lag block (under- excitation channel) (s)";
   parameter Real T_OC1=1
    "Lead time constant of first lead-lag block (over- excitation channel) (s)";
   parameter Real T_OB1=1
    "Lag time constant of first lead-lag block (over- excitation channel) (s)";
   parameter Real T_OC2=1
    "Lead time constant of second lead-lag block (over- excitation channel) (s)";
   parameter Real T_OB2=1
    "Lag time constant of second lead-lag block (over- excitation channel) (s)";
protected
   parameter Real VT(fixed= false);
   parameter Real VREF(fixed=false);
   parameter Real Vm0(fixed=false);
   parameter Real VR0(fixed=false);
public
  Modelica.Blocks.Interfaces.RealInput ECOMP
    annotation (Placement(transformation(extent={{-156,-18},{-118,20}}),
        iconTransformation(extent={{-160,120},{-126,154}})));
  Modelica.Blocks.Interfaces.RealInput
                                   V_REF
    annotation (Placement(transformation(extent={{-160,78},{-122,116}}),
        iconTransformation(extent={{-160,78},{-122,116}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(transformation(
        extent={{-18,-18},{18,18}},
        rotation=0,
        origin={-136,-88}), iconTransformation(extent={{-18,-18},{18,18}},
          origin={-142,-66})));
  Modelica.Blocks.Interfaces.RealOutput EFD
    annotation (Placement(transformation(extent={{460,-10},{480,10}}),
        iconTransformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Interfaces.RealInput VUEL
                                           annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-135,79}),  iconTransformation(extent={{-18,-18},{18,18}},
          origin={-142,56})));

  Modelica.Blocks.Interfaces.RealInput EFD0
                                           annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=90,
        origin={-81,-213}), iconTransformation(extent={{-17,-17},{17,17}},
          origin={-143,-107})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(
        transformation(
        extent={{-19,-19},{19,19}},
        rotation=0,
        origin={-145,-29}), iconTransformation(extent={{-18,-18},{18,18}},
          origin={-142,-26})));
  Modelica.Blocks.Math.Add VERR(k1=-1, k2=1) annotation (Placement(
        transformation(
        extent={{-8,8},{8,-8}},
        rotation=0,
        origin={-50,0})));

  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(
        transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-135,99}),  iconTransformation(extent={{-18,-18},{18,18}},
          origin={-142,14})));
  Modelica.Blocks.Math.Add VERR1             annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={62,0})));
  NonElectrical.Logical.LV_GATE
          lV_Gate
    annotation (Placement(transformation(extent={{18,-12},{44,18}})));
  NonElectrical.Logical.HV_GATE
          hV_Gate
    annotation (Placement(transformation(extent={{-22,-14},{4,14}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_C1,
    T2=T_B1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag2(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_C2,
    T2=T_B2,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Math.Gain K_r(k=K_R)
                                      annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={295,0})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{326,-10},{346,10}})));
  Modelica.Blocks.Math.Add VERR2(
                                k1=-1, k2=1) annotation (Placement(
        transformation(
        extent={{-9,9},{9,-9}},
        rotation=0,
        origin={385,1})));
  Modelica.Blocks.Math.Gain K_c(k=K_C)
                                      annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={289,-141})));
  Modelica.Blocks.Continuous.TransferFunction sTR(a={T_R,1})
    annotation (Placement(transformation(extent={{-98,-8},{-82,8}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag1(
    K=1,
    T1=T_UC1,
    T2=T_UB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R,
    outMax=V_RMAX/K_R)
    annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag3(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_UC1,
    T2=T_UB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{160,-60},{180,-40}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag4(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_OC1,
    T2=T_OB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{100,-120},{120,-100}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag5(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_OC1,
    T2=T_OB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{160,-120},{180,-100}})));
  SelectLogic selectLogic
    annotation (Placement(transformation(extent={{240,-12},{260,8}})));
  NonElectrical.Continuous.SimpleLagLimVar simpleLagLimVar(
    K=1,
    T=T_1,
    y_start=VR0)
    annotation (Placement(transformation(extent={{414,-10},{434,10}})));
  Modelica.Blocks.Math.Gain high(k=V_RMAX)
                                      annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={341,-29})));
  Modelica.Blocks.Math.Gain low(k=V_RMIN) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={343,-69})));
initial equation
    VR0=EFD0+K_C*XADIFD;
    VREF=VR0/K_R+ECOMP;
    Vm0=ECOMP;

equation

  connect(K_r.y, limiter.u) annotation (Line(
      points={{304.9,0},{324,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(XADIFD, K_c.u) annotation (Line(
      points={{-136,-88},{-54,-88},{-54,-141},{278.2,-141}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K_c.y, VERR2.u1) annotation (Line(
      points={{298.9,-141},{364,-141},{364,-4.4},{374.2,-4.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V_REF, VERR.u2) annotation (Line(
      points={{-141,97},{-72,97},{-72,4.8},{-59.6,4.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECOMP, sTR.u) annotation (Line(
      points={{-137,1},{-118.5,1},{-118.5,0},{-99.6,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTR.y, VERR.u1) annotation (Line(
      points={{-81.2,0},{-70,0},{-70,-4.8},{-59.6,-4.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG, VERR1.u1) annotation (Line(
      points={{-145,-29},{44,-29},{44,-6},{50,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, VERR2.u2) annotation (Line(
      points={{347,0},{360,0},{360,6.4},{374.2,6.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K_r.u, selectLogic.Vout) annotation (Line(
      points={{284.2,0},{261,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL, selectLogic.VOEL) annotation (Line(
      points={{-135,99},{244,99},{244,9.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VUEL, selectLogic.VUEL) annotation (Line(
      points={{-135,79},{250,79},{250,9.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VERR.y, selectLogic.VERR) annotation (Line(
      points={{-41.2,0},{-36,0},{-36,28},{256,28},{256,9.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_Gate.n1, VUEL) annotation (Line(
      points={{-18.1,2.52},{-24.05,2.52},{-24.05,79},{-135,79}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_Gate.n2, selectLogic.VERR) annotation (Line(
      points={{-18.1,-3.64},{-36,-3.64},{-36,28},{256,28},{256,9.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_Gate.p, lV_Gate.n2) annotation (Line(
      points={{-1.33,-0.7},{8.335,-0.7},{8.335,-0.9},{21.9,-0.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.p, VERR1.u2) annotation (Line(
      points={{38.67,2.25},{42.335,2.25},{42.335,6},{50,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.n1, selectLogic.VOEL) annotation (Line(
      points={{21.9,5.7},{21.9,100},{244,100},{244,9.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VERR1.y, imLimitedLeadLag.u)
    annotation (Line(points={{73,0},{85.5,0},{98,0}}, color={0,0,127}));
  connect(imLimitedLeadLag.y, imLimitedLeadLag2.u)
    annotation (Line(points={{121,0},{139.5,0},{158,0}}, color={0,0,127}));
  connect(imLimitedLeadLag2.y, selectLogic.V1) annotation (Line(points={{181,0},
          {220,0},{220,4},{238.2,4}}, color={0,0,127}));
  connect(imLimitedLeadLag1.u, imLimitedLeadLag.u) annotation (Line(points={{98,
          -50},{80,-50},{80,0},{98,0}}, color={0,0,127}));
  connect(imLimitedLeadLag1.y, imLimitedLeadLag3.u) annotation (Line(points={{121,
          -50},{139.5,-50},{158,-50}}, color={0,0,127}));
  connect(imLimitedLeadLag3.y, selectLogic.V2) annotation (Line(points={{181,-50},
          {220,-50},{220,-2},{238.2,-2}}, color={0,0,127}));
  connect(imLimitedLeadLag4.u, imLimitedLeadLag.u) annotation (Line(points={{98,
          -110},{80,-110},{80,0},{98,0}}, color={0,0,127}));
  connect(imLimitedLeadLag4.y, imLimitedLeadLag5.u) annotation (Line(points={{121,
          -110},{158,-110},{158,-110}}, color={0,0,127}));
  connect(imLimitedLeadLag5.y, selectLogic.V3) annotation (Line(points={{181,-110},
          {224,-110},{224,-8},{238.2,-8}}, color={0,0,127}));
  connect(VERR2.y, simpleLagLimVar.u) annotation (Line(points={{394.9,1},{403.45,
          1},{403.45,0},{412,0}}, color={0,0,127}));
  connect(low.y, simpleLagLimVar.outMin) annotation (Line(points={{352.9,-69},{416,
          -69},{416,-14}}, color={0,0,127}));
  connect(high.y, simpleLagLimVar.outMax) annotation (Line(points={{350.9,-29},{
          404,-29},{404,30},{432,30},{432,14}}, color={0,0,127}));
  connect(low.u, sTR.u) annotation (Line(points={{332.2,-69},{320,-69},{320,-180},
          {-40,-180},{-40,-20},{-110,-20},{-110,0},{-99.6,0}}, color={0,0,127}));
  connect(high.u, sTR.u) annotation (Line(points={{330.2,-29},{320,-29},{320,-180},
          {-40,-180},{-40,-20},{-110,-20},{-110,0},{-99.6,0}}, color={0,0,127}));
  connect(EFD, simpleLagLimVar.y)
    annotation (Line(points={{470,0},{468,0},{435,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-160,
            -160},{160,160}})),Icon(coordinateSystem(extent={{-160,-160},{160,
            160}},
          preserveAspectRatio=false),graphics={
        Text(
          extent={{-56,22},{66,-22}},
          lineColor={0,0,255},
          textString="ST5B"),
        Rectangle(extent={{-160,160},{160,-160}},
                                               lineColor={0,0,255}),
        Text(
          extent={{-120,176},{-54,96}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-120,-10},{-42,-44}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-118,-34},{-58,-98}},
          lineColor={0,0,255},
          textString="XADIFD"),
        Text(
          extent={{-122,86},{-70,22}},
          lineColor={0,0,255},
          textString="VUEL"),
        Text(
          extent={{-130,-98},{-66,-118}},
          lineColor={0,0,255},
          textString="EFD0"),
        Text(
          extent={{-120,44},{-68,-18}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{118,32},{156,-30}},
          lineColor={0,0,255},
          textString="EFD"),
        Text(
          extent={{-118,126},{-68,62}},
          lineColor={0,0,255},
          textString="VREF")}),
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
end ST5B;
