within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model AccelerationLimiter
  "GE General GGOV1 and GGOV1DU Governor Acceleration Control"
  parameter Types.PerUnit Ka=10 "Acceleration limiter gain";
  parameter Types.Time Ta=0.1 "Acceleration limiter time constant";
  parameter Types.Time DELT=0.005 "Time step used in simulation";
  Modelica.Blocks.Math.Gain Acceleration(k=Ka*DELT) annotation (Placement(transformation(extent={{14,-12},{38,12}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{66,-14},{84,4}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{-124,-78},{-92,-46}}), iconTransformation(extent={{-118,-64},{-92,-38}})));
  Modelica.Blocks.Continuous.Derivative s8(
    k=1,
    T=Ta,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-76,-26},{-50,0}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
protected
  parameter Types.PerUnit s80(fixed=false);
public
  Modelica.Blocks.Interfaces.RealInput ASET
    "Acceleration limiter setpoint (p.u./s)"
    annotation (Placement(transformation(extent={{-124,32},{-92,64}}), iconTransformation(extent={{-118,38},{-92,64}})));
  Modelica.Blocks.Interfaces.RealOutput FSRA
    "Acceleration Controller Output"
    annotation (Placement(transformation(extent={{100,38},{122,60}}), iconTransformation(extent={{100,38},{122,60}})));
  Modelica.Blocks.Interfaces.RealInput FSR annotation (Placement(transformation(extent={{126,-70},{94,-38}}), iconTransformation(extent={{118,-62},{94,-38}})));
initial equation
  s80 = 0;

equation
  connect(Acceleration.y, add.u1) annotation (Line(
      points={{39.2,0},{34,0},{34,0.4},{64.2,0.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s8.y, add1.u2) annotation (Line(
      points={{-48.7,-13},{-40,-13},{-40,-6},{-28,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Acceleration.u, add1.y) annotation (Line(
      points={{11.6,0},{-5,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, ASET) annotation (Line(points={{-28,6},{-44,6},{-44,48},{-108,48}}, color={0,0,127}));
  connect(s8.u, SPEED) annotation (Line(points={{-78.6,-13},{-87.3,-13},{-87.3,-62},{-108,-62}}, color={0,0,127}));
  connect(add.u2, FSR) annotation (Line(points={{64.2,-10.4},{52,-10.4},{52,-54},{110,-54}}, color={0,0,127}));
  connect(add.y, FSRA) annotation (Line(points={{84.9,-5},{90.45,-5},{90.45,49},{111,49}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
                    extent={{-50,-26},{-40,-34}},
                    lineColor={255,0,0},
                    textString="s8")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),Text(
                    extent={{-90,62},{-58,40}},
                    lineColor={28,108,200},
                    textString="ASET"),Text(
                    extent={{-62,46},{68,-46}},
                    lineColor={28,108,200},
                    textString="Acceleration
Limiter"),Text(               extent={{-88,-40},{-52,-64}},
                    lineColor={28,108,200},
                    textString="SPEED"),Text(
                    extent={{64,60},{96,38}},
                    lineColor={28,108,200},
                    textString="FSRA"),Text(
                    extent={{68,-42},{92,-58}},
                    lineColor={28,108,200},
                    textString="FSR")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS/E Manual</p></td>
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
<td><p>Acceleration control system for the general purpose Turbine/Governor models GGOV1 and GGOV1DU.</p></td>
</tr>
</table>
</html>"));
end AccelerationLimiter;