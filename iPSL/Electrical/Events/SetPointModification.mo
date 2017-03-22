within iPSL.Electrical.Events;
model SetPointModification
 iPSL.Interfaces.AddedConnector setPointModification;
 parameter Real startTime = Modelica.Constants.inf;
 parameter Real v2 = 0;
equation
    if time < startTime then
      setPointModification.deltaY = 0;
    else
      setPointModification.deltaY = (-v2 + setPointModification.y);
    end if;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},{40,40}}), graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),Ellipse(
          extent={{-40,40},{40,-42}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
    Documentation(Documentation(info="<HTML>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=#00FF00><p> 4 </p></td>
</tr> 
</table> 
<p></p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>AIA</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
</tr>
</table>
<p>
This model allow change the voltage set point in a iPSL.NonElectrical.Eurostag.Math.ImSetPoint block Within a regulator; 
</p>

</HTML>")));
end SetPointModification;
