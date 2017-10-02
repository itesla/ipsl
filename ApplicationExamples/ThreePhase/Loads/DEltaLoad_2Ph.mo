within ThreePhase.Loads;

model DeltaLoad_2Ph
  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter Real Sn = SysData.S_b "Power rating (MVA)" annotation(Dialog(group = "Power flow"));
  OpenIPSL.Interfaces.PwPin A annotation(Placement(transformation(extent = {{35.0, 0.0}, {55.0, 20.0}}, origin = {0.0, 0.0}, rotation = 0), iconTransformation(extent = {{35.0, 120.0}, {55.0, 100.0}}, origin = {0.0, 0.0}, rotation = 0), visible = true));
  OpenIPSL.Interfaces.PwPin B annotation(Placement(transformation(extent = {{-35.0, 0.0}, {-55.0, 20.0}}, origin = {0.0, 0.0}, rotation = 0), iconTransformation(extent = {{-35.0, 120.0}, {-55.0, 100.0}}, origin = {0.0, 0.0}, rotation = 0), visible = true));
  parameter Integer ModelType = 0 "0- Constant Power Model, 1- ZIP Model;" annotation(choices(choice = 0 "Constant Power", choice = 1 "ZIP Model"), Dialog(group = "Power flow"));
  parameter Real P_ab "Active power for line AB (MW)" annotation(Dialog(group = "Power flow"));
  parameter Real Q_ab "Reactive power for line AB (MVAr)" annotation(Dialog(group = "Power flow"));
  parameter Real A_ab = 0 "Percentage of Constant Power Load for Line AB (%)" annotation(Dialog(group = "Load Parameters for ZIP Model"));
  parameter Real B_ab = 0 "Percentage of Constant Current Load for Line AB (%)" annotation(Dialog(group = "Load Parameters for ZIP Model"));
  parameter Real C_ab = 0 "Percentage of Constant Impedance Load for Line AB (%)" annotation(Dialog(group = "Load Parameters for ZIP Model"));
  
protected
  parameter Real[1, 2] TPhasePower = [P_ab / (Sn / 3), Q_ab / (Sn / 3)];
  parameter Real[1, 3] ZIP_coef = [A_ab / 100, B_ab / 100, C_ab / 100];
  
  // Calculating the Line Voltage in p.u.
  Real Vabr = (A.vr - B.vr)/sqrt(3);
  Real Vabi = (A.vi - B.vi)/sqrt(3); 
  
  // Calculating the Magnitude of V and V squared
  Real Vab = sqrt(Vabr^2 + Vabi^2);
  Real Vab2 = Vab ^ 2;

 
 // Calculating the Coeficients for Adjusting the Power
  Real Coef_A = ZIP_coef[1,1] + ZIP_coef[1,2]*Vab + ZIP_coef[1,3]*Vab2;
  
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

  // Calculating new value for Active and Reactive Power
  Real Pab = TPhasePower[1, 1]*Coef[1,1];
  Real Pbc = TPhasePower[1, 2]*Coef[1,2];
  Real Qab = TPhasePower[1, 3]*Coef[1,1];
  Real Qbc = TPhasePower[1, 4]*Coef[1,2];
  
  // Calculating the Line Current in Delta Load:
  
  Real Iabr = (Pab*Vabr + Qab*Vabi)/Vab2;
  Real Iabi = (Pab*Vabi - Qab*Vabr)/Vab2;
  
equation
  
  A.ir = (Iabr)/sqrt(3);
  A.ii = (Iabi)/sqrt(3);
  B.ir = (- Iabr)/sqrt(3);
  B.ii = (- Iabi)/sqrt(3);
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{-100, 100}, {100, 100}, {0, -100}, {-100, 100}}, color = {28, 108, 200}), Text(origin = {-24, 20},lineColor = {28, 108, 200}, extent = {{-18, 72}, {66, 45}}, textString = "Delta Load"), Text(origin = {18, 4}, lineColor = {28, 108, 200}, extent = {{-62, 45}, {28, 26}}, textString = "PQ/ZIP Load")}), Documentation(revisions = "<html>
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
end DeltaLoad_2Ph;