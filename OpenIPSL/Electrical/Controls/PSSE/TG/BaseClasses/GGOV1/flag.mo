within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
block flag "Flag to determine if fluid flow depends on speed"
  parameter Integer flag;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-12},{120,8}})));
  Modelica.Blocks.Interfaces.RealInput speed annotation (Placement(
        transformation(extent={{6,-136},{46,-96}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        origin={-120,-2})));
equation
  y = if flag == 1 then speed + 1 else 1;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-51,31},{51,-31}},
          lineColor={0,0,255},
          horizontalAlignment=TextAlignment.Left,
          origin={1,5},
          rotation=360,
          textString="Flag"),Rectangle(extent={{-98,90},{96,-92}}, lineColor={0,
          0,255})}),
    Documentation(info="<html>
<p>The following documentation is adapted from 
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>
This flag is used to determine if the fluid flow depends on the speed of the machine. 
Gas turbines have fluid flow independent from speed and thus the flag should be set to 0.
Diesel engines on the other hand have teir fluid flow proportional on the speed. In this case, the flag should be set to 1.
</p>
</blockquote>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-22</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a></p></td>
<td><p><a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end flag;
