within ThreePhase.Loads;

model WyeLoad_1Ph
  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter Real Sn = SysData.S_b "Power rating (MVA)" annotation(
    Dialog(group = "Power flow"));
 OpenIPSL.Interfaces.PwPin A annotation(Placement(transformation(extent = {{-10.0, 0.0}, {10.0, 20.0}}, origin = {0.0, 0.0}, rotation = 0), iconTransformation(extent = {{-80.0, 0.0}, {-60.0, 20.0}}, origin = {70, 100}, rotation = 0), visible = true));
  parameter Integer ModelType = 0 "0- Constant Power Model, 1- ZIP Model;" annotation(
    choices(choice = 0 "Constant Power", choice = 1 "ZIP Model"),
    Dialog(group = "Power flow"));
  parameter Real P_a "Active power for phase A (MW)" annotation(
    Dialog(group = "Power flow"));
  parameter Real Q_a "Reactive power for phase A (MVAr)" annotation(
    Dialog(group = "Power flow"));
  parameter Real A_pa = 0 "Percentage of Constant Power Load for Phase A (%)" annotation(
    Dialog(group = "Load Parameters for ZIP Model"));
  parameter Real B_pa = 0 "Percentage of Constant Current Load for Phase A (%)" annotation(
    Dialog(group = "Load Parameters for ZIP Model"));
  parameter Real C_pa = 0 "Percentage of Constant Impedance Load for Phase A (%)" annotation(
    Dialog(group = "Load Parameters for ZIP Model"));
protected
  parameter Real[1, 2] TPhasePower = [P_a / (Sn / 3), Q_a / (Sn / 3)];
  parameter Real[1, 3] ZIP_coef = [A_pa / 100, B_pa / 100, C_pa / 100];
  // Calculating V and V2
  Real Va = sqrt(A.vr ^ 2 + A.vi ^ 2);
  Real Va2 = Va ^ 2;
  // Calculating the Coeficients for Adjusting the Power
  Real Coef_A = ZIP_coef[1, 1] + ZIP_coef[1, 2] * Va + ZIP_coef[1, 3] * Va2;
  Real in_coef = Coef_A;

  function Coeficients
    input Real in_coef;
    input Integer ModelType;
    output Real Coef;
  algorithm
    if ModelType == 0 then
      Coef := 1;
    elseif ModelType == 1 then
      Coef := in_coef;
    end if;
  end Coeficients;

  Real Coef = Coeficients(in_coef, ModelType);

  function PowerDefinition
    input Integer ModelType;
    input Real[1, 2] TPhasePower;
    input Real Coef;
    output Real[1, 2] Cor_Power;
  protected
    // Identifying input elements for the Coeficients
    Real coef_A = Coef;
    // Identifying input elements for Power
    parameter Real Pan = TPhasePower[1, 1];
    parameter Real Qan = TPhasePower[1, 2];
    // Calculating Corrected Power
    Real Pa_cor = Pan * coef_A;
    Real Qa_cor = Qan * coef_A;
  algorithm
    if ModelType == 0 then
      Cor_Power := [Pan, Qan];
    elseif ModelType == 1 then
      Cor_Power := [Pa_cor, Qa_cor];
    end if;
  end PowerDefinition;

  Real[1, 2] Power = PowerDefinition(ModelType, TPhasePower, Coef);
  Real Pa = Power[1, 1];
  Real Qa = Power[1, 2];
equation
  Pa = A.vr * A.ir + A.vi * A.ii;
  Qa = A.vi * A.ir - A.vr * A.ii;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{-100, 100}, {100, 100}, {0, -100}, {-100, 100}}, color = {28, 108, 200}), Text(lineColor = {28, 108, 200}, extent = {{-62, 90}, {66, 45}}, textString = "Grounded-Wye Load"), Text(origin = {18, 4}, lineColor = {28, 108, 200}, extent = {{-62, 45}, {28, 26}}, textString = "PQ/ZIP Load")}),
    Documentation(revisions = "<html>
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
end WyeLoad_1Ph;