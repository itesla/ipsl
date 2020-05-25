within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri;
model Line_MT "Transmission Line modeled as a PI element with a hybrid interface positive-sequence/three-phase"
  extends Branches.BaseClasses.baseLine;

  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.LineFcn.MT_InfiniteImpedances;
  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.LineFcn.MT_FiniteImpedance;

  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  OpenIPSL.Interfaces.PwPin A
    annotation (Placement(transformation(extent={{120,80},{140,100}})));
  OpenIPSL.Interfaces.PwPin B
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  OpenIPSL.Interfaces.PwPin C
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));

  // Options for the type of model that the user wants to simulate
  parameter Integer ModelType=0
    "0- Assuming that the negative and zero norton admittances are infinite (Aproximation), 1- Considering that the negative and zero norton admittances finite values;"
    annotation (Dialog(group="Selection of model"),choices(choice=0
        "Norton admittances have infinite values", choice=1
        "Norton admittances have finite values"));

  // Parameters for the abc model
  parameter Real Gseraa=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bseraa=-10 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Gserab=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bserab=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Gserac=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bserac=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Gserbb=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bserbb=-10 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Gserbc=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bserbc=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Gsercc=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bsercc=-10 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bshtaa=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bshtab=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bshtac=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bshtbb=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bshtbc=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));
  parameter Real Bshtcc=0 "in p.u."
    annotation (Dialog(group="Parameters for an 'abc'-Model"));

  parameter Real G_0=0 "Zero sequence conductance in p.u." annotation (Dialog(
        group=
          "Norton equivalent admittances in terminal K - Considering the negative and zero norton admittances have finite values"));
  parameter Real B_0=0 "Zero sequence susceptance in p.u." annotation (Dialog(
        group=
          "Norton equivalent admittances in terminal K - Considering the negative and zero norton admittances have finite values"));
  parameter Real G_1=0 "Positive sequence conductance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering the negative and zero norton admittances have finite values"));
  parameter Real B_1=0 "Positive sequence susceptance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering the negative and zero norton admittances have finite values"));
  parameter Real G_2=0 "Negative sequence conductance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering the negative and zero norton admittances have finite values"));
  parameter Real B_2=0 "Negative sequence susceptance in p.u." annotation (
      Dialog(group=
          "Norton equivalent admittances in terminal K - Considering the negative and zero norton admittances have finite values"));

  //Writing the Y_ser matrix for the pi model
protected
  parameter Real[1, 18] Yser=[Gseraa, Bseraa, Gserab, Bserab, Gserac, Bserac,
      Gserab, Bserab, Gserbb, Bserbb, Gserbc, Bserbc, Gserac, Bserac, Gserbc,
      Bserbc, Gsercc, Bsercc];

  //Writing the Y_sht matrix for the pi model
  parameter Real[1, 18] Ysht=[0, Bshtaa, 0, Bshtab, 0, Bshtac, 0, Bshtab, 0,
      Bshtbb, 0, Bshtbc, 0, Bshtac, 0, Bshtbc, 0, Bshtcc];

  //Writing the Y012 Norton matrix for the exact model
  parameter Real[1, 18] Y012=[G_0, B_0, 0, 0, 0, 0, 0, 0, G_1, B_1, 0, 0, 0, 0,
      0, 0, G_2, B_2];

  function Model
    input Integer ModelType;
    input Real[1, 18] Yser;
    input Real[1, 18] Ysht;
    input Real[1, 18] Y012;
    output Real[1, 32] Y;
  algorithm
    if ModelType == 0 then
      Y := MT_InfiniteImpedances(Yser, Ysht);
    elseif ModelType == 1 then
      Y := MT_FiniteImpedance(
          Yser,
          Ysht,
          Y012);
    end if;
  end Model;

  //Calculating the parameters for the MonoxTri interface
  parameter Real[1, 32] Aux=Model(
      ModelType,
      Yser,
      Ysht,
      Y012);
  parameter Real Ar=Aux[1, 1];
  parameter Real Ai=Aux[1, 2];
  parameter Real MB1r=Aux[1, 3];
  parameter Real MB1i=Aux[1, 4];
  parameter Real MB2r=Aux[1, 5];
  parameter Real MB2i=Aux[1, 6];
  parameter Real MB3r=Aux[1, 7];
  parameter Real MB3i=Aux[1, 8];
  parameter Real C1r=Aux[1, 9];
  parameter Real C1i=Aux[1, 10];
  parameter Real C2r=Aux[1, 11];
  parameter Real C2i=Aux[1, 12];
  parameter Real C3r=Aux[1, 13];
  parameter Real C3i=Aux[1, 14];
  parameter Real D11r=Aux[1, 15];
  parameter Real D11i=Aux[1, 16];
  parameter Real D12r=Aux[1, 17];
  parameter Real D12i=Aux[1, 18];
  parameter Real D13r=Aux[1, 19];
  parameter Real D13i=Aux[1, 20];
  parameter Real D21r=Aux[1, 21];
  parameter Real D21i=Aux[1, 22];
  parameter Real D22r=Aux[1, 23];
  parameter Real D22i=Aux[1, 24];
  parameter Real D23r=Aux[1, 25];
  parameter Real D23i=Aux[1, 26];
  parameter Real D31r=Aux[1, 27];
  parameter Real D31i=Aux[1, 28];
  parameter Real D32r=Aux[1, 29];
  parameter Real D32i=Aux[1, 30];
  parameter Real D33r=Aux[1, 31];
  parameter Real D33i=Aux[1, 32];

