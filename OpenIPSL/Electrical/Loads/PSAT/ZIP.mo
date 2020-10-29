within OpenIPSL.Electrical.Loads.PSAT;
model ZIP "ZIP Load"
  extends BaseClasses.baseLoad;
  parameter SI.PerUnit Pz=0.33 "Conductance";
  parameter SI.PerUnit Pi=0.33 "Active current";
  parameter SI.PerUnit Pp=1 - Pz - Pi "Active power";
  parameter SI.PerUnit Qz=0.33 "Susceptance";
  parameter SI.PerUnit Qi=0.33 "Reactive current";
  parameter SI.PerUnit Qp=1 - Qz - Qi "Reactive power";
protected
  Real a "Auxiliary variable, voltage division";
equation
  a = v/v_0;
  P = P_0/S_b*(Pz*a^2 + Pi*a + Pp);
  Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp);
  annotation (
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>ZIP Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end ZIP;
