within iPSL.Electrical.Controls.PSAT.AVR;


model AVRtypeIII
  parameter Real vref=1;
  parameter Real v0=1 "initial voltage after power flow";
  parameter Real vfmax=5;
  parameter Real vfmin=-5;
  parameter Real K0=20 "regulator gain";
  parameter Real T2=0.1 "regulator pole";
  parameter Real T1=0.45 "Regulator zero";
  parameter Real Te=0.1 "Field circuit time constant";
  parameter Real vf0 "Initial field voltage";
  parameter Real Tr=0.0015 "Measurement time constant";
  parameter Real s0;
  Real vm;
  Real vr;
  Real vf1;
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=vfmax, uMin=vfmin)
    annotation (Placement(visible=true, transformation(
        origin={5,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput v(start=1) annotation (Placement(
      visible=true,
      transformation(
        origin={-157.972,50},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0),
      iconTransformation(
        origin={-120.0,50.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput vf annotation (Placement(
      visible=true,
      transformation(
        origin={160,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vs annotation (Placement(transformation(extent={{-140,-60},{-100,-20}}), iconTransformation(extent={{-140,-60},{-100,-20}})));
initial equation
  vf1 = vf0;
  vm = v0;
  vr = K0*(1 - T1/T2)*(vref + vs - vm);
equation
  der(vm) = (v - vm)/Tr;
  der(vr) = (K0*(1 - T1/T2)*(vref + vs - vm) - vr)/T2;
  der(vf1) = ((vr + K0*(T1/T2)*(vref + vs - vm) + vf0)*(1 + s0*(v/v0 - 1)) - vf1)/Te;
  limiter1.u = vf1;
  limiter1.y = vf;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={
        Rectangle(
          visible=true,
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),
        Text(
          visible=true,
          origin={1.5941,2.9728},
          fillPattern=FillPattern.Solid,
          extent={{-31.5941,-24.9719},{31.5941,24.9719}},
          textString="AVRtypeIII",
          fontName="Arial"),
        Text(
          visible=true,
          origin={-77.3525,52.4473},
          fillPattern=FillPattern.Solid,
          extent={{-17.3525,-17.5527},{17.3525,17.5527}},
          textString="v",
          fontName="Arial"),
        Text(
          origin={-74.7671,-32.7013},
          fillPattern=FillPattern.Solid,
          extent={{-11.7427,-9.8104},{11.7427,9.8104}},
          fontName="Arial",
          textString="vs",
          lineColor={0,0,0}),
        Text(
          visible=true,
          origin={84.2416,-0.0},
          fillPattern=FillPattern.Solid,
          extent={{-8.7313,-11.5403},{8.7313,11.5403}},
          textString="vf",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>AVR Type III, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end AVRtypeIII;
