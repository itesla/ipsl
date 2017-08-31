within ThreePhase.Branches.Transformer;
model Transformer_3Ph "Three Phase transformer modeled in a PI element"


  import ThreePhase.Branches.Transformer.TransfConnection.Yg_Yg;
  import ThreePhase.Branches.Transformer.TransfConnection.D_D;
  import ThreePhase.Branches.Transformer.TransfConnection.Y_Y;
  import ThreePhase.Branches.Transformer.TransfConnection.D_Yg;
  import ThreePhase.Branches.Transformer.TransfConnection.Yg_D;
  import ThreePhase.Branches.Transformer.TransfConnection.D_Y;
  import ThreePhase.Branches.Transformer.TransfConnection.Y_D;
  import ThreePhase.Branches.Transformer.TransfConnection.Y_Yg;
  import ThreePhase.Branches.Transformer.TransfConnection.Yg_Y;

  outer OpenIPSL.Electrical.SystemBase SysData;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  OpenIPSL.Interfaces.PwPin Bin
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Interfaces.PwPin Cin
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Interfaces.PwPin Bout
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Interfaces.PwPin Cout
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  parameter Integer Connection = 0
    "0 Yg-Yg; 1 D-D; 2 Y-Y; 3 D-Yg; 4 Yg-D; 5 D-Y; 6 Y-D; 7 Y-Yg; 8 Yg-Y;"
    annotation (choices(
      choice=0 "Yg-Yg",
      choice=1 "D-D",
      choice=2 "Y-Y",
      choice=3 "D-Yg",
      choice=4 "Yg-D",
      choice=5 "D-Y",
      choice=6 "Y-D",
      choice=7 "Y-Yg",
      choice=8 "Yg-Y"));

  parameter Real Sb = SysData.S_b "System base power (MVA)" annotation (Dialog(group="Power flow"));
  parameter Real fn = SysData.fn "Frequency rating (Hz)" annotation (Dialog(group="Power flow"));
  parameter Real tap=1 "Nominal tap ratio (Vs/Vp)" annotation (Dialog(group="Transformer parameters"));
  parameter Real X=0.001 "Reactance (pu machine base)" annotation (Dialog(group="Transformer parameters"));
  parameter Real R=0.1 "Resistance (pu machine base)" annotation (Dialog(group="Transformer parameters"));
