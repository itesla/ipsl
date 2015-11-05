within iPSL.Electrical.Wind.PSSE.WT3G;
model WT3G1
    constant Real pi = Modelica.Constants.pi;
  parameter Real eterm "Terminal voltage";
  parameter Real anglev0 "Power flow, node angle in degree";
  parameter Real pelec "Active power MW";
  parameter Real qelec "Reactive power MVar";
  parameter Real wbase = 2 * pi * 50 "System base speed";
parameter Real Sbase;
parameter Real Xeq "Equivalent reactance for current injection (pu)";
parameter Real Kpll "PLL first integrator gain";
parameter Real Kipll "PLL second integrator gain";
parameter Real Pllmax "PLL maximum limit";
parameter Real Prated "Turbine MW rating, not used in the equation";
parameter Complex Zs(re = 0, im = Xeq) "Equivalent impedance";

  parameter Real Mbase=100 "machine base specified by power flow";

 parameter Real p0 = pelec / Mbase
    "initial value of bus active power in p.u. machinebase";
parameter Real q0 = qelec / Mbase
    "initial value of bus reactive power in p.u. machinebase";
parameter Real v0 = eterm;
parameter Real vr0 = v0 * cos(anglev_rad)
    "Real component of initial terminal voltage";
parameter Real vi0 = v0 * sin(anglev_rad)
    "Imaginary component of intitial terminal voltage";
 parameter Real ir0 = (p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2)
    "Real component of initial armature current, mbase";
  parameter Real ii0 = (p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2)
    "Imaginary component of initial armature current, mbase";
 parameter Real Isr0 = ir0+vi0/Xeq "Sorce current re mbase";
  parameter Real Isi0 = ii0-vr0/Xeq "Sorce current im mbase";
  parameter Real CoB = Mbase/Sbase;
parameter Real ir1= -CoB*(p0 * vr0 + q0 * vi0) / (vr0 ^ 2 + vi0 ^ 2)
    "Real component of initial armature current, sbase";
  parameter Real ii1 = -CoB*(p0 * vi0 - q0 * vr0) / (vr0 ^ 2 + vi0 ^ 2)
    "Imaginary component of initial armature current, sbase";
public
parameter Real Ix0=Isr0*cos(-anglev_rad)-Isi0*sin(-anglev_rad);
parameter Real Iy0=Isr0*sin(-anglev_rad)+cos(-anglev_rad)*Isi0;
parameter Real Eqcmd0=-Iy0*Xeq;
parameter Real Ipcmd0=Ix0;
parameter Real anglev_rad = anglev0 * pi / 180
    "initial value of bus anglev in rad";
 parameter Real VX0=cos(anglev_rad)*vr0+sin(anglev_rad)*vi0;
parameter Real VY0=-sin(anglev_rad)*vr0+cos(anglev_rad)*vi0;

 Real VT(start=eterm) "Bus voltage magnitude";
  Real anglev(start=anglev_rad) "Bus voltage angle";
  Real VY(start=0) "y-axis terminal voltage";
  Real VX(start=eterm) "x-axis terminal voltage";
 Complex Is "Equivalent internal current source";

  iPSL.Connectors.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir1),
    ii(start=ii1)) annotation (Placement(transformation(extent={{-100,34},{-80,
            54}}), iconTransformation(extent={{-100,34},{-80,54}})));
  iPSL.NonElectrical.Continuous.ImIntegrator imIntegrator(K=wbase, nStartValue=
        anglev_rad)
    annotation (Placement(transformation(extent={{26,-26},{44,-4}})));
  iPSL.NonElectrical.Continuous.ImIntegratornonwindup imIntegrator1(
    Ymin=-Pllmax,
    Ymax=Pllmax,
    K=0,
    nStartValue=0)
    annotation (Placement(transformation(extent={{-34,-14},{-14,6}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag(
    K=1,
    T=0.02,
    nStartValue=Eqcmd0)
    annotation (Placement(transformation(extent={{-54,56},{-2,90}})));
  iPSL.NonElectrical.Continuous.ImSimpleLag imSimpleLag1(
    K=1,
    T=0.02,
    nStartValue=Ix0)
    annotation (Placement(transformation(extent={{-54,22},{-2,56}})));
  iPSL.NonElectrical.Math.ImGain imGain(K=-1/Xeq)
    annotation (Placement(transformation(extent={{2,62},{24,84}})));

  Modelica.Blocks.Interfaces.RealOutput Iy(start=Iy0)
    annotation (Placement(transformation(extent={{50,26},{68,44}}),
        iconTransformation(extent={{50,26},{68,44}})));
  Modelica.Blocks.Interfaces.RealOutput Ix(start=Ix0)
    annotation (Placement(transformation(extent={{50,2},{68,20}}),
        iconTransformation(extent={{50,2},{68,20}})));

   Modelica.Blocks.Interfaces.RealOutput Iterm(start=Iy0)
    annotation (Placement(transformation(extent={{108,24},{126,42}}),
        iconTransformation(extent={{108,24},{126,42}})));
  Modelica.Blocks.Interfaces.RealInput Eqcmd(start=Eqcmd0)
   annotation (Placement(transformation(extent={{-120,54},{-82,92}}),
      iconTransformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={98,84})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd(start=Ipcmd0)
    annotation (Placement(transformation(extent={{-120,20},{-82,58}}),
       iconTransformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={98,56})));

  iPSL.NonElectrical.Math.ImGain imGain1(K=Kpll/wbase)
    annotation (Placement(transformation(extent={{-56,-32},{-34,-10}})));

  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-8,-24},{10,-6}})));
  iPSL.NonElectrical.Continuous.ImLimited imLimited(Ymin=-Pllmax, Ymax=Pllmax)
    annotation (Placement(transformation(extent={{10,-28},{32,-2}})));
  Modelica.Blocks.Interfaces.RealOutput delta(start=anglev_rad)
    annotation (Placement(transformation(extent={{50,-24},{68,-6}}),
        iconTransformation(extent={{50,-24},{68,-6}})));

  Modelica.Blocks.Interfaces.RealOutput V=VT
    annotation (Placement(transformation(extent={{108,2},{126,20}}),
        iconTransformation(extent={{108,2},{126,20}})));

  Modelica.Blocks.Interfaces.RealOutput P "On machine base"
    annotation (Placement(transformation(extent={{100,-64},{118,-46}}),
        iconTransformation(extent={{108,-42},{126,-24}})));

  Modelica.Blocks.Interfaces.RealOutput Q
    annotation (Placement(transformation(extent={{100,-88},{118,-70}}),
        iconTransformation(extent={{108,-20},{126,-2}})));
