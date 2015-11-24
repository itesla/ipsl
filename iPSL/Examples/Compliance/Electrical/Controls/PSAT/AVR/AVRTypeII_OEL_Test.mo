within iPSL.Examples.Compliance.Electrical.Controls.PSAT.AVR;
model AVRTypeII_OEL_Test

   iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(P_0 = 0.08, Q_0 = 0.06,
    V_0=1,
    angle_0=0)                                                          annotation(Placement(visible = true, transformation(origin = {122.283, 26}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
   iPSL.Electrical.Branches.PwLine2Openings pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(visible=true, transformation(
        origin={79,16},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={79,31},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={84,-19},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(P_0 = 0.08, Q_0 = 0.06,
    V_0=1,
    angle_0=0)                                                          annotation(Placement(visible = true, transformation(origin = {124, -19}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
   iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={44,26},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={44,-4},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
   iPSL.Electrical.Events.PwFaultPQ pwFault(X = 0.001, t1 = 3, R = 0.3, t2 = 3.1) annotation(Placement(transformation(extent = {{115, -52}, {135, -32}})));
   iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 order6Type2_Inputs_Outputs(Sn = Sn,                   Vn = Vn, V_b = Vbus, xd = xd0, xq = xq0,
    V_0=1,
    angle_0=0,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0)                                                                                                     annotation(Placement(transformation(extent = {{-68, -12}, {12, 66}})));
   iPSL.Electrical.Controls.PSAT.OEL.OEL oXL(vOELmax = 0.05, xd = xd0, xq = xq0, iflim = 2.7, T0 = 5) annotation(Placement(transformation(extent = {{84, 72}, {40, 112}})));
   iPSL.NonElectrical.Math.ImSetPoint imSetPoint(V = 1) annotation(Placement(transformation(extent = {{120, 72}, {100, 92}})));
  parameter Real Sn = 370 "Power rating, MVA";
  parameter Real Vn = 400000 "Nominal voltage";
  parameter Real Vbus = 400000 "Bus nominal voltage, change of base";
  parameter Real xd0 = 1.9 "d-axis reactance, p.u.";
  parameter Real xq0 = 1.7 "q-axis reactance, p.u.";
   iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII exciter_Type_II(vref0 = 1, vrmin = -5, vrmax = 5, Ta = 0.1, Te = 1, Tr = 0.001, Ae = 0.0006, Be = 0.9, Kf = 0.45, Tf = 1, Ka = 400, vf0 = 1.064, Ke = 0.01) annotation(Placement(transformation(extent = {{22, 58}, {-40, 110}})));
  inner iPSL.Electrical.SystemBase  SysData
    annotation (Placement(transformation(extent={{-80,-80},{-56,-60}})));
equation
  connect(pwLine4.n, pwLoadPQ2.p) annotation(Line(visible = true, origin = {101.213, 29}, points={{-15.213,
          2},{3.0708,2},{3.0708,8},{21.07,8}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation(Line(visible = true, origin = {86, 23.5}, points = {{0, -7.5}, {0, 7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation(Line(visible = true, origin = {72, 23.5}, points = {{0, 7.5}, {0, -7.5}}));
  connect(pwLine3.n, pwLoadPQ1.p) annotation(Line(visible = true, origin = {107.5, -18.5}, points={{-16.5,
          -0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLine2.n, pwLine4.p) annotation(Line(points = {{51, 26}, {64, 26}, {64, 31}, {72, 31}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.n, pwLine3.p) annotation(Line(points = {{51, -4}, {64, -4}, {64, -19}, {77, -19}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine2.n, pwLine1.n) annotation(Line(points = {{51, 26}, {51, -4}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwFault.p, pwLine3.n) annotation(Line(points={{113.333,-42},{104,-42},
          {104,-19},{91,-19}},                                                                            color = {0, 0, 255}, smooth = Smooth.None));
  connect(order6Type2_Inputs_Outputs.p, pwLine2.p) annotation(Line(points={{16,
          27.1936},{27,27.1936},{27,26},{37,26}},                                                                               color = {0, 0, 255}, smooth = Smooth.None));
  connect(pwLine1.p, pwLine2.p) annotation(Line(points = {{37, -4}, {37, 26}}, color = {0, 0, 255}, smooth = Smooth.None));
  connect(oXL.v, order6Type2_Inputs_Outputs.v) annotation(Line(points={{78.72,
          108.4},{96,108.4},{96,40},{30,40},{30,38.7},{16,38.7}},                                                                                      color = {0, 0, 127}, smooth = Smooth.None));
  connect(oXL.vref0, imSetPoint.n1) annotation(Line(points = {{78.5, 86}, {92, 86}, {92, 82}, {105.1, 82}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(order6Type2_Inputs_Outputs.Q, oXL.q) annotation(Line(points={{16,3.6},
          {16,-76},{138,-76},{138,93.8},{78.72,93.8}},                                                                                       color = {0, 0, 127}, smooth = Smooth.None));
  connect(exciter_Type_II.vf, order6Type2_Inputs_Outputs.vf) annotation(Line(points={{-35.35,
          90.76},{-68,90.76},{-68,46.5}},                                                                                              color = {0, 0, 127}, smooth = Smooth.None));
  connect(exciter_Type_II.vref, oXL.vref) annotation(Line(points = {{15.8, 98.04}, {29.9, 98.04}, {29.9, 96.4}, {44.4, 96.4}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(exciter_Type_II.v, order6Type2_Inputs_Outputs.v) annotation(Line(points={{15.8,
          81.4},{42,81.4},{42,40},{30,40},{30,38.7},{16,38.7}},                                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
  connect(order6Type2_Inputs_Outputs.pm0, order6Type2_Inputs_Outputs.pm) annotation(Line(points={{-60,
          -15.9},{32,-15.9},{32,108},{-92,108},{-92,7.5},{-68,7.5}},                                                                                                    color = {0, 0, 127}, smooth = Smooth.None));
  connect(order6Type2_Inputs_Outputs.P, oXL.p) annotation(Line(points={{16,
          15.237},{32,15.237},{32,-62},{136,-62},{136,101.4},{78.72,101.4}},                                          color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {140, 120}}, preserveAspectRatio = false), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {140, 120}})),
    Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
end AVRTypeII_OEL_Test;
