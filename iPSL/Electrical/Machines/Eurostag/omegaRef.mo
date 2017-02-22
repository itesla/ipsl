within iPSL.Electrical.Machines.Eurostag;
block omegaRef
    parameter Integer nGenerators = 1;
    Modelica.Blocks.Interfaces.RealInput pin_HIn[nGenerators];
    Modelica.Blocks.Interfaces.RealInput pin_SN[nGenerators];
    Modelica.Blocks.Interfaces.RealInput pin_omega[nGenerators];
    Modelica.Blocks.Interfaces.RealOutput omegaRef;
    Modelica.Blocks.Math.Sum omegaRefDen(nin = nGenerators);
    Modelica.Blocks.Math.Sum omegaRefNum(nin = nGenerators);
    Real denom[nGenerators];
    Real num[nGenerators];
equation 
  denom = pin_HIn .* pin_SN;
  num  = denom .* pin_omega;
  omegaRefNum.u = num;
  omegaRefDen.u = denom;
  omegaRef = omegaRefNum.y / omegaRefDen.y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td align=center  width=50%><p>Development level</p></td>
<td align=center width=25% bgcolor= #00FF00><p> 4 </p></td>
</tr> 
</table> 
<p></p>      
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Eurostag/Model Editor User's Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016/12/20 by AIA </td>
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
</html>"));
end omegaRef;
