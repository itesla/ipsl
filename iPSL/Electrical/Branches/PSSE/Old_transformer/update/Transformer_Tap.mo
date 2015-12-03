within iPSL.Electrical.Branches.PSSE.Old_transformer.update;


model Transformer_Tap "Basic Two Winding Transformer equation with tap changer"
  iPSL.Connectors.PwPin T "To side" annotation (Placement(transformation(extent={{86,-2},{106,18}}), iconTransformation(extent={{86,-2},{106,18}})));
  iPSL.Connectors.PwPin F "From side" annotation (Placement(transformation(extent={{-92,0},{-72,20}}), iconTransformation(extent={{-92,0},{-72,20}})));
  extends TransformerParameter;
  Modelica.Blocks.Interfaces.RealInput t1 annotation (Placement(transformation(extent={{-110,22},{-70,62}})));
protected
  Real t;
equation
  t = t1;
  Req*(F.ir - G*F.vr + B*F.vi) - Xeq*(F.ii - B*F.vr - G*F.vi) = F.vr - T.vr*t;
  Req*(F.ii - B*F.vr - G*F.vi) + Xeq*(F.ir - G*F.vr + B*F.vi) = F.vi - T.vi*t;
  -t*(Req*T.ir - Xeq*T.ii) = F.vr - T.vr*t;
  -t*(Req*T.ii + Xeq*T.ir) = F.vi - T.vi*t;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-82,66},{92,-44}}, lineColor={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Line(
          points={{-68,16},{78,16},{78,16}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Rectangle(
          extent={{-54,0},{-46,-42}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Rectangle(
          extent={{-38,0},{-30,-42}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Rectangle(
          extent={{16,20},{-18,12}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Rectangle(
          extent={{60,20},{26,12}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),Line(
          points={{-42,16},{-42,4},{-34,4},{-34,-2},{-34,-48},{-50,-48},{-50,4},{-42,4},{-42,4}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Line(
          points={{-42,-48},{-42,-58},{-54,-58},{-30,-58},{-30,-58}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),Text(
          extent={{-76,-10},{-58,-26}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="G"),Text(
          extent={{-26,-12},{-8,-28}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="B"),Text(
          extent={{-12,38},{6,22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="R"),Text(
          extent={{34,38},{52,22}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="X")}),
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
end Transformer_Tap;
