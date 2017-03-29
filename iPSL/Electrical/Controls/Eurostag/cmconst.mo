within iPSL.Electrical.Controls.Eurostag;
model cmconst "CM constant model"
	parameter Real init_CM = -0.01818525272777948;
	parameter Real  SN;
	parameter Real  PN;
	parameter Real PNALT;  
	Modelica.Blocks.Sources.Constant CM_Cosntant(k = init_CM);
	Modelica.Blocks.Interfaces.RealOutput pin_CM;
	
equation
	connect(CM_Cosntant.y, pin_CM);
	annotation(Documentation(info="<HTML>
   <table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
   <td align=center  width=50%><p>Development level</p></td>
   <td align=center width=25% bgcolor= #00FF00><p> 4 </p></td>
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
	</p>
	</HTML>")); 
end cmconst;
