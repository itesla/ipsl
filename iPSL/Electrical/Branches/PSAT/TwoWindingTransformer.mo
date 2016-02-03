within iPSL.Electrical.Branches.PSAT;
model TwoWindingTransformer "Modeled as series reactances without iron losses"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Real Sb=100 "System base power (MVA)" annotation (Dialog(group="Power flow"));
  parameter Real Sn=100 "Power rating (MVA)" annotation (Dialog(group="Power flow"));
  parameter Real V_b=400000 "Sending end bus voltage" annotation (Dialog(group="Power flow"));
  parameter Real Vn=400000 "Voltage rating (kV)" annotation (Dialog(group="Power flow"));
  parameter Real fn=50 "Frequency rating (Hz)" annotation (Dialog(group="Power flow"));
  parameter Real kT=1 "Nominal tap ratio (V1/V2)" annotation (Dialog(group="Transformer parameters"));
  parameter Real x=0.001 "Reactance (pu)" annotation (Dialog(group="Transformer parameters"));
  parameter Real r=0.1 "Resistance (pu)" annotation (Dialog(group="Transformer parameters"));
protected
  parameter Real Vb2new=V_b^2;
  parameter Real Vb2old=Vn*Vn;
  parameter Real xT=x*(Vb2old*Sb)/(Vb2new*Sn) "Reactance(inductive),p.u";
  parameter Real rT=r*(Vb2old*Sb)/(Vb2new*Sn) "Reactance(capacitive),p.u";
equation
  rT*p.ir - xT*p.ii = p.vr - n.vr;
  rT*p.ii + xT*p.ir = p.vi - n.vi;
  rT*n.ir - xT*n.ii = n.vr - p.vr;
  xT*n.ir + rT*n.ii = n.vi - p.vi;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(graphics={Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,255}),Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
          points={{100,0},{44,0},{44,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>29/09/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
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
end TwoWindingTransformer;