equation
  // Equations related to the MonoxTri interface
  p.ir = Ar*p.vr - Ai*p.vi + MB1r*A.vr - MB1i*A.vi + MB2r*B.vr - MB2i*B.vi +
    MB3r*C.vr - MB3i*C.vi;
  p.ii = Ar*p.vi + Ai*p.vr + MB1r*A.vi + MB1i*A.vr + MB2r*B.vi + MB2i*B.vr +
    MB3r*C.vi + MB3i*C.vr;
  A.ir = C1r*p.vr - C1i*p.vi + D11r*A.vr - D11i*A.vi + D12r*B.vr - D12i*B.vi +
    D13r*C.vr - D13i*C.vi;
  A.ii = C1r*p.vi + C1i*p.vr + D11r*A.vi + D11i*A.vr + D12r*B.vi + D12i*B.vr +
    D13r*C.vi + D13i*C.vr;
  B.ir = C2r*p.vr - C2i*p.vi + D21r*A.vr - D21i*A.vi + D22r*B.vr - D22i*B.vi +
    D23r*C.vr - D23i*C.vi;
  B.ii = C2r*p.vi + C2i*p.vr + D21r*A.vi + D21i*A.vr + D22r*B.vi + D22i*B.vr +
    D23r*C.vi + D23i*C.vr;
  C.ir = C3r*p.vr - C3i*p.vi + D31r*A.vr - D31i*A.vi + D32r*B.vr - D32i*B.vi +
    D33r*C.vr - D33i*C.vi;
  C.ii = C3r*p.vi + C3i*p.vr + D31r*A.vi + D31i*A.vr + D32r*B.vi + D32i*B.vr +
    D33r*C.vi + D33i*C.vr;

  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Line(points={{-90,0},{-130,0}}, color={0,0,
          255}),Line(points={{90,0},{130,0}}, color={0,0,255}),Line(points={{90,
          0},{110,90},{130,90}}, color={0,0,255}),Line(points={{90,0},{110,-90},
          {130,-90}}, color={0,0,255})}),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1)),
    Documentation(info="<html>
<p>This model was design to represent a hybrid positive-sequence/three-phase power line.<\p> 
<p>The user should input the series conductance and susceptance, and half shunt susceptance (line charging). All in matrix form, since this model can be used to represent unbalanced lines.
Series conductance (Gser) matrix is considered to have the following structure:</p>
<p><b>[Gseraa</b>, <b>Gserab</b>, <b>Gserac</b>; </p>
<p><b> Gserab</b>, <b>Gserbb</b>, <b>Gserbc</b>; </p>
<p><b> Gserac</b>, <b>Gserbc</b>, <b>Gsercc</b>] </p>
<p>Series susceptance (Bser) matrix is considered to have the following structure:</p>
<p><b>[Bseraa</b>, <b>Bserab</b>, <b>Bserac</b>; </p>
<p><b> Bserab</b>, <b>Bserbb</b>, <b>Bserbc</b>; </p>
<p><b> Bserac</b>, <b>Bserbc</b>, <b>Bsercc</b>] </p>
<p>The series admittance matrix is <b>Yser = Gser+jBser</b>. Each of the two shunt susceptance (Bsht) matrices is considered to have the following structure:</p>
<p><b>[Bshtaa</b>, <b>Bshtab</b>, <b>Bshtac</b>; </p>
<p><b> Bshtab</b>, <b>Bshtbb</b>, <b>Bshtbc</b>; </p>
<p><b> Bshtac</b>, <b>Bshtbc</b>, <b>Bshtcc</b>] </p>
<p>In addition to that, the user should also state if the hybrid interface should be calculated in an approximate or exact way.
If the exact way is selected, the user should also input Norton equivalent admittances for positive, negative and zero sequences calculated in the point of interconnection of the hybrid device.
If approximate model is selected, these admittances are set to be zero. 
Based on the set of parameters selected by the user, the pi-equivalent impedance matrices are calculated and the line equation is assembled.</p>
<p>The positive-sequence system is connected using pin <b><i>p</i></b>, while three-phase system is connected using pins <b><i>A</i></b>, <b><i>B</i></b>, and <b><i>C</i></b><\p> 
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
end Line_MT;
