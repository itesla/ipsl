within OpenIPSL.Electrical.ThreePhase.Branches.Lines;
model Line_2Ph "Two-phase line modeled as a PI-equivalent device."
  extends Branches.BaseClasses.baseLine;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-140,35},{-120,55}})));
  OpenIPSL.Interfaces.PwPin Bin
    annotation (Placement(transformation(extent={{-140,-55},{-120,-35}})));
  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{120,35},{140,55}})));
  OpenIPSL.Interfaces.PwPin Bout
    annotation (Placement(transformation(extent={{120,-55},{140,-35}})));

  parameter Real Gseraa=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bseraa=-10 "in p.u."
    annotation (Dialog(group="Power flow data"));
  parameter Real Gserab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Gserbb=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bserbb=-10 "in p.u."
    annotation (Dialog(group="Power flow data"));
  parameter Real Bshtaa=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtab=0 "in p.u." annotation (Dialog(group="Power flow data"));
  parameter Real Bshtbb=0 "in p.u." annotation (Dialog(group="Power flow data"));

  //Writing the Y_ser matrix for the pi model
protected
  parameter Real[4, 4] Y_ser=[Gseraa, -Bseraa, Gserab, -Bserab; Bseraa, Gseraa,
      Bserab, Gserab; Gserab, -Bserab, Gserbb, -Bserbb; Bserab, Gserab, Bserbb,
      Gserbb];

  //Writing the Y_sht matrix for the pi model
  parameter Real[4, 4] Y_sht=[zero, -Bshtaa, zero, -Bshtab; Bshtaa, zero,
      Bshtab, zero; zero, -Bshtab, zero, -Bshtbb; Bshtab, zero, Bshtbb, zero];

  //Calculating the parameters for the Transformer
  //Writing the matrix A (Yser1+Yshtk)
  parameter Real[4, 4] A=Y_ser + Y_sht;

  //Writing the matrix B (-Yser1)
  parameter Real[4, 4] B=-Y_ser;

  // Writing matrix for voltages (in and out)
  Real[4, 1] Vin=[Ain.vr; Ain.vi; Bin.vr; Bin.vi];
  Real[4, 1] Vout=[Aout.vr; Aout.vi; Bout.vr; Bout.vi];
  // Writing matrix for currents (in and out)
  Real[4, 1] Iin=[Ain.ir; Ain.ii; Bin.ir; Bin.ii];
  Real[4, 1] Iout=[Aout.ir; Aout.ii; Bout.ir; Bout.ii];

equation
  // Equations according to pi model
  Iin = A*Vin + B*Vout;
  Iout = B*Vin + A*Vout;

  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Line(points={{-90,0},{-110,45},{-130,45}},
          color={0,0,255}),Line(points={{-90,0},{-110,-45},{-130,-45}}, color={
          0,0,255}),Line(points={{90,0},{110,45},{130,45}}, color={0,0,255}),
          Line(points={{90,0},{110,-45},{130,-45}}, color={0,0,255})}),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1)),
    Documentation(info="<html>
<p>This model was design to represent two-phase power line, modeled as a pi-element.<\p> 
<p>The user should input the resistance, reactance and line charging in matrix form, since the model allows the representation of unbalanced lines.
Based on this set of parameters, the pi-equivalent impedance matrices are calculated and the power line equation is assembled.</p>
<p> <\p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td>2020-05-20</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Marcelo de Castro, AlsetLab, and Maxime Baudette, LBNL</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:vanfrl@rpi.edu\">vanfrl@rpi.edu</a></p></td>
</tr>
</table>
</html>"));
end Line_2Ph;
