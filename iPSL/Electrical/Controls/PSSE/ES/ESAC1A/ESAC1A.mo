within iPSL.Electrical.Controls.PSSE.ES.ESAC1A;
model ESAC1A
  import iPSL.NonElectrical.Functions.SE;

   parameter Real V0 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));

  iPSL.NonElectrical.Math.ImSum2 imSum2_1(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{-112,32},{-92,52}})));
  iPSL.NonElectrical.Math.ImSetPoint Vref(V=VREF)
    annotation (Placement(transformation(extent={{-130,48},{-106,72}})));
  iPSL.NonElectrical.Math.ImSum3 imSum3_1(
    a0=0,
    a2=1,
    a1=-1,
    a3=1) annotation (Placement(transformation(extent={{-96,32},{-76,52}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD "Field current"
    annotation (Placement(transformation(extent={{-5,-6},{5,6}},
        rotation=180,
        origin={159,-88}),
        iconTransformation(extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-0.5,-54.9})));
  Modelica.Blocks.Interfaces.RealInput ECOMP
    "Input, generator terminal voltage"
    annotation (Placement(transformation(extent={{-160,34},{-150,46}}),
        iconTransformation(extent={{-160,34},{-150,46}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG "Upss"
    annotation (Placement(transformation(extent={{-160,-26},{-150,-14}}),
        iconTransformation(extent={{-160,-26},{-150,-14}})));
  Modelica.Blocks.Interfaces.RealInput VOEL
    "value from the Over Excitation Limiter"
    annotation (Placement(transformation(extent={{-5,-6},{5,6}},
        rotation=270,
        origin={17,60}), iconTransformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-60.2,-54.9})));
  NonElectrical.Continuous.ImSimpleLag_nowinduplimit       imLimitedSimpleLag(
    nStartValue=VR0,
    Ymin=V_AMIN,
    Ymax=V_AMAX,
    K=K_A,
    T=T_A)
    annotation (Placement(transformation(extent={{-46,24},{-2,60}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(nStartValue=VE0, K=1/
        T_E) annotation (Placement(transformation(extent={{68,26},{88,46}})));
  NonElectrical.Continuous.ImLimited                  imLimited_min(
      Ymax=99999, Ymin=1e-6)
    annotation (Placement(transformation(extent={{82,26},{102,46}})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Output,excitation voltage"
    annotation (Placement(transformation(extent={{160,-6},{170,6}}),
        iconTransformation(extent={{160,-6},{170,6}})));

parameter Real T_R=0 "Voltage input time constant (s)";
parameter Real T_B=0 "AVR lead-lag time constant (s)";
parameter Real T_C=0 "AVR lead-lag time constant (s)";
parameter Real K_A=400 "AVR gain";
parameter Real T_A=0.02 "AVR time constant (s)";
parameter Real V_AMAX=9 "Maximum AVR output (pu)";
parameter Real V_AMIN=-5.43 "Minimum AVR output (pu)";
parameter Real T_E=0.8 "Exciter time constant (s)";
parameter Real K_F=0.03 "Rate feedback gain (pu)";
parameter Real T_F=1 "Rate feedback time const (s)";
parameter Real K_C=0.2 "Rectifier load factor (pu)";
parameter Real K_D=0.48 "Exciter demagnetizing factor (pu)";
parameter Real K_E=1 "Exciter field factor (pu)";
parameter Real E_1=5.25 "Exciter satutartion point 1 (pu)";
parameter Real E_2=7 "Exciter saturation point 2 (pu)";
parameter Real S_EE_1=0.03 "Saturation at E1";
parameter Real S_EE_2=0.1 "Saturation at E2";
parameter Real V_RMAX "Maximum AVR output (pu)";
parameter Real V_RMIN "Minimum AVR output (pu)";

  iPSL.NonElectrical.Continuous.ImDerivativeLag imDerivativeLag(
    pStartValue=0,
    K=K_F,
    T=T_F) annotation (Placement(transformation(extent={{-14,-16},{-58,16}})));
  iPSL.NonElectrical.Math.ImSum2 imSum2_3(
    a0=0,
    a1=1,
    a2=-1) annotation (Placement(transformation(extent={{52,26},{72,46}})));
  Modelica.Blocks.Interfaces.RealInput VUEL "Under Excitation Limiter output"
    annotation (Placement(transformation(extent={{-5,-6},{5,6}},
        rotation=270,
        origin={-9,60}), iconTransformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-120,-54.6})));
  NonElectrical.Logical.HV_GATE
          hV_GATE
    annotation (Placement(transformation(extent={{-6,52},{14,32}})));
  NonElectrical.Logical.LV_GATE
          lV_GATE
    annotation (Placement(transformation(extent={{14,54},{34,34}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=V_RMIN, Ymax=V_RMAX)
    annotation (Placement(transformation(extent={{34,28},{54,48}})));
  NonElectrical.Continuous.ImLeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    nStartValue=VR0/K_A)
    annotation (Placement(transformation(extent={{-74,26},{-40,58}})));
  NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    nStartValue=V0,
    T=T_R)
    annotation (Placement(transformation(extent={{-148,24},{-116,56}})));
  NonElectrical.Functions.ImSE imSE(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2)
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={98,-18})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-24})));
  Modelica.Blocks.Math.Gain gain(k=K_E)
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-54})));
  Modelica.Blocks.Math.Gain gain1(k=K_D)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-88})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={28,-54})));
  Modelica.Blocks.Math.Gain gain2(k=K_C)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={138,-68})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={132,-36})));
  NonElectrical.Nonlinear.ImFEX
      fEX annotation (Placement(transformation(extent={{-22,-22},{22,22}},
        rotation=90,
        origin={132,0})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={152,30})));

