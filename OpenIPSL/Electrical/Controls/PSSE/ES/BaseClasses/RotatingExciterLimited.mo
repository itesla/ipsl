within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterLimited
  extends RotatingExciter(redeclare Modelica.Blocks.Continuous.LimIntegrator integrator(outMin=0, outMax=Modelica.Constants.inf));
  annotation (Icon(graphics={Text(
          extent={{-56,56},{52,44}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Limited")}));
end RotatingExciterLimited;
