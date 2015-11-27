within iPSL.NonElectrical.Continuous;
model ImIntegrator_adpt "Special block for SCRX"

  Modelica.Blocks.Interfaces.RealInput p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent={{-61,-10},
            {-44,8}})));
  Modelica.Blocks.Interfaces.RealOutput VE(start = nStartValue) annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real TE;
  parameter Real VFEMAX;
  parameter Real KD;
  parameter Real KE;
   parameter Real E1=4;
   parameter Real SE1=0.4;
   parameter Real E2=5;
   parameter Real SE2=0.5;
  parameter Real nStartValue "Output start value";
  Modelica.Blocks.Interfaces.RealInput IFD
    annotation (Placement(transformation(extent={{-70,-66},{-38,-34}}),
        iconTransformation(extent={{-58,-60},{-40,-42}})));
    Real VE_up;
    Real n1;
initial equation
  n1=nStartValue;
equation
  if n1<VE_up and n1>0 then
  TE*der(n1) =  p1;
  elseif n1>=VE_up and p1>0 then
    der(n1)=0;
  elseif n1<=0 and p1<0 then
    der(n1)=0;
  else
    TE*der(n1) =  p1;
  end if;

  if n1<VE_up and n1>0 then
    VE=n1;
  elseif n1>VE_up then
    VE=VE_up;
  else
    VE=0;
  end if;

  VE_up = (VFEMAX - KD*IFD)/(KE + iPSL.NonElectrical.Functions.SE(
    VE,
    SE1,
    SE2,
    E1,
    E2));
  annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
            -100},{100,100}}),
                  graphics={  Rectangle(extent={{-42,72},{40,-72}},      lineColor=  {0, 0, 255}), Text(extent={{
              -4,-4},{14,-22}},                                                                                                    lineColor=
              {0,0,255},
          textString="TE"),                                                                                                    Text(extent={{
              -20,-2},{-4,-20}},                                                                                                    lineColor=  {0, 0, 255}, textString=  "s"), Line(points={{
              -30,0},{26,0}},                                                                                                    color=  {0, 0, 255}, smooth=  Smooth.Bezier),
                                                                                        Text(extent={{
              -32,-42},{-14,-60}},                                                                                                    lineColor=
              {0,0,255},
          textString="IFD"),                                                                       Text(extent={{
              -12,20},{6,2}},                                                                                                    lineColor=
              {0,0,255},
          textString="1"),                                                                         Text(extent={{
              24,18},{42,8}},                                                                                                    lineColor=
              {0,0,255},
          textString="VE"),
        Line(
          points={{-36,-28},{-10,-28},{2,30},{26,30}},
          color={0,0,255},
          smooth=Smooth.None)}),                                                                                                    Diagram(
        coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),                                                                                                    graphics),
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
end ImIntegrator_adpt;
