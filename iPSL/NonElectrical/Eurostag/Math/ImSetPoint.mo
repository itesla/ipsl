within iPSL.NonElectrical.Eurostag.Math;
model ImSetPoint "Set Point. 2014/03/10"
  parameter Real V "Voltage Set Point";
  iPSL.Interfaces.AddedConnector setPointModification;
  Modelica.Blocks.Interfaces.RealOutput y "Output signal connector"
    annotation (Placement(transformation(extent={{100,-10},{120,10}},
      rotation=0)));
equation
    y = V + setPointModification.deltaV;
    setPointModification.V1 = V;
  annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          initialScale=0.1),
          graphics={
          Text(
          extent={{-60,42},{52,-70}},
          lineColor={0,0,255},
          textString="Set
          "),
         Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
         Diagram(coordinateSystem(
           preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Line(points={{60,0},{100,0}}, color={0,0,255}),
          Text(
          extent={{-62,42},{54,-72}},
          lineColor={0,0,255},
          textString="Set
          ")}),Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag/Model Editor User's Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016/04/26 by AIA </td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>RTE-AIA</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
</tr>
</table>
<p>
This block plays the same part as the Modelica.Blocks.Sources.Constant block, but the output (y) may be modified during the Dynamic Simulation.
</p>
<p>
This Block is equivalent to spesific SET POINT Block from Eurostag. 
</p>
</html>"));
end ImSetPoint;
