within OpenIPSL.Electrical.Controls.PSAT.OEL;
model FieldCurrent
  Modelica.Blocks.Interfaces.RealInput v "generator terminal voltage"
    annotation (Placement(transformation(extent={{-82,32},{-62,52}}),
        iconTransformation(extent={{-82,32},{-50,66}})));
  Modelica.Blocks.Interfaces.RealInput p "active power " annotation (Placement(
        transformation(extent={{-82,-4},{-62,16}}), iconTransformation(extent={
            {-82,-10},{-48,24}})));
  Modelica.Blocks.Interfaces.RealInput q "reactive power" annotation (Placement(
        transformation(extent={{-82,-38},{-62,-18}}), iconTransformation(extent
          ={{-82,-54},{-48,-20}})));
  Modelica.Blocks.Interfaces.RealOutput ifield annotation (Placement(
        transformation(extent={{58,4},{78,24}}), iconTransformation(extent={{58,
            -10},{90,24}})));
  parameter Real xd;
  parameter Real xq;
  Real gamap;
  Real gamaq;
equation
  gamap = xq*p/v;
  gamaq = xq*q/v;
  ifield = sqrt((v + gamaq)^2 + p^2) + (xd/xq + 1)*(gamaq*(v + gamaq) + gamap)/
    sqrt((v + gamaq)^2 + p^2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-48,66},{60,-52}}, lineColor={
          0,0,255}),Text(
          extent={{-52,62},{-20,42}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="v"),Text(
          extent={{-48,14},{-20,-2}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="p"),Text(
          extent={{-50,-28},{-22,-44}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="q"),Text(
          extent={{36,12},{64,-4}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="if")}),
    Documentation);
end FieldCurrent;
