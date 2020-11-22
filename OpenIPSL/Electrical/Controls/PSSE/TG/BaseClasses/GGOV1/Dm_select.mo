within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
block Dm_select
  "Representation of the variation of maximum power capability with shaft speed"
  parameter Real Dm;
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-12},{120,8}})));
  Modelica.Blocks.Interfaces.RealInput speed annotation (Placement(
        transformation(extent={{6,-136},{46,-96}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        origin={-120,-2})));
equation
  y = if Dm >= 0 then speed + 1 else (speed + 1)^Dm;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-51,31},{51,-31}},
          lineColor={0,0,255},
          horizontalAlignment=TextAlignment.Left,
          origin={1,5},
          rotation=360,
          textString="Dm_select"),Rectangle(extent={{-98,90},{96,-92}},
          lineColor={0,0,255})}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>Flag</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>November 2020</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:vanfrl@rpi.edu\">vanfrl@rpi.edu</a></p></td>
</tr>
<tr>
<td><p>Description</p></td>
<td><p>This variable is used to represent the variation of the maximum power capability or maximum engine power with shaft speed.
If Dm is positive it describes a lower maximum power output as speed increases. This is characteristic of some engines and aeroderivative turbines.
If Dm is negative the maximum fuel flow is considered to decrease as speed increases. This is common on single shaft gas turbines. </p></td>
</tr>
</table>
</html>"));
end Dm_select;
