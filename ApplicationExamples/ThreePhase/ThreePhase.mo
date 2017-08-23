package ThreePhase
  package Buses
    model InfiniteBus
      outer OpenIPSL.Electrical.SystemBase SysData "Must add this line in all models";
      parameter Real Vb = 400 "Base voltage of the bus (kV)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real V_A = 1 "Voltage magnitude (pu)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real angle_A = 0 "Voltage angle for phase A (deg)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real V_B = 1 "Voltage magnitude (pu)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real angle_B = -120 "Voltage angle for phase A (deg)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real V_C = 1 "Voltage magnitude (pu)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real angle_C = 120 "Voltage angle for phase A (deg)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real P_A = 1 "Active Power for phase A (MW)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real Q_A = 0 "Reactive Power for phase A (MVAr)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real P_B = 1 "Active Power for phase B (MW)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real Q_B = 0 "Reactive Power for phase B (MVAr)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real P_C = 1 "Active Power for phase C (MW)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real Q_C = 0 "Reactive Power for phase C (MVAr)" annotation(
        Dialog(group = "Power flow data"));
      parameter Real S_b = SysData.S_b "System base power (MVA)" annotation(
        Dialog(group = "Power flow data", enable = false));
      parameter Real fn = SysData.fn "System Frequency (Hz)" annotation(
        Dialog(group = "Power flow data", enable = false));
      OpenIPSL.Interfaces.PwPin p1 annotation(
        Placement(transformation(extent = {{80, 80}, {100, 100}})));
      OpenIPSL.Interfaces.PwPin p2 annotation(
        Placement(transformation(extent = {{80, -10}, {100, 10}})));
      OpenIPSL.Interfaces.PwPin p3 annotation(
        Placement(transformation(extent = {{80, -100}, {100, -80}})));
      Real Pa "Active Power suplyed by the Infinite bus (phase a) (MW)";
      Real Qa "Reactive Power suplyed by the Infinite bus (phase a) (MVAr)";
      Real Pb "Active Power suplyed by the Infinite bus (phase b) (MW)";
      Real Qb "Reactive Power suplyed by the Infinite bus (phase b) (MVAr)";
      Real Pc "Active Power suplyed by the Infinite bus (phase c) (MW)";
      Real Qc "Reactive Power suplyed by the Infinite bus (phase c) (MVAr)";
    equation
// Equations for Phase A
      p1.vr = V_A * cos(angle_A * Modelica.Constants.pi / 180);
      p1.vi = V_A * sin(angle_A * Modelica.Constants.pi / 180);
      Pa = (p1.vr * p1.ir - p1.vi * p1.ii) * S_b / 3;
      Qa = (p1.vr * p1.ii - p1.vi * p1.ir) * S_b / 3;
// Equations for Phase B
      p2.vr = V_B * cos(angle_B * Modelica.Constants.pi / 180);
      p2.vi = V_B * sin(angle_B * Modelica.Constants.pi / 180);
      Pb = (p2.vr * p2.ir - p2.vi * p2.ii) * S_b / 3;
      Qb = (p2.vr * p2.ii - p2.vi * p2.ir) * S_b / 3;
