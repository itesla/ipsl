within OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection;
function Yg_Yg "Calculation of impedance matrices for a grounded-wye-grounded-wye-connected three-phase transformer."
  extends Modelica.Icons.Function;
  input Real X;
  input Real R;
  input Real tap;
  output Real[12, 12] PiMatrix;
protected
  parameter Real Gser=(1/tap)*(R/(R*R + X*X));
  parameter Real Bser=(1/tap)*(-X/(R*R + X*X));
  parameter Real Gshk=(1/tap)*((1/tap) - 1)*(R/(R*R + X*X));
  parameter Real Bshk=(1/tap)*((1/tap) - 1)*(-X/(R*R + X*X));
  parameter Real Gshm=(1 - (1/tap))*(R/(R*R + X*X));
  parameter Real Bshm=(1 - (1/tap))*(-X/(R*R + X*X));
  parameter Real zero=1e-6;

  //Writing the Y_ser matrix according to Simulight
  parameter Real[6, 6] Y_ser=[Gser, -Bser, zero, zero, zero, zero; Bser, Gser,
      zero, zero, zero, zero; zero, zero, Gser, -Bser, zero, zero; zero, zero,
      Bser, Gser, zero, zero; zero, zero, zero, zero, Gser, -Bser; zero, zero,
      zero, zero, Bser, Gser];

  //Writing the Y_sht_k matrix according to Simulight
  parameter Real[6, 6] Yshtk=[Gshk, -Bshk, zero, zero, zero, zero; Bshk, Gshk,
      zero, zero, zero, zero; zero, zero, Gshk, -Bshk, zero, zero; zero, zero,
      Bshk, Gshk, zero, zero; zero, zero, zero, zero, Gshk, -Bshk; zero, zero,
      zero, zero, Bshk, Gshk];

  //Writing the Y_sht_m matrix according to Simulight
  parameter Real[6, 6] Yshtm=[Gshm, -Bshm, zero, zero, zero, zero; Bshm, Gshm,
      zero, zero, zero, zero; zero, zero, Gshm, -Bshm, zero, zero; zero, zero,
      Bshm, Gshm, zero, zero; zero, zero, zero, zero, Gshm, -Bshm; zero, zero,
      zero, zero, Bshm, Gshm];

  //Calculating the parameters for the Transformer
  //Writing the matrix A (Yser1+Yshtk)
  parameter Real[6, 6] A=Y_ser + Yshtk;

  //Writing the matrix B (-Yser1)
  parameter Real[6, 6] B=-Y_ser;

  //Writing the matrix MC (-Yser2)
  parameter Real[6, 6] C=-Y_ser;

  //Writing the matrix D (Yser2+Yshtm)
  parameter Real[6, 6] D=Y_ser + Yshtm;

algorithm
  PiMatrix := [A, B; C, D];
annotation (
Documentation(info="<html>
<p>This function calculates impedance matrices of a three-phase transformer modeled as a pi-equivalent.</p>
<p>The transformer that uses this function should have its primary and secondary windings connected in grounded-wye (grounded-star).</p>

</html>"));
end Yg_Yg;
