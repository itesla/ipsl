within iPSL.Electrical.Branches.PSSE.Old_transformer;
model TwoWindingTapRatio
  constant Real pi = Modelica.Constants.pi;
  parameter Complex Zeq "equivalent impedance";
  parameter Real COD;
  inner parameter Real initialtapratio "initial tap ration";
  parameter Real angle_d "angel shift in degree";

  parameter Real Vmax = 1.1;
  parameter Real Vmin = 0.9;
  parameter Real rmax = 1.1;
  parameter Real rmin = 0.9;
  parameter Real Ntap = 33;
  //total tap position
  parameter Real dV = 0.001;
  //dead band
  parameter Real tau = 17.0;
  //regulator delay
  parameter Real TC = 5;
  //motor delay
protected
  parameter Real angle = angle_d / 180 * pi "angel shift in rad";
public
  Connectors.PwPin P1              annotation(Placement(transformation(extent={{-104,2},
            {-84,22}}),                                                                                    iconTransformation(extent={{-104,2},
            {-84,22}})));
  Connectors.PwPin P2              annotation(Placement(transformation(extent={{78,6},{
            100,26}}),                                                                                  iconTransformation(extent={{80,6},{
            100,26}})));
  iPSL.Electrical.Branches.PSSE.Old_transformer.Zeq pwLine1(R=Zeq.re, X=Zeq.im)
    annotation (Placement(transformation(
        extent={{-29,-22},{29,22}},
        rotation=0,
        origin={-39,0})));
  update.OLTC                                                tap_ratio(
    Vmax=Vmax,
    Vmin=Vmin,
    rmax=rmax,
    rmin=rmin,
    Ntap=Ntap,
    TC=TC,
    TSD=dV) "base on controlled bus voltage base"
                                                 annotation (Placement(
        transformation(
        extent={{-14,-9},{14,9}},
        rotation=180,
        origin={56,67})));
  Modelica.Blocks.Interfaces.RealInput sensored_voltage(start = (tap_ratio.Vmax + tap_ratio.Vmin) / 2) annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {100, 66}), iconTransformation(extent = {{-12, -12}, {12, 12}}, rotation = 180, origin={88,-18})));
protected
  Modelica.Blocks.Interfaces.RealOutput ti annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-106, 66}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {14, -6})));
public
  Real v;
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(
        transformation(
        extent={{-13,-13},{13,13}},
        rotation=180,
        origin={75,35})));
  update.ImRelay                                                imRelay(COD=COD)
    annotation (Placement(transformation(
        extent={{-22,-21},{22,21}},
        rotation=180,
        origin={-2,41})));
  iPSL.Electrical.Branches.PSSE.Old_transformer.phaseShift phaseship(phase=0)
    annotation (Placement(transformation(extent={{4,-16},{58,14}})));
equation
   v = sqrt(P2.vr ^ 2 + P2.vi ^ 2);
  connect(ti, tap_ratio.y) annotation(Line(points={{-106,66},{45,66},{45,65.74},
          {42.84,65.74}},                                                                                   color = {0, 0, 127}, smooth = Smooth.None));
  connect(tap_ratio.u, sensored_voltage) annotation(Line(points={{70.56,65.74},{
          77.28,65.74},{77.28,66},{100,66}},                                                                               color = {0, 0, 127}, smooth = Smooth.None));
  connect(pwLine1.p, P1) annotation (Line(
      points={{-59.3,0},{-76,0},{-76,12},{-94,12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(imRelay.p2, const.y) annotation (Line(
      points={{8.45,35.75},{8.45,34.625},{60.7,34.625},{60.7,35}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay.p1, tap_ratio.y) annotation (Line(
      points={{8.45,44.99},{8.45,45.685},{42.84,45.685},{42.84,65.74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imRelay.n1, pwLine1.t) annotation (Line(
      points={{-12.78,41},{-13.135,41},{-13.135,8.8},{-21.6,8.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(phaseship.n, P2) annotation (Line(
      points={{54.76,0.5},{74.16,0.5},{74.16,16},{89,16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(phaseship.p, pwLine1.n) annotation (Line(
      points={{6.7,0.5},{6.7,0},{-18.7,0}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{100,100}}),                                                                           graphics), Icon(coordinateSystem(preserveAspectRatio=true,   extent={{-100,
            -100},{100,100}}),                                                                                                    graphics={  Text(extent=  {{26, 54}, {114, 2}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "*", textStyle=  {TextStyle.Bold}), Ellipse(extent={{
              -74,44},{6,-40}},                                                                                                    lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5), Ellipse(extent={{
              -10,44},{70,-40}},                                                                                                    lineColor=  {0, 0, 255},
            lineThickness=                                                                                                    0.5)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end TwoWindingTapRatio;
