within ThreePhase.Loads;
model Dyn_wye_3Ph_balanced
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.Blocks.Interfaces.*;
  parameter SI.ApparentPower Sn(displayUnit="MVA")=SysData.S_b
    "System base power"
    annotation (Dialog(group="Power flow"));
  Modelica.Blocks.Interfaces.RealInput P_in "external P (pu)" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-120,20},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-60,20},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Q_in "external Q (pu)" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-120,-40},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-60,-60},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  OpenIPSL.Interfaces.PwPin A annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={-4,70},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={159,100},
        rotation=0),
      visible=true));
  OpenIPSL.Interfaces.PwPin B annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={46,70},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100},
        rotation=0),
      visible=true));
  OpenIPSL.Interfaces.PwPin C annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={96,70},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={-19,100},
        rotation=0),
      visible=true));
  parameter SI.ActivePower P0(displayUnit="MW") "Initial Active power(MW)"
    annotation (Dialog(group="Power flow"));
  parameter SI.ReactivePower Q0(displayUnit="Mvar") "Initial Reactive power (MVAr)"
    annotation (Dialog(group="Power flow"));

protected
  SI.ActivePower P_a(displayUnit="MW", start = P0 / 3)
    "Initial active power";
  SI.ReactivePower Q_a(displayUnit="Mvar", start = Q0  / 3)
    "Initial reactive power";
  SI.ActivePower P_b(displayUnit="MW", start = P0 / 3)
    "Initial active power";
  SI.ReactivePower Q_b(displayUnit="Mvar", start = Q0 / 3)
    "Initial reactive power";
  SI.ActivePower P_c(displayUnit="MW", start = P0 / 3)
    "Initial active power";
  SI.ReactivePower Q_c(displayUnit="Mvar", start = Q0 / 3)
    "Initial reactive power";

equation
  P_a = P_in * Sn / 3;
  P_b = P_in * Sn / 3;
  P_c = P_in * Sn / 3;
  Q_a = Q_in * Sn / 3;
  Q_b = Q_in * Sn / 3;
  Q_c = Q_in * Sn / 3;

  P_a = (A.vr*A.ir + A.vi*A.ii)*Sn;
  Q_a = (A.vi*A.ir - A.vr*A.ii)*Sn;
  P_b = (B.vr*B.ir + B.vi*B.ii)*Sn;
  Q_b = (B.vi*B.ir - B.vr*B.ii)*Sn;
  P_c = (C.vr*C.ir + C.vi*C.ii)*Sn;
  Q_c = (C.vi*C.ir - C.vr*C.ii)*Sn;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, initialScale=0.1),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          lineColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Dynamic Load"),Text(
          origin={20,6},
          lineColor={28,108,200},
          extent={{-62,45},{22,30}},
          textString="PQ Load")}),
    Documentation);
end Dyn_wye_3Ph_balanced;
