within OpenIPSL.Examples;
package Tutorial "OpenIPSL tutorial for beginners."
  extends Modelica.Icons.ExamplesPackage;

annotation (
  Icon(graphics={
      Rectangle(
        extent={{-80,100},{100,-80}},
        lineColor={0,0,0},
        fillColor={215,230,240},
        fillPattern=FillPattern.Solid),
      Rectangle(
        extent={{-100,80},{80,-100}},
        lineColor={0,0,0},
        fillColor={240,240,240},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{-48,50},{52,-10},{-48,-70},{-48,50}},
        lineColor={0,0,255},
        pattern=LinePattern.None,
        fillColor={95,95,95},
        fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>This tutorial is designed to present the basics of the OpenIPSL for beginners that are starting to use the library.</p> 
<p>It is composed by three simple examples that are meant to cover the principles of power system modeling using 
Modelica and the models available in OpenIPSL, while exploring common power system test cases.</p>
</html>"));
end Tutorial;
