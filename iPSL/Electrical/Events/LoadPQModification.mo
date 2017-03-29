within iPSL.Electrical.Events;
model LoadPQModification "Variation of load P Q"
parameter Real startTime = Modelica.Constants.inf;
iPSL.Interfaces.AddedConnector P_1;
iPSL.Interfaces.AddedConnector Q_1;
parameter Real P;
parameter Real Q;
equation
    if time < startTime then
      P_1.deltaY = 0;
      Q_1.deltaY = 0;
    else
      P_1.deltaY = (-P + P_1.y);
      Q_1.deltaY = (-Q + Q_1.y);
    end if;
    annotation(Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor= #00FF00><p> 4 </p></td>
</tr> 
</table> 
<p></p>      
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag/User's Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td></td>
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
</HTML>"));

end LoadPQModification;
