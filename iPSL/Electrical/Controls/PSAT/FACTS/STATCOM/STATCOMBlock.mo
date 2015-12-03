within iPSL.Electrical.Controls.PSAT.FACTS.STATCOM;


model STATCOMBlock "Static Synchronous Compensator model with Modelica components"
  parameter Real Sb=100 "System base power (MVA)" annotation (Dialog(group="Power flow data"));
  parameter Real Vbus=400000 "Bus nominal voltage (V)" annotation (Dialog(group="Power flow data"));
  parameter Real Sn=100 "Power rating (MVA)" annotation (Dialog(group="Power flow data"));
  parameter Real Vn=400000 "Voltage rating (V)" annotation (Dialog(group="Power flow data"));
  parameter Real fn=50 "Frequency rating (Hz)" annotation (Dialog(group="Power flow data"));
  parameter Real V_0=1 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real angle_0=-0.000213067852480 "Voltage angle (deg.)" annotation (Dialog(group="Power flow data"));
  parameter Real Qg=0.139557595258338 "Reactive power injection(p.u.)" annotation (Dialog(group="Power flow data"));
  //parameter Real v_ref=1.002791151905167 "Reference voltage of the STATCOM regulator (pu)" annotation(Dialog(group="Power flow data"));
  parameter Real Kr=50 "Regulator gain (p.u./p.u.)";
  parameter Real Tr=0.01 "Regulator time constant (s)";
  parameter Real i_Max=0.7 "Maximum current (pu)";
  parameter Real i_Min=-0.1 "Minimum current (pu)";
  parameter Real v_POD=0 "Power oscillation damper signal";
  Modelica.Blocks.Math.Add3 add3_1(k2=-1) annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Blocks.Math.Gain gain(k=Kr) annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(
    a={Tr,1},
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=io,
    b={1}) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(
    uMax=i_max,
    uMin=i_min,
    limitsAtInit=true) annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  Modelica.Blocks.Interfaces.RealOutput i_SH "STATCOM current (pu)" annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealInput v=volt "Bus voltage magnitude (pu)"
    annotation (Placement(
      visible=false,
      transformation(extent={{-140,-20},{-100,20}}),
      iconTransformation(extent={{-140,-20},{-100,20}})));
  iPSL.Connectors.PwPin p(vr(start=vr0), vi(start=vi0)) annotation (Placement(transformation(extent={{100,-8},{120,12}})));
  Real Q "Injected reactive power";
  Real volt "Bus voltage magnitude (pu)";
  Real angle "Bus voltage angle (deg)";
  Modelica.Blocks.Interfaces.RealInput vs_POD "POD signal (pu)" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-108,-60})));
  Modelica.Blocks.Sources.Constant const(k=v_ref) annotation (Placement(transformation(extent={{-128,24},{-108,44}})));
protected
  parameter Real Iold=Sn/Vn;
  parameter Real Inew=Sb/Vbus;
  parameter Real i_max=i_Max*Iold/Inew;
  parameter Real i_min=i_Min*Iold/Inew;
  parameter Real vr0=V_0*cos(angle_0) "Initialitation";
  parameter Real vi0=V_0*sin(angle_0) "Initialitation";
  //parameter Real io= Kr*(v_ref+v_POD-V_0) "Initialitation";
  parameter Real io=Qg/V_0 "Initialization";
  parameter Real v_ref=io/Kr + V_0 - v_POD "Initialization";
equation
  0 = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  Q = i_SH*v;
  volt = sqrt(p.vr^2 + p.vi^2);
  angle = atan2(p.vi, p.vr);
  connect(add3_1.y, gain.u) annotation (Line(
      points={{-69,0},{-54,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, transferFunction.u) annotation (Line(
      points={{-31,0},{-10,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction.y, limiter.u) annotation (Line(
      points={{13,0},{34,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, i_SH) annotation (Line(
      points={{57,0},{80,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(i_SH, i_SH) annotation (Line(
      points={{80,0},{80,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.u2, v) annotation (Line(
      points={{-92,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(vs_POD, add3_1.u3) annotation (Line(
      points={{-108,-60},{-106,-60},{-106,-8},{-92,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add3_1.u1) annotation (Line(points={{-107,34},{-100,34},{-100,8},{-92,8}}, color={0,0,127}));
  annotation (
    Placement(transformation(extent={{-82,34},{-62,54}})),
    Placement(transformation(extent={{-136,-22},{-96,18}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-26,-36},{38,-66}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="%StatcomBlock"),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),Ellipse(
          extent={{-16,20},{34,-24}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),Ellipse(
          extent={{20,22},{70,-22}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),Line(
          points={{-52,-2},{-16,-2},{-16,-2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{70,0},{86,0},{96,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-104,4},{-96,4},{-90,4}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-104,-8},{-96,-8},{-90,-8}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-52,-2},{-60,-2},{-60,-2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-98,4},{-98,24},{-60,24},{-60,-26},{-96,-26},{-98,-26},{-98,-8},{-98,-8}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.None)}),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end STATCOMBlock;
