within iPSL.Electrical.Branches.PSAT.ThreeWindingTransformer;


model Branch3
  iPSL.Connectors.PwPin p3 annotation(Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
  iPSL.Connectors.PwPin n3 annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
  parameter Real SystemBase = 100;
  parameter Real Sn = 100 "Power rating MVA";
  parameter Real Vbus = 400000 "Sending end bus voltage, V";
  parameter Real Vn1 = 400000 "Voltage rating of the first winding, V";
  parameter Real Vn2 = 100000 "Voltage rating of the second winding, V";
  parameter Real Vn3 = 40000 "Voltage rating of the third winding, V";
  parameter Real fn = 50 "Frequency rating Hz";
  parameter Real R12 = 0.01 "Resistance of the branch 1-2, p.u.";
  parameter Real R13 = 0.01 "Resistance of the branch 1-3, p.u.";
  parameter Real R23 = 0.01 "Resistance of the branch 2-3, p.u.";
  parameter Real X12 = 0.1 "Reactance of the branch 1-2, p.u.";
  parameter Real X13 = 0.1 "Reactance of the branch 1-3, p.u.";
  parameter Real X23 = 0.1 "Reactance of the branch 2-3, p.u.";
  parameter Real m = 0.98 "Fixed Tap ratio";
  Real r3;
  Real x3;
equation
  r3 = 0.5 * (R23 + R13 - R12);
  x3 = 0.5 * (X23 + X13 - X12);
  r3 * p3.ir - x3 * p3.ii = p3.vr - n3.vr;
  r3 * p3.ii + x3 * p3.ir = p3.vi - n3.vi;
  r3 * n3.ir - x3 * n3.ii = n3.vr - p3.vr;
  x3 * n3.ir + r3 * n3.ii = n3.vi - p3.vi;
  annotation(Documentation(info = "<html>
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
end Branch3;