protected
   function ConnectionType
    input Integer Connection;
    input Real X, R, tap;
    output Real[1,72] V;
   algorithm
    if Connection == 0 then
      V := Yg_Yg(
          X,
          R,
          tap);
    elseif Connection == 1 then
      V := D_D(
          X,
          R,
          tap);
    elseif Connection == 2 then
      V := Y_Y(
          X,
          R,
          tap);
    elseif Connection == 3 then
      V := D_Yg(
          X,
          R,
          tap);
    elseif Connection == 4 then
      V := Yg_D(
          X,
          R,
          tap);
    elseif Connection == 5 then
      V := D_Y(
          X,
          R,
          tap);
    elseif Connection == 6 then
      V := Y_D(
          X,
          R,
          tap);
    elseif Connection == 7 then
      V := Y_Yg(
          X,
          R,
          tap);
    elseif Connection == 8 then
      V := Yg_Y(
          X,
          R,
          tap);
    end if;
   end ConnectionType;
   parameter Real[1,72] Aux = ConnectionType(Connection, X, R, tap);
   parameter Real A11r = Aux[1,1];
   parameter Real A11i = Aux[1,2];
   parameter Real A12r = Aux[1,3];
   parameter Real A12i = Aux[1,4];
   parameter Real A13r = Aux[1,5];
   parameter Real A13i = Aux[1,6];
   parameter Real A21r = Aux[1,7];
   parameter Real A21i = Aux[1,8];
   parameter Real A22r = Aux[1,9];
   parameter Real A22i = Aux[1,10];
   parameter Real A23r = Aux[1,11];
   parameter Real A23i = Aux[1,12];
   parameter Real A31r = Aux[1,13];
   parameter Real A31i = Aux[1,14];
   parameter Real A32r = Aux[1,15];
   parameter Real A32i = Aux[1,16];
   parameter Real A33r = Aux[1,17];
   parameter Real A33i = Aux[1,18];
   parameter Real B11r = Aux[1,19];
   parameter Real B11i = Aux[1,20];
   parameter Real B12r = Aux[1,21];
   parameter Real B12i = Aux[1,22];
   parameter Real B13r = Aux[1,23];
   parameter Real B13i = Aux[1,24];
   parameter Real B21r = Aux[1,25];
   parameter Real B21i = Aux[1,26];
   parameter Real B22r = Aux[1,27];
   parameter Real B22i = Aux[1,28];
   parameter Real B23r = Aux[1,29];
   parameter Real B23i = Aux[1,30];
   parameter Real B31r = Aux[1,31];
   parameter Real B31i = Aux[1,32];
   parameter Real B32r = Aux[1,33];
   parameter Real B32i = Aux[1,34];
   parameter Real B33r = Aux[1,35];
   parameter Real B33i = Aux[1,36];
   parameter Real C11r = Aux[1,37];
   parameter Real C11i = Aux[1,38];
   parameter Real C12r = Aux[1,39];
   parameter Real C12i = Aux[1,40];
   parameter Real C13r = Aux[1,41];
   parameter Real C13i = Aux[1,42];
   parameter Real C21r = Aux[1,43];
   parameter Real C21i = Aux[1,44];
   parameter Real C22r = Aux[1,45];
   parameter Real C22i = Aux[1,46];
   parameter Real C23r = Aux[1,47];
   parameter Real C23i = Aux[1,48];
   parameter Real C31r = Aux[1,49];
   parameter Real C31i = Aux[1,50];
   parameter Real C32r = Aux[1,51];
   parameter Real C32i = Aux[1,52];
   parameter Real C33r = Aux[1,53];
   parameter Real C33i = Aux[1,54];
   parameter Real D11r = Aux[1,55];
   parameter Real D11i = Aux[1,56];
   parameter Real D12r = Aux[1,57];
   parameter Real D12i = Aux[1,58];
   parameter Real D13r = Aux[1,59];
   parameter Real D13i = Aux[1,60];
   parameter Real D21r = Aux[1,61];
   parameter Real D21i = Aux[1,62];
   parameter Real D22r = Aux[1,63];
   parameter Real D22i = Aux[1,64];
   parameter Real D23r = Aux[1,65];
   parameter Real D23i = Aux[1,66];
   parameter Real D31r = Aux[1,67];
   parameter Real D31i = Aux[1,68];
   parameter Real D32r = Aux[1,69];
   parameter Real D32i = Aux[1,70];
   parameter Real D33r = Aux[1,71];
   parameter Real D33i = Aux[1,72];

