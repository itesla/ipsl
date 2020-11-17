within OpenIPSL.Electrical.Controls.CGMES.TG;
class GovHydroIEEE0
  parameter Real K=5 "Governor gain";
  parameter SI.Time T1=0.25 "Governor lag time constant";
  parameter SI.Time T2=0 "Governor lead time constant";
  parameter SI.Time T3=0.1 "Gate actuator time constant";
  parameter SI.Time T4=0.04 "Water starting time";
  parameter SI.PerUnit Pmax=1.5 "Gate maximum";
  parameter SI.PerUnit Pmin=0.5 "Gate minimum";
  NonElectrical.Continuous.LeadLag GovernorA(
    K=K,
    T1=T2,
    T2=T1,
    y_start=0) annotation (Placement(visible=true, transformation(
        origin={-70,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Add difference(k2=-1) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Continuous.TransferFunction GovernorB(a={T3,1}, b={1}) annotation (Placement(visible=true, transformation(
        origin={-40,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Continuous.TransferFunction waterway(
    a={0.5*T4,1},
    b={-T4,1},
    y_start=0) "Turbine and Waterway transferfunction" annotation (Placement(visible=true, transformation(
        origin={74,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Pmax, uMin=Pmin) annotation (Placement(visible=true, transformation(
        origin={40,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
      visible=true,
      transformation(
        origin={-120,0},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-120,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
      visible=true,
      transformation(
        origin={-120,80},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-120,80},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput PMECH annotation (Placement(
      visible=true,
      transformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={110,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(waterway.y, PMECH) annotation (Line(points={{85,0},{102,0},{102,0},{110,0}}, color={0,0,127}));
  connect(limiter.y, waterway.u) annotation (Line(points={{51,0},{60,0},{60,0},{62,0}}, color={0,0,127}));
  connect(difference.y, limiter.u) annotation (Line(points={{11,0},{28,0}}, color={0,0,127}));
  connect(GovernorB.y, difference.u2) annotation (Line(points={{-29,0},{-20,0},{-20,-6},{-12,-6}}, color={0,0,127}));
  connect(GovernorA.y, GovernorB.u) annotation (Line(points={{-59,0},{-52,0}}, color={0,0,127}));
  connect(SPEED, GovernorA.u) annotation (Line(points={{-120,0},{-82,0}}, color={0,0,127}));
  connect(Pref, difference.u1) annotation (Line(points={{-120,80},{-20,80},{-20,6},{-12,6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(
        grid={2,2},
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Text(
          origin={-48,-48.1255},
          extent={{128,-31.8745},{-32,8.12498}},
          lineColor={0,0,255},
          textString="GovHydroIEEE0"),
        Text(
          origin={-47.3531,83.5},
          extent={{7.35303,-13.5},{-42.6469,6.5}},
          fontName="Andalus",
          textString="Pref",
          lineColor={28,108,200}),
        Text(
          origin={-38.8241,2.85},
          extent={{8.82407,-14.85},{-51.1759,7.15}},
          fontName="Andalus",
          textString="SPEED",
          lineColor={28,108,200}),
        Text(
          origin={74.225,2.85},
          extent={{16.775,-14.85},{-44.225,7.15}},
          fontName="Andalus",
          textString="PMECH",
          lineColor={28,108,200}),
        Rectangle(
          origin={0,0},
          lineThickness=2,
          borderPattern=BorderPattern.Raised,
          extent={{-100,100},{100,-100}})}),
                                           uses(OpenIPSL(version="0.8.1"), Modelica(version="3.2.1")),
 Documentation(info="<html>
<p>This diagram is supplied to document the CIM interpretation of the 
model given in <a href=\"modelica://OpenIPSL.UsersGuide.References\">[IEEE1973]</a>.
</p>
</html>",
        revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>CGMES</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-17</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/dietmarw\">@dietmarw</a>, 
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a>
       (original: Mengjia Zhang, SmarTS Lab)</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>
"), Diagram(coordinateSystem(preserveAspectRatio=false, grid={2,2})));
end GovHydroIEEE0;
