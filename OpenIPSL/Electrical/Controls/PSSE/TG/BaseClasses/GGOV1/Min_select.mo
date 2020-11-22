within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
block Min_select "Output the minimum element of the input vector"
  parameter Integer nu(min=0) = 0 "Number of input connections"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  Modelica.Blocks.Interfaces.RealVectorInput u[nu]
    annotation (Placement(transformation(extent={{-120,70},{-80,-70}})));
  Modelica.Blocks.Interfaces.RealOutput yMin(start=frs0) annotation (Placement(
        transformation(extent={{100,-94},{120,-74}})));
  parameter Real frs0;
equation
  yMin = min(u);
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-50,46},{76,-46}},
          lineColor={0,0,255},
          textString="Low value
select"),Rectangle(extent={{-100,98},{100,-98}}, lineColor={0,0,255})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>Min Select</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>November 2020</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:vanfrl@rpi.edu\">vanfrl@rpi.edu</a></p></td>
</tr>
<tr>
<td><p>Description</p></td>
<td><p>Determines the minimum element of the input vector and
provide its value as output.</p></td>
</tr>
</table>
</html>"));
end Min_select;