public
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-40,-60}), iconTransformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={60,-54})));

protected
  parameter Real VREF(fixed=false) "Reference terminal voltage (pu)";
  parameter Real VR0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);

initial equation
  Efd0 = EFD0;
  Ifd0 = XADIFD;
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  if (Ifd0 <= 0) then
    VE0 = Efd0;
  elseif ((K_C*Ifd0/(Efd0 + 0.577*K_C*Ifd0)) <= 0.433) then
    VE0 = Efd0 + 0.577*K_C*Ifd0;
  elseif ((K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75)) > 0.433) and ((K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) < 0.75)) then
    VE0 =  sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75);
  else
    VE0 = (Efd0+1.732*K_C*Ifd0)/1.732;
  end if;
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(VE0,S_EE_1,S_EE_2,E_1,E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  VREF = VR0/K_A+V0-VOTHSG;

equation
  connect(Vref.n1, imSum2_1.p1) annotation (Line(
      points={{-112.12,60},{-108,60},{-108,44},{-107.1,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSum2_1.n1, imSum3_1.p2) annotation (Line(
      points={{-97.1,42},{-91.1,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator.n1, imLimited_min.p1) annotation (Line(
      points={{82.9,36},{86.9,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imDerivativeLag.n1, imSum3_1.p1) annotation (Line(
      points={{-58.22,0},{-94,0},{-94,45},{-91.1,45}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(imIntegrator.p1, imSum2_3.n1) annotation (Line(
      points={{72.9,36},{66.9,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG, imSum3_1.p3) annotation (Line(
      points={{-155,-20},{-91.1,-20},{-91.1,39}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hV_GATE.p, lV_GATE.n1) annotation (Line(
      points={{9.9,42.5},{9.9,42.2},{17,42.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL, lV_GATE.n2) annotation (Line(
      points={{17,60},{17,46.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedSimpleLag.n0, hV_GATE.n1) annotation (Line(
      points={{-13.22,42},{-13.22,41},{-3,41},{-3,40.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_GATE.p, imLimited.p1) annotation (Line(points={{29.9,44.5},{34.95,44.5},
          {34.95,38},{38.9,38}}, color={0,0,127}));
  connect(imLeadLag.n1, imLimitedSimpleLag.p1)
    annotation (Line(points={{-48.67,42},{-35.22,42}}, color={0,0,127}));
  connect(imLeadLag.p1, imSum3_1.n1)
    annotation (Line(points={{-65.67,42},{-81.1,42}}, color={0,0,127}));
  connect(imSimpleLag.n1, imSum2_1.p2)
    annotation (Line(points={{-120.8,40},{-107.1,40}},  color={0,0,127}));
  connect(ECOMP, imSimpleLag.p1) annotation (Line(points={{-155,40},{-146,40},{-136.96,
          40}}, color={0,0,127}));
  connect(product.u2, imSE.VE_OUT) annotation (Line(points={{82,-18},{87.5,-18},
          {87.5,-17.9}}, color={0,0,127}));
  connect(imLimited.n1, imSum2_3.p1)
    annotation (Line(points={{48.9,38},{56.9,38}}, color={0,0,127}));
  connect(VUEL, hV_GATE.n2)
    annotation (Line(points={{-9,60},{-9,44.6},{-3,44.6}}, color={0,0,127}));
  connect(imDerivativeLag.p1, imSum2_3.p2) annotation (Line(points={{-14.22,0},{
          54,0},{54,34},{56.9,34}}, color={0,0,127}));
  connect(add3_1.u2, gain.y) annotation (Line(points={{40,-54},{44,-54},{50,-54},
          {59,-54}}, color={0,0,127}));
  connect(product.y, add3_1.u3) annotation (Line(points={{59,-24},{46,-24},{46,-46},
          {40,-46}}, color={0,0,127}));
  connect(add3_1.u1, gain1.y) annotation (Line(points={{40,-62},{52,-62},{52,-88},
          {59,-88}}, color={0,0,127}));
  connect(add3_1.y, imSum2_3.p2) annotation (Line(points={{17,-54},{8,-54},{8,0},
          {54,0},{54,34},{56.9,34}}, color={0,0,127}));
  connect(XADIFD, gain1.u)
    annotation (Line(points={{159,-88},{112,-88},{82,-88}}, color={0,0,127}));
  connect(gain2.u, gain1.u)
    annotation (Line(points={{138,-80},{138,-88},{82,-88}}, color={0,0,127}));
  connect(division.y, fEX.IN)
    annotation (Line(points={{132,-25},{132,-13.2}}, color={0,0,127}));
  connect(product1.y, EFD)
    annotation (Line(points={{163,30},{163,0},{165,0}},   color={0,0,127}));
  connect(fEX.FEX, product1.u2) annotation (Line(points={{132,14.96},{132,14.96},
          {132,20},{132,24},{140,24}}, color={0,0,127}));
  connect(imLimited_min.n1, product1.u1)
    annotation (Line(points={{96.9,36},{96.9,36},{140,36}}, color={0,0,127}));
  connect(imSE.VE_IN, product1.u1) annotation (Line(points={{108.5,-17.9},{116,-17.9},
          {116,36},{140,36}}, color={0,0,127}));
  connect(gain.u, product1.u1) annotation (Line(points={{82,-54},{116,-54},{116,
          36},{140,36}}, color={0,0,127}));
  connect(product.u1, product1.u1) annotation (Line(points={{82,-30},{116,-30},{
          116,36},{140,36}}, color={0,0,127}));
  connect(gain2.y, division.u1) annotation (Line(points={{138,-57},{138,-52.5},
          {138,-48}}, color={0,0,127}));
  connect(division.u2, product1.u1) annotation (Line(points={{126,-48},{126,-54},
          {116,-54},{116,36},{140,36}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-160,
            -60},{160,60}},
        grid={2,2}),           graphics={
        Text(
          extent={{-126,56},{-116,48}},
          lineColor={0,0,255},
          textString="Vref"),
        Text(
          extent={{98,34},{104,28}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{102,30},{104,30}},
          lineColor={255,0,0},
          textString="E"),
        Text(
          extent={{-72,10},{-62,4}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{-68,6},{-58,2}},
          lineColor={255,0,0},
          textString="FE"),
        Text(
          extent={{-94,54},{-84,48}},
          lineColor={255,0,0},
          textString="V"),
        Text(
          extent={{-82,50},{-88,48}},
          lineColor={255,0,0},
          textString="F"),
        Text(
          extent={{140,-22},{134,-20}},
          lineColor={255,0,0},
          textString="N"),
        Text(
          extent={{132,-16},{138,-22}},
          lineColor={255,0,0},
          textString="I")}), Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-160,-60},{160,60}},
        grid={2,2}),                       graphics={
        Rectangle(extent={{-160,60},{160,-60}},lineColor={0,0,255}),
        Text(
          extent={{-26,-32},{26,-54}},
          lineColor={0,0,255},
          textString="XADIFD"),
        Text(
          extent={{-144,50},{-104,30}},
          lineColor={0,0,255},
          textString="ECOMP"),
        Text(
          extent={{-150,-14},{-98,-26}},
          lineColor={0,0,255},
          textString="VOTHSG"),
        Text(
          extent={{-76,-36},{-42,-50}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{128,8},{158,-8}},
          lineColor={0,0,255},
          textString="EFD"),
        Text(
          extent={{-54,32},{50,-30}},
          lineColor={0,0,255},
          textString="ESAC1A"),
        Text(
          extent={{-136,-36},{-103,-49}},
          lineColor={0,0,255},
          textString="VUEL"),
        Text(
          extent={{38,-36},{82,-50}},
          lineColor={0,0,255},
          textString="EFD0")}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ESAC1A;
