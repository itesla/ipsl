within ThreePhase.Banks;

model CapacitorBank_3Ph "Three-Phase Capacitor Bank"
  outer OpenIPSL.Electrical.SystemBase SysData;

  parameter Real Sn = SysData.S_b "Power rating (MVA)";
  OpenIPSL.Interfaces.PwPin A annotation(Placement(transformation(extent = {{80.0, 0.0}, {100.0, 20.0}}, origin = {0.0, 0.0}, rotation = 0), iconTransformation(extent = {{-80.0, 0.0}, {-60.0, 20.0}}, origin = {159, 100}, rotation = 0), visible = true));
  OpenIPSL.Interfaces.PwPin B annotation(Placement(transformation(extent = {{-10.0, 0.0}, {10.0, 20.0}}, origin = {0.0, 0.0}, rotation = 0), iconTransformation(extent = {{-80.0, 0.0}, {-60.0, 20.0}}, origin = {70, 100}, rotation = 0), visible = true));
  OpenIPSL.Interfaces.PwPin C annotation(Placement(transformation(extent = {{-100.0, 0.0}, {-80.0, 20.0}}, origin = {0.0, 0.0}, rotation = 0), iconTransformation(extent = {{-80.0, 0.0}, {-60.0, 20.0}}, origin = {-19, 100}, rotation = 0), visible = true));

  parameter Real Q_a "Reactive power for phase A (MVAr)"
                                                        annotation (Dialog(group="Power flow"));
  parameter Real Q_b "Reactive power for phase B (MVAr)"
                                                        annotation (Dialog(group="Power flow"));
  parameter Real Q_c "Reactive power for phase C (MVAr)"
                                                        annotation (Dialog(group="Power flow"));
                                                        
  Real Pa = 0;
  Real Pb = 0;
  Real Pc = 0;
  Real Qa = Q_a/(Sn/3);
  Real Qb = Q_b/(Sn/3);
  Real Qc = Q_c/(Sn/3);
equation
  Pa = (A.vr*A.ir + A.vi*A.ii);
  Pb = (B.vr*B.ir + B.vi*B.ii);
  Pc = (C.vr*C.ir + C.vi*C.ii);
  Qa = (-A.vi*A.ir + A.vr*A.ii)/((A.vr)^2+(A.vi)^2);
  Qb = (-B.vi*B.ir + B.vr*B.ii)/((B.vr)^2+(B.vi)^2);
  Qc = (-C.vi*C.ir + C.vr*C.ii)/((C.vr)^2+(C.vi)^2);
  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{0,70},{0,54}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40, 42},{40,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,54},{40,54}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,42},{0,14}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,2},{40,2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,14},{40,14}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,2},{0,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-38,-22},{38,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-28,-30},{-20,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-20,-30},{-12,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-30},{-4,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-4,-30},{4,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{4,-30},{12,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{12,-30},{20,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{20,-30},{28,-22}},
          color={0,0,255},
          smooth=Smooth.None)}));
end CapacitorBank_3Ph;