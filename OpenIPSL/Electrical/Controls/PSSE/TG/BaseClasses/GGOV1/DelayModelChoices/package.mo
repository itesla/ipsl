within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
package DelayModelChoices "Provides choices for delay models to use either in simulation (Fixed Delay or Pade Approximation) or in linearization (Pade Approximation)"
  model FixedDelay "Extended Fixed Delay Model from the MSL"
    extends Modelica.Blocks.Nonlinear.FixedDelay(delayTime = Teng);
    extends DelayModelChoices.Interface;
  end FixedDelay;

annotation (Icon(graphics={
      Rectangle(
        extent={{-100,100},{100,-100}},
        lineColor={244,125,35},
        lineThickness=1,
        fillColor={244,125,35},
        fillPattern=FillPattern.Solid),
      Ellipse(
        extent={{-50,100},{50,2}},
        lineColor={244,125,35},
        lineThickness=1,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Ellipse(
        extent={{-52,0},{48,-98}},
        lineColor={244,125,35},
        lineThickness=1,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Ellipse(
        extent={{-40,92},{40,12}},
        lineColor={215,215,215},
        lineThickness=1,
        fillColor={255,170,85},
        fillPattern=FillPattern.Solid)}));
end DelayModelChoices;