// Equations for Phase C
      p3.vr = V_C * cos(angle_C * Modelica.Constants.pi / 180);
      p3.vi = V_C * sin(angle_C * Modelica.Constants.pi / 180);
      Pc = (p3.vr * p3.ir - p3.vi * p3.ii) * S_b / 3;
      Qc = (p3.vr * p3.ii - p3.vi * p3.ir) * S_b / 3;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid), Line(points = {{34, 86}, {82, 86}, {74, 92}}, color = {0, 0, 0}), Text(extent = {{14, 84}, {102, 38}}, lineColor = {238, 46, 47}, textString = DynamicSelect("0.0", String(P, significantDigits = 2))), Line(points = {{32, -54}, {80, -54}, {72, -48}}, color = {0, 0, 0}), Text(extent = {{12, -54}, {100, -100}}, lineColor = {0, 255, 0}, textString = DynamicSelect("0.0", String(Q, significantDigits = 2))), Line(points = {{40, -48}, {40, -60}}, color = {0, 0, 0}), Line(points = {{80, -54}, {72, -60}}, color = {0, 0, 0}), Line(points = {{82, 86}, {74, 80}}, color = {0, 0, 0})}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
    end InfiniteBus;

    model Bus_3Ph
      import Modelica.Constants.pi;
      OpenIPSL.Interface.PwPin p1(vr(start=V_A*cos(angle_A*Modelica.Constants.pi/180)), vi(start=V_A*sin(angle_A*Modelica.Constants.pi/180)))
        annotation (Placement(transformation(extent={{-10,80},{10,100}})));
      OpenIPSL.Interface.PwPin p2(vr(start=V_B*cos(angle_B*Modelica.Constants.pi/180)), vi(start=V_B*sin(angle_B*Modelica.Constants.pi/180)))
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      OpenIPSL.Interface.PwPin p3(vr(start=V_C*cos(angle_C*Modelica.Constants.pi/180)), vi(start=V_C*sin(angle_C*Modelica.Constants.pi/180)))
        annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
    
      parameter Real V_A=1 "Voltage magnitude for phase A (pu)" annotation (Dialog(group="Power flow data"));
      parameter Real V_B=1 "Voltage magnitude for phase B (pu)" annotation (Dialog(group="Power flow data"));
      parameter Real V_C=1 "Voltage magnitude for phase C (pu)" annotation (Dialog(group="Power flow data"));
      parameter Real angle_A=0 "Voltage angle for phase A (deg)" annotation (Dialog(group="Power flow data"));
      parameter Real angle_B=-120
        "Voltage angle for phase B (deg)"                                              annotation (Dialog(group="Power flow data"));
      parameter Real angle_C= 120
        "Voltage angle for phase C (deg)"                                              annotation (Dialog(group="Power flow data"));    
      Real Va(start=V_A) "Bus voltage magnitude for phase A (pu)";
      Real angle_a(start=angle_A*Modelica.Constants.pi/180) "Bus voltage angle for phase A (deg)";
      Real Vb(start=V_B) "Bus voltage magnitude for phase B (pu)";
      Real angle_b(start=angle_B*Modelica.Constants.pi/180) "Bus voltage angle for phase B (deg)";
      Real Vc(start=V_C) "Bus voltage magnitude for phase C (pu)";
      Real angle_c(start=angle_C*Modelica.Constants.pi/180) "Bus voltage angle for phase C (deg)";
    
    protected
    
      Real[1, 6] Vin=[p1.vr, p1.vi, p2.vr, p2.vi, p3.vr, p3.vi]; 
    
    equation
      Va = sqrt(Vin[1,1]^2 + Vin[1,2]^2);
      angle_a = atan2(Vin[1,2], Vin[1,1])*180/Modelica.Constants.pi;
      Vb = sqrt(Vin[1,3]^2 + Vin[1,4]^2);
      angle_b = atan2(Vin[1,4], Vin[1,3])*180/Modelica.Constants.pi;
      Vc = sqrt(Vin[1,5]^2 + Vin[1,6]^2);
      angle_c = atan2(Vin[1,6], Vin[1,5])*180/Modelica.Constants.pi;
      p1.ir = 0;
      p1.ii = 0;
      p2.ir = 0;
      p2.ii = 0;
      p3.ir = 0;
      p3.ii = 0;
    
      annotation (
       Icon(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=true,
            initialScale=0.1,
            grid={2,2}), graphics={Rectangle(
              visible=true,
              fillPattern=FillPattern.Solid,
              extent={{-10.0,-100.0},{10.0,100.0}}),Text(
              visible=true,
              origin={0.9738,119.0625},
              fillPattern=FillPattern.Solid,
              extent={{-39.0262,-16.7966},{39.0262,16.7966}},
              textString="%name",
              fontName="Arial"),Text(
              origin={0.9738,-114.937},
              fillPattern=FillPattern.Solid,
              extent={{-39.0262,-16.7966},{39.0262,16.7966}},
              fontName="Arial",
              textString=DynamicSelect("0.0","%Va"),
              lineColor={238,46,47}),Text(
              origin={0.9738,-140.937},
              fillPattern=FillPattern.Solid,
              extent={{-39.0262,-16.7966},{39.0262,16.7966}},
              fontName="Arial",
              textString=DynamicSelect("0.0", String(Vb,significantDigits=3)),
              lineColor={238,46,47})}));
    end Bus_3Ph;




  end Buses;
end ThreePhase;
