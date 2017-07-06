within OpenIPSL.Electrical.Buses;
model BusExt
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter Integer nu(min=1) = 1 "Number of left connection"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  parameter Integer no(min=1) = 1 "Number of right connections"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  OpenIPSL.Interfaces.PwPin u[nu] annotation (Placement(
      visible=true,
      transformation(
        origin={-20.0001,1},
        extent={{-9.99994,-99},{10.0001,99}},
        rotation=0),
      iconTransformation(
        origin={20,0},
        extent={{-4,-60},{4,60}},
        rotation=0)));
  OpenIPSL.Interfaces.PwPin o[no] annotation (Placement(
      visible=true,
      transformation(
        origin={20,0},
        extent={{-12,-100},{12,100}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-4,-60},{4,60}},
        rotation=0)));
  Real V(start=V_0) "Bus voltage magnitude (pu)";
  Real angle(start=angle_0) "Bus voltage angle (deg)";
  parameter Real V_0 "Voltage magnitude (pu)"
    annotation (Dialog(group="Power flow data"));
  parameter Real angle_0 "Voltage angle (deg)"
    annotation (Dialog(group="Power flow data"));
  parameter Real V_b=130 "Base voltage (kV)"
    annotation (Dialog(group="Power flow data"));
  parameter Real S_b=SysData.S_b "System base power (MVA)"
    annotation (Dialog(group="Power flow data"));
protected
  parameter Real vr0=V_0*cos(angle_0*Modelica.Constants.pi/180);
  parameter Real vi0=V_0*sin(angle_0*Modelica.Constants.pi/180);
equation
  if nu > 1 then
    for i in 2:nu loop
      connect(u[1], u[i]);
    end for;
  end if;
  if no > 1 then
    for i in 2:no loop
      connect(o[1], o[i]);
    end for;
  end if;
  connect(o[no], u[nu]);
  V = sqrt(o[1].vr^2 + o[1].vi^2);
  angle = atan2(o[1].vi, o[1].vr)*180/Modelica.Constants.pi;
  annotation (
    Diagram(coordinateSystem(extent={{0,-100},{20,100}})),
    Icon(coordinateSystem(extent={{0,-100},{20,100}}, preserveAspectRatio=false),
        graphics={Rectangle(
          extent={{0,100},{20,-100}},
          lineColor={0,0,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Jan Lavenius, Giuseppe Laera, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end BusExt;
