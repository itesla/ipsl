within iPSL.Electrical.Sensors;


model PwPowerMeas
  iPSL.Connectors.PwPin p
    annotation (Placement(transformation(extent={{-52,-6},{-40,6}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{40,20},
            {52,32}}), iconTransformation(extent={{40,20},{52,32}})));
  Modelica.Blocks.Interfaces.RealOutput P annotation (Placement(transformation(
          extent={{40,-16},{50,-4}}), iconTransformation(extent={{40,-16},{50,-4}})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation (Placement(transformation(
          extent={{40,-40},{50,-28}}), iconTransformation(extent={{40,-40},{50,
            -28}})));
equation
  n.vr = p.vr;
  n.vi = p.vi;
  n.ir = -p.ir;
  n.ii = -p.ii;
  -Q = (-n.vr*n.ii) + n.vi*n.ir;
  P = n.vr*n.ir + n.vi*n.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={
          0,0,255}),Rectangle(extent={{-30,32},{30,-32}}, lineColor={0,0,255}),
          Rectangle(extent={{-20,20},{20,0}}, lineColor={0,0,255}),Text(
          extent={{-20,-12},{0,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="Q"),Line(
          points={{0,0},{10,10}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-32,-12},{-12,-28}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="P/")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
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
end PwPowerMeas;
