within iPSL.Electrical.Machines.PSAT.ThirdOrder;
model Order3 "Third Order Synchronous Machine with Inputs and Outputs"
  import Modelica.Constants.pi;
  extends BaseClasses.baseMachine(
    delta(start=delta0),
    pe(start=pm00),
    pm(start=pm00),
    pm0(start=pm00),
    vf(start=vf00),
    vf0(start=vf00),
    vq(start=vq0),
    vd(start=vd0),
    iq(start=iq0),
    id(start=id0));
  parameter Real xd "d-axis synchronous reactance (pu)" annotation (Dialog(group="Machine parameters"));
  parameter Real Td10 "d-axis open circuit transient time constant (s)" annotation (Dialog(group="Machine parameters"));
  parameter Real xq "q-axis synchronous reactance (pu)" annotation (Dialog(group="Machine parameters"));
  //Base changing
  Real e1q(start=e1q0) "q-axis transient voltage (pu)";
protected
  parameter Real Xd=xd*CoB "d-axis reactance, p.u.";
  parameter Real x1d=xd1*CoB "d-axis transient reactance, p.u.";
  parameter Real Xq=xq*CoB "q-axis reactance, p.u.";
  parameter Real m=M/CoB2 "Machanical starting time (2H), kWs/kVA";
  parameter Real c1=Ra*K "CONSTANT";
  parameter Real c2=x1d*K "CONSTANT";
  parameter Real c3=Xq*K " CONSTANT";
  parameter Real K=1/(Ra*Ra + Xq*x1d) "CONSTANT";
  parameter Real delta0=atan2(vi0 + Ra*ii0 + Xq*ir0, vr0 + Ra*ir0 - Xq*ii0) "Initialitation";
  parameter Real vd0=vr0*cos(pi/2 - delta0) - vi0*sin(pi/2 - delta0) "Initialitation";
  parameter Real vq0=vr0*sin(pi/2 - delta0) + vi0*cos(pi/2 - delta0) "Initialitation";
  parameter Real id0=ir0*cos(pi/2 - delta0) - ii0*sin(pi/2 - delta0) "Initialitation";
  parameter Real iq0=ir0*sin(pi/2 - delta0) + ii0*cos(pi/2 - delta0) "Initialitation";
  parameter Real pm00=(vq0 + Ra*iq0)*iq0 + (vd0 + Ra*id0)*id0 "Initialitation";
  parameter Real vf00=e1q0 + (Xd - x1d)*id0 "Initialitation";
  parameter Real e1q0=vq0 + Ra*iq0 + x1d*id0 "Initialitation";
initial equation
  der(e1q) = 0;
equation
  der(e1q) = ((-e1q) - (Xd - x1d)*id + vf)/Td10;
  id = (-c1*vd) - c3*vq + e1q*c3;
  iq = c2*vd - c1*vq + e1q*c1;
  vf0 = vf00;
  pm0 = pm00;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={10,10}), graphics={Text(
          origin={4,61.9022},
          fillPattern=FillPattern.Solid,
          extent={{-57.2101,-15.0},{57.2101,15.0}},
          fontName="Arial",
          lineColor={28,108,200},
          textString="Order III")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Order III Synchonous Machine, PSAT Manual 2.1.8</p></td>
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
end Order3;
