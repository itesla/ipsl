within iPSL.Electrical.Buses;
model BusExt
  iPSL.Connectors.PwPinExt Ext(p(vr(start=vr0), vi(start=vi0)));
  outer iPSL.Electrical.SystemBase SysData "Must add this line in all models";
  parameter Integer nu(min=0) = 0 "Number of left connection" annotation (Dialog(connectorSizing=true), HideResult=true);
  parameter Integer no(min=0) = 0 "Number of right connections" annotation (Dialog(connectorSizing=true), HideResult=true);
  iPSL.Connectors.PwPin u[nu] annotation (Placement(
      visible=true,
      transformation(
        origin={-20.0001,1},
        extent={{-9.99994,-99},{10.0001,99}},
        rotation=0),
      iconTransformation(
        origin={20,0},
        extent={{-4,-60},{4,60}},
        rotation=0)));
  iPSL.Connectors.PwPin o[no] annotation (Placement(
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
  parameter Real V_0 "Voltage magnitude (pu)" annotation (Dialog(group="Power flow data"));
  parameter Real angle_0 "Voltage angle (deg)" annotation (Dialog(group="Power flow data"));
  parameter Real V_b=130 "Base voltage (kV)" annotation (Dialog(group="Power flow data"));
  parameter Real S_b=SysData.S_b "System base power (MVA)" annotation (Dialog(group="Power flow data"));
protected
  parameter Real vr0=V_0*cos(angle_0*Modelica.Constants.pi/180);
  parameter Real vi0=V_0*sin(angle_0*Modelica.Constants.pi/180);
equation
  if nu > 0 then
    for i in 1:nu loop
      connect(Ext.p, u[i]);
    end for;
  end if;
  if no > 0 then
    for i in 1:no loop
      connect(Ext.p, o[i]);
    end for;
  end if;
  V = sqrt(Ext.p.vr^2 + Ext.p.vi^2);
  angle = atan2(Ext.p.vi, Ext.p.vr)*180/Modelica.Constants.pi;
  annotation (
    Diagram(coordinateSystem(extent={{0,-100},{20,100}})),
    Icon(coordinateSystem(extent={{0,-100},{20,100}}, preserveAspectRatio=false), graphics={Rectangle(
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
<td><p>Jan Lavenius & Giuseppe Laera, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>", revisions="<!--DISCLAIMER-->
<html>
<p>Copyright 2015 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<p>​- ​RTE: http://www.rte-france.com/</p>
<p>- SmarTS Lab, research group at KTH: https://www.kth.se/en</p>
<p>​- ​AIA: http://www.aia.es/en/energy/</p>
<p>​- ​DTU: http://www.dtu.dk/english</p>
<p>The authors can be contacted by email: info@itesla-ipsl.org </p>
<p>​</p>
<p>​​This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.</p>
</html>"));
end BusExt;
