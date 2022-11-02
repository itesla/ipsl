within OpenIPSL.Tests.Sources;
model VoltageSourceReImInputVaryRealAndImag
  "Test model for the VoltageSourceReImInput model with varying real and imaginary parts"
  extends BaseClasses.SMIB;
  Modelica.Blocks.Sources.Ramp vRe(
    height=0.1,
    duration=2.5,
    offset=1.0,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,4},{-88,16}})));
  Electrical.Sources.VoltageSourceReImInput vSource
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
  Modelica.Blocks.Sources.Ramp vIm(
    height=3.14/8,
    duration=2.5,
    offset=0,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-20},{-88,-8}})));
equation
  connect(vSource.p, GEN1.p)
    annotation (Line(points={{-41,0},{-30,0}}, color={0,0,255}));
  connect(vRe.y, vSource.vRe) annotation (Line(points={{-87.4,10},{-72,10},{-72,
          4},{-64,4}}, color={0,0,127}));
  connect(vIm.y, vSource.vIm) annotation (Line(points={{-87.4,-14},{-72,-14},{
          -72,-4},{-64,-4}}, color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
      Documentation(revisions="<html>
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
</html>", info="<html>
<p><span style=\"font-family: Arial;\">This model shows how to use the component in Electrical.Sources.VoltageSourceReImInput with user specified <b>varying real and imaginary parts</b> of the voltage phasor of the source.</span></p>
</html>"));
end VoltageSourceReImInputVaryRealAndImag;
