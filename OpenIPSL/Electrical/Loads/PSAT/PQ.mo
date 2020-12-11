within OpenIPSL.Electrical.Loads.PSAT;
model PQ "Pl - Constant PQ Load"
  extends BaseClasses.baseLoad;
  parameter Types.PerUnit Vmax=1.2 "maximum voltage"
    annotation (Evaluate=true, Dialog(tab="To Be Implemented"));
  parameter Types.PerUnit Vmin=0.8 "minimum voltage"
    annotation (Evaluate=true, Dialog(tab="To Be Implemented"));
  parameter Boolean forcePQ=true
    "force constant PQ-load, false may cause simulation problems" annotation (
    Evaluate=true,
    choices(checkBox=true),
    Dialog(tab="To Be Implemented"));
equation
  if forcePQ or initial() then
    P = P_0/S_b;
    Q = Q_0/S_b;
  elseif (v > Vmax) then
    // needs a better implementation
    P = P_0*v^2/(Vmax^2)/S_b;
    Q = Q_0*v^2/(Vmax^2)/S_b;
  elseif (v < Vmin) then
    P = P_0*v^2/Vmin^2/S_b;
    Q = Q_0*v^2/(Vmin^2)/S_b;
  else
    P = P_0/S_b;
    Q = Q_0/S_b;
  end if;

  annotation (
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td>2015-09</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table></html>"));
end PQ;
