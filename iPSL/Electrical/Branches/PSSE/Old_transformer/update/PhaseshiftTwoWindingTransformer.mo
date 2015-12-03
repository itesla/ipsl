within iPSL.Electrical.Branches.PSSE.Old_transformer.update;
model PhaseshiftTwoWindingTransformer
  "Basic Two Winding Transformer with Phaseshift"
  extends TransformerParameter;
  parameter Real phase " From side and To side phase shift in degree";
  iPSL.Connectors.PwPin F
    annotation (Placement(transformation(extent={{-114,-4},{-94,16}})));
  iPSL.Connectors.PwPin T
    annotation (Placement(transformation(extent={{94,-6},{114,14}})));
  phaseshift phaseship1(phase=phase)
    annotation (Placement(transformation(extent={{-76,-24},{-18,30}})));
  TransformerBasicEquation zeq(
    R=R,
    X=X,
    G=G,
    B=B,
    ti=ti,
    tj=tj) annotation (Placement(transformation(extent={{4,-20},{70,24}})));
equation
  connect(phaseship1.F, F) annotation (Line(
      points={{-73.68,5.16},{-86.6934,5.16},{-86.6934,6},{-104,6}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(zeq.T, T) annotation (Line(
      points={{68.68,3.76},{85.34,3.76},{85.34,4},{104,4}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  connect(phaseship1.T, zeq.F) annotation (Line(
      points={{-22.06,5.16},{-7.03,5.16},{-7.03,4.2},{9.94,4.2}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics),
    Icon(graphics={Text(
          extent={{26,52},{114,0}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="*",
          textStyle={TextStyle.Bold}),Ellipse(
          extent={{-74,42},{6,-42}},
          lineColor={0,0,255},
          lineThickness=0.5),Ellipse(
          extent={{-10,42},{70,-42}},
          lineColor={0,0,255},
          lineThickness=0.5)}),
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
end PhaseshiftTwoWindingTransformer;

