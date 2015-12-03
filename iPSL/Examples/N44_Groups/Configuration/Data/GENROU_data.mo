within iPSL.Examples.N44_Groups.Configuration.Data;


record GENROU_data
  parameter Real J=6.15 "d-axis transient open-circuit time constant s";
  parameter Real J1=0.11 "d-axis sub-transient open-circuit time constant s";
  parameter Real J2=0.3 "q-axis transient open-circuit time constant s";
  parameter Real J3=0.1 "q-axis transient open-circuit time constant s";
  parameter Real J4=3 "inertia constant s";
  parameter Real J5=0 "Damping";
  parameter Real J6=1.157 "d-axis reactance";
  parameter Real J7=0.968 "q-axis reactance";
  parameter Real J8=0.242 "d-axis transient reactance";
  parameter Real J9=0.427 "d-axis transient reactance";
  parameter Real J10=0.2 "d-axis sub-transient reactance";
  parameter Real J11=0.12 "leakage reactance";
  parameter Real J12=0.1175;
  //less than zero can commend the saturation function
  parameter Real J13=0.42;
  // paremeter Real gentype = 1;
  annotation (
    Icon(graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),
          Text(
          extent={{-32,14},{32,-10}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="|x|"),Text(
          extent={{-58,4},{-46,-4}},
          lineColor={255,255,255},
          textString="p1")}),
    Diagram(graphics),
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
end GENROU_data;
