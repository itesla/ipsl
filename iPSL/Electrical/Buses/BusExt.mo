within iPSL.Electrical.Buses;


model BusExt
  iPSL.Connectors.PwPinExt Ext;
  parameter Integer nu(min=0) = 0 "Number of inputs" annotation (Dialog(connectorSizing=true), HideResult=true);
  parameter Integer no(min=0) = 0 "Number of outputs" annotation (Dialog(connectorSizing=true), HideResult=true);
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
  Real V "Bus voltage magnitude";
  Real angle "Bus voltage angle";
  parameter Real V_b=130 "Base voltage (kV)" annotation (Dialog(group="Power flow data"));
  parameter Real S_b=100 "System base power (MVA)" annotation (Dialog(group="Power flow data"));
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
  angle = atan2(Ext.p.vi, Ext.p.vr);
  annotation (
    Diagram(coordinateSystem(extent={{0,-100},{20,100}})),
    Icon(coordinateSystem(extent={{0,-100},{20,100}}, preserveAspectRatio=false), graphics={Rectangle(
          extent={{0,100},{20,-100}},
          lineColor={0,0,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end BusExt;