protected
        Modelica.Blocks.Interfaces.RealInput Vy
    annotation (Placement(transformation(extent={{-118,-40},{-80,-2}}),
        iconTransformation(extent={{-118,-40},{-96,-18}})));
public
  Modelica.Blocks.Interfaces.RealOutput ipcmd0=Ipcmd0 annotation (Placement(
        transformation(extent={{30,-86},{48,-68}}), iconTransformation(extent={{-9,-9},
            {9,9}},
        rotation=90,
        origin={13,105})));
  Modelica.Blocks.Interfaces.RealOutput eqcmd0=Eqcmd0 annotation (Placement(
        transformation(extent={{30,-62},{48,-44}}), iconTransformation(extent={{-9,-9},
            {9,9}},
        rotation=90,
        origin={-27,105})));
initial equation
  delta=anglev_rad;
equation
anglev = atan2(p.vi, p.vr);
  VT = sqrt(p.vr *p.vr + p.vi*p.vi);
Iterm=sqrt(p.ir *p.ir + p.ii*p.ii);
Is.re = p.ir/CoB-p.vi/Xeq;//Note that, the positive direction for p.ir is the antidirection of ir0
Is.im =p.ii/CoB+p.vr/Xeq;

  Vy=VY;

 [Ix; Iy] = -[cos(delta), sin(delta); -sin(delta), cos(delta)] * [Is.re; Is.im];

 [VX; VY]= [cos(delta), sin(delta);-sin(delta), cos(delta)] *[p.vr; p.vi];
 -P = p.vr * p.ir/CoB + p.vi * p.ii/CoB;
  -Q = p.vi * p.ir/CoB - p.vr * p.ii/CoB;
  connect(Ipcmd, imSimpleLag1.p1) annotation (Line(
      points={{-101,39},{-36.06,39}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag.n1, imGain.p1) annotation (Line(
      points={{-9.8,73},{7.39,73}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain1.n1, imIntegrator1.p1) annotation (Line(
      points={{-39.61,-21},{-32,-21},{-32,-4},{-29.1,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain1.n1, add.u2) annotation (Line(
      points={{-39.61,-21},{-11.805,-21},{-11.805,-20.4},{-9.8,-20.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator1.n0, add.u1) annotation (Line(
      points={{-19.1,-4},{-12,-4},{-12,-9.6},{-9.8,-9.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, imLimited.p1) annotation (Line(
      points={{10.9,-15},{15.39,-15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimited.n1, imIntegrator.p1) annotation (Line(
      points={{26.39,-15},{30.41,-15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Eqcmd, imSimpleLag.p1) annotation (Line(
      points={{-101,73},{-36.06,73}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imGain.n1, Iy) annotation (Line(
      points={{18.39,73},{30.195,73},{30.195,35},{59,35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imSimpleLag1.n1, Ix) annotation (Line(
      points={{-9.8,39},{15.97,39},{15.97,11},{59,11}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imIntegrator.n1, delta) annotation (Line(
      points={{39.41,-15},{59,-15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vy, imGain1.p1) annotation (Line(
      points={{-99,-21},{-70,-22},{-70,-21},{-50.61,-21}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(extent={{-102,96},{108,-48}}, lineColor={0,0,255}), Text(
          extent={{-40,76},{44,38}},
          lineColor={0,0,255},
          textString="WT3G1")}),
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
end WT3G1;
