within iPSL.Electrical.Controls.PSAT.FACTS.STATCOM;


model STATCOM "Static Synchronous Compensator model with equation"
  iPSL.Connectors.PwPin p(vr(start=vr0), vi(start=vi0)) annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  constant Real pi=Modelica.Constants.pi;
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
  Real i_SH "STATCOM current (pu)";
  Real v(start=V_0) "Bus voltage magnitude (pu)";
  Real Q "Injected reactive power (pu)";
protected
  parameter Real Iold=Sn/Vn;
  parameter Real Inew=Sb/Vbus;
  parameter Real i_max=i_Max*Iold/Inew;
  parameter Real i_min=i_Min*Iold/Inew;
  parameter Real vr0=V_0*cos(angle_0) "Initialitation";
  parameter Real vi0=V_0*sin(angle_0) "Initialitation";
  //parameter Real io= Kr*(v_ref+v_POD-V_0) "Initialization";
  parameter Real io=Qg/V_0 "Initialization";
  parameter Real v_ref=io/Kr + V_0 - v_POD "Initialization";
initial equation
  i_SH = io;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  0 = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  if i_SH > i_max and der(i_SH) > 0 then
    der(i_SH) = 0;
    Q = i_max*v;
  elseif i_SH < i_min and der(i_SH) < 0 then
    der(i_SH) = 0;
    Q = i_min*v;
  else
    der(i_SH) = (Kr*(v_ref + v_POD - v) - i_SH)/Tr;
    Q = i_SH*v;
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
        Ellipse(
          extent={{-2,22},{48,-22}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{34,24},{84,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Line(
          points={{-38,0},{-2,0},{-2,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{84,2},{100,2},{100,2}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-90,6},{-82,6},{-76,6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-90,-6},{-82,-6},{-76,-6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{-38,0},{-46,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-84,6},{-84,26},{-46,26},{-46,-24},{-82,-24},{-84,-24},{-84,-6},{-84,-6}},
          color={255,0,0},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-34,-38},{24,-68}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="%Name")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
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
end STATCOM;
