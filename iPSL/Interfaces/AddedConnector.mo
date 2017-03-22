within iPSL.Interfaces;
connector AddedConnector
  flow Real deltaY;
  Real y;
  annotation (
    Icon(graphics={Rectangle(extent={{-20,20},{40,-20}}, lineColor={0,0,255}),Text(
          extent={{-8,10},{26,-8}},
          lineColor={0,0,255},
          textString="AddedConnector")}),
    Diagram(graphics={Rectangle(extent={{-30,20},{30,-20}}, lineColor={0,0,255}),Text(
          extent={{-18,10},{16,-8}},
          lineColor={0,0,255},
          textString="AddedConnector")}),
    Documentation(info="<HTML>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor=#00F00><p> 4 </p></td>
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
</html>"));
end AddedConnector;
