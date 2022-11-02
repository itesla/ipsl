within OpenIPSL.Tests.Sources;
model VoltageSourceReImInputConstant
  "Test model for the VoltageSourceReImInput model with constant input"
  extends BaseClasses.SMIB;
  Modelica.Blocks.Sources.Constant vRe(k=1)
    annotation (Placement(transformation(extent={{-100,4},{-88,16}})));
  Modelica.Blocks.Sources.Constant vIm(k=0)
    annotation (Placement(transformation(extent={{-100,-20},{-88,-8}})));
  Electrical.Sources.VoltageSourceReImInput vSource
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
equation
  connect(vSource.p, GEN1.p)
    annotation (Line(points={{-41,0},{-30,0}}, color={0,0,255}));
  connect(vRe.y, vSource.vRe) annotation (Line(points={{-87.4,10},{-72,10},{-72,
          4},{-64,4}}, color={0,0,127}));
  connect(vIm.y, vSource.vIm) annotation (Line(points={{-87.4,-14},{-72,-14},{-72,
          -4},{-64,-4}}, color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>This model shows how to use the component in <code>Electrical.Sources.VoltageSourceReImInput</code> with user specified <strong>constant real and imaginary parts</strong> of the voltage phasor of the source.</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None.</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-11-01 (First commit)</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Luigi Vanfretti, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end VoltageSourceReImInputConstant;
