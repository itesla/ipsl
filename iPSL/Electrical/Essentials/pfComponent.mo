within iPSL.Electrical.Essentials;
partial model pfComponent
  "Partial model containing all the Data for entering Power Flow data"

  outer iPSL.Electrical.SystemBase SysData "Must add this line in all models";

  parameter Real V_b = 400 "Base voltage of the bus (kV)"
                                                         annotation (Dialog(group="Power flow data"));
  parameter Real V_0 = 1 "Voltage magnitude (pu)"
                                                 annotation (Dialog(group="Power flow data"));
  parameter Real angle_0 = 0 "Voltage angle (deg)" annotation (Dialog(group="Power flow data"));
  parameter Real P_0 = 1 "Active power (MW)"  annotation (Dialog(group="Power flow data"));
  parameter Real Q_0 = 0 "Reactive power (MVAr)" annotation (Dialog(group="Power flow data"));
  parameter Real S_b = SysData.S_b "System base power (MVA)"
                                                            annotation (Dialog(group="Power flow data", enable=false));
  parameter Real fn = SysData.fn "System Frequency (Hz)" annotation (Dialog(group="Power flow data",enable=false));

  annotation (Documentation(info="<html>
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
end pfComponent;