equation
    // Equations according to pi model
  Ain.ir = A11r*Ain.vr-A11i*Ain.vi + A12r*Bin.vr-A12i*Bin.vi + A13r*Cin.vr-A13i*Cin.vi + B11r*Aout.vr-B11i*Aout.vi + B12r*Bout.vr-B12i*Bout.vi + B13r*Cout.vr-B13i*Cout.vi;
  Ain.ii = A11r*Ain.vi+A11i*Ain.vr + A12r*Bin.vi+A12i*Bin.vr + A13r*Cin.vi+A13i*Cin.vr + B11r*Aout.vi+B11i*Aout.vr + B12r*Bout.vi+B12i*Bout.vr + B13r*Cout.vi+B13i*Cout.vr;
  Bin.ir = A21r*Ain.vr-A21i*Ain.vi + A22r*Bin.vr-A22i*Bin.vi + A23r*Cin.vr-A23i*Cin.vi + B21r*Aout.vr-B21i*Aout.vi + B22r*Bout.vr-B22i*Bout.vi + B23r*Cout.vr-B23i*Cout.vi;
  Bin.ii = A21r*Ain.vi+A21i*Ain.vr + A22r*Bin.vi+A22i*Bin.vr + A23r*Cin.vi+A23i*Cin.vr + B21r*Aout.vi+B21i*Aout.vr + B22r*Bout.vi+B22i*Bout.vr + B23r*Cout.vi+B23i*Cout.vr;
  Cin.ir = A31r*Ain.vr-A31i*Ain.vi + A32r*Bin.vr-A32i*Bin.vi + A33r*Cin.vr-A33i*Cin.vi + B31r*Aout.vr-B31i*Aout.vi + B32r*Bout.vr-B32i*Bout.vi + B33r*Cout.vr-B33i*Cout.vi;
  Cin.ii = A31r*Ain.vi+A31i*Ain.vr + A32r*Bin.vi+A32i*Bin.vr + A33r*Cin.vi+A33i*Cin.vr + B31r*Aout.vi+B31i*Aout.vr + B32r*Bout.vi+B32i*Bout.vr + B33r*Cout.vi+B33i*Cout.vr;
  Aout.ir = C11r*Ain.vr-C11i*Ain.vi + C12r*Bin.vr-C12i*Bin.vi + C13r*Cin.vr-C13i*Cin.vi + D11r*Aout.vr-D11i*Aout.vi + D12r*Bout.vr-D12i*Bout.vi + D13r*Cout.vr-D13i*Cout.vi;
  Aout.ii = C11r*Ain.vi+C11i*Ain.vr + C12r*Bin.vi+C12i*Bin.vr + C13r*Cin.vi+C13i*Cin.vr + D11r*Aout.vi+D11i*Aout.vr + D12r*Bout.vi+D12i*Bout.vr + D13r*Cout.vi+D13i*Cout.vr;
  Bout.ir = C21r*Ain.vr-C21i*Ain.vi + C22r*Bin.vr-C22i*Bin.vi + C23r*Cin.vr-C23i*Cin.vi + D21r*Aout.vr-D21i*Aout.vi + D22r*Bout.vr-D22i*Bout.vi + D23r*Cout.vr-D23i*Cout.vi;
  Bout.ii = C21r*Ain.vi+C21i*Ain.vr + C22r*Bin.vi+C22i*Bin.vr + C23r*Cin.vi+C23i*Cin.vr + D21r*Aout.vi+D21i*Aout.vr + D22r*Bout.vi+D22i*Bout.vr + D23r*Cout.vi+D23i*Cout.vr;
  Cout.ir = C31r*Ain.vr-C31i*Ain.vi + C32r*Bin.vr-C32i*Bin.vi + C33r*Cin.vr-C33i*Cin.vi + D31r*Aout.vr-D31i*Aout.vi + D32r*Bout.vr-D32i*Bout.vi + D33r*Cout.vr-D33i*Cout.vi;
  Cout.ii = C31r*Ain.vi+C31i*Ain.vr + C32r*Bin.vi+C32i*Bin.vr + C33r*Cin.vi+C33i*Cin.vr + D31r*Aout.vi+D31i*Aout.vr + D32r*Bout.vi+D32i*Bout.vr + D33r*Cout.vi+D33i*Cout.vr;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    Icon(graphics = {Ellipse(lineColor = {0, 0, 255}, extent = {{-46, 30}, {8, -30}}, endAngle = 360), Ellipse(lineColor = {0, 0, 255}, extent = {{-8, 30}, {46, -30}}, endAngle = 360), Line(points = {{100, 0}, {46, 0}}, color = {0, 0, 255}), Line(points = {{-100, 0}, {-46, 0}}, color = {0, 0, 255}), Line(points = {{-60, 90}, {-39, 20}}, color = {0, 0, 255}), Line(points = {{-60, 90}, {-90, 90}}, color = {0, 0, 255}), Line(points = {{60, 90}, {39, 20}}, color = {0, 0, 255}), Line(points = {{60, 90}, {90, 90}}, color = {0, 0, 255}),Line(points = {{-60, -90}, {-39, -20}}, color = {0, 0, 255}), Line(points = {{-60, -90}, {-90, -90}}, color = {0, 0, 255}),Line(points = {{60, -90}, {39, -20}}, color = {0, 0, 255}), Line(points = {{60, -90}, {90, -90}}, color = {0, 0, 255}), Text(lineColor = {28, 108, 200}, extent = {{-38, 20}, {-4, -20}}, textString = "K"), Text(origin = {6, 0},lineColor = {28, 108, 200}, extent = {{1, 20}, {35, -20}}, textString = "M"), Text(origin = {-54, 84}, lineColor = {28, 108, 200}, extent = {{4, 18}, {104, -34}}, textString = "Three Phase Transformer")}, coordinateSystem(initialScale = 0.1)),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end Transformer_3Ph;