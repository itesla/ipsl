within Nordic44.Components_subsystems;
class PwLine_2KTH "Model for a transmission Line based on the pi-equivalent circuit 
  with explicit equations for currents. Developed by RTE. 2014/12/16"

  PowerSystems.Connectors.PwPin p
          annotation (Placement(transformation(extent={{-80,-10},{-60,10}}),
        iconTransformation(extent={{-80,-10},{-60,10}})));
  PowerSystems.Connectors.PwPin n
          annotation (Placement(transformation(extent={{60,-10},{80,10}}),
        iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
protected
  parameter Real Y=1/sqrt(R*R+X*X);
  parameter Real angle = atan2(R,X);
  parameter Real A=Y*sin(angle)+G;
  parameter Real A1=-B+Y*cos(angle);
  parameter Real A2=-Y*sin(angle);
  parameter Real A3=-Y*cos(angle);
  parameter Real A4=Y*cos(angle);
  parameter Real A5=-Y*sin(angle);
  parameter Real A6=B-Y*cos(angle);
  parameter Real A7=Y*sin(angle)+G;
equation
  n.ir=A*n.vr + A1*n.vi + A2*p.vr + A3*p.vi;
  n.ii=A6*n.vr + A7*n.vi + A4*p.vr + A2*p.vi;
  p.ir=A5*n.vr + A3*n.vi + A*p.vr + A1*p.vi;
  p.ii=A4*n.vr + A5*n.vi + A6*p.vr + A7*p.vi;

  annotation (Icon(graphics={Rectangle(extent={{
              -60,40},{60,-42}}, lineColor={0,0,255}), Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}),
                             Diagram(graphics));
end PwLine_2KTH;
