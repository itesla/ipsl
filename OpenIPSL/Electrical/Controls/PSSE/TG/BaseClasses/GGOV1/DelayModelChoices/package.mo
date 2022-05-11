within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
package DelayModelChoices "Provides choices for delay models to use either in simulation (Fixed Delay or Pade Approximation) or in linearization (Pade Approximation)"
  model FixedDelay "Extended Fixed Delay Model from the MSL"
    extends Modelica.Blocks.Nonlinear.FixedDelay(delayTime = Teng);
    extends DelayModelChoices.Interface;
  annotation (Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-05-11</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>
       <a href=\"https://github.com/lvanfretti\">@lvanfretti</a>
    </p>
</td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>
", info="<html>
<p>This model extends the Fixed Delay model from the MSL, and it extends the &quot;Interface&quot; model, so that the delay models can be repleaceable while keeping default parameters.</p>
</html>"));
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
