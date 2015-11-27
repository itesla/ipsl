within iPSL.Electrical.Controls.Eurostag;
model GOVER1 "Steam turbine governor. Developed by AIA. 2013"
  parameter Real init_Integrator;
  parameter Real init_LeadLag;
  Modelica.Blocks.Sources.Constant imSetPoint(k=0)
    annotation (Placement(transformation(extent={{-92,22},{-74,40}})));
  Modelica.Blocks.Continuous.LimIntegrator           imLimitedIntegrator(outMin = 0, k = 1, outMax = 1.1, y_start = init_Integrator) annotation(Placement(transformation(extent={{-52,22},
            {-34,40}})));
  Modelica.Blocks.Sources.Constant imSetPoint1(k=25)
    annotation (Placement(transformation(extent={{-52,-38},{-30,-16}})));
  iPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T2=10,
    T1=3,
    y_start=init_LeadLag)
    annotation (Placement(transformation(extent={{40,2},{58,20}})));
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA annotation(Placement(transformation(extent = {{-81, 0}, {-61, 20}}), iconTransformation(extent = {{-81, 0}, {-61, 20}})));
  Modelica.Blocks.Interfaces.RealOutput pin_CM annotation(Placement(transformation(extent = {{79, 0}, {98, 20}}), iconTransformation(extent = {{79, 0}, {99, 20}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-25)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
equation
  connect(imSetPoint.y, imLimitedIntegrator.u) annotation (Line(points={{-73.1,31},
          {-63.55,31},{-63.55,31},{-53.8,31}}, color={0,0,127}));
  connect(imLimitedIntegrator.y, add3_1.u1) annotation (Line(points={{-33.1,31},
          {-22,31},{-22,18},{-12,18}}, color={0,0,127}));
  connect(add3_1.u2, pin_OMEGA)
    annotation (Line(points={{-12,10},{-40,10},{-71,10}}, color={0,0,127}));
  connect(add3_1.u3, imSetPoint1.y) annotation (Line(points={{-12,2},{-20,2},{
          -20,-27},{-28.9,-27}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u)
    annotation (Line(points={{11,10},{38.2,10},{38.2,11}}, color={0,0,127}));
  connect(imLeadLag.y, pin_CM) annotation (Line(points={{58.9,11},{70.45,11},{
          70.45,10},{88.5,10}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
            -100},{100,100}})), Icon(graphics={  Rectangle(extent=  {{-60, 60}, {80, -40}}, lineColor=  {0, 0, 255}), Text(extent=  {{-40, -2}, {56, 24}}, lineColor=  {0, 0, 255}, textString=  "GOVER1")}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end GOVER1;
