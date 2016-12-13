within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses;
partial model BaseGovernor

  Modelica.Blocks.Interfaces.RealInput SPEED
    annotation (Placement(transformation(extent={{-120,30},{-80,70}})));
  Modelica.Blocks.Interfaces.RealInput PMECH0
    annotation (Placement(transformation(extent={{-120,-70},{-80,-30}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end BaseGovernor;
