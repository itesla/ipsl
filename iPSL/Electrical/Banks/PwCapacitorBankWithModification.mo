within iPSL.Electrical.Banks;
model PwCapacitorBankWithModification "Capacitor Bank with Bank modification at time t1.
              2014/03/10"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{0,60},{
            20,80}}), iconTransformation(extent={{0,60},{20,80}})));
  parameter Real nsteps "number of steps";
  parameter Real Go "active losses (pu) in each element";
  parameter Real Bo "reactive power (pu) in each element";
  parameter Real t1 "time for Bank Modification";
  parameter Real nmod "number of step to switch on/off (+/-)";
  Real G;
  Real B;
  Real nt;
equation
  if time > t1 then
    nt = nsteps + nmod;
  else
    nt = nsteps;
  end if;
  G = nt * Go;
  B = nt * Bo;
  p.vr = (p.ir * G + p.ii * B) / (G * G + B * B);
  p.vi = ((-p.ir * B) + p.ii * G) / (G * G + B * B);
  annotation(Icon(graphics={  Rectangle(extent=  {{-40, 60}, {60, -40}}, lineColor=  {0, 0, 255}), Line(points=  {{10, 50}, {10, 34}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-14, 22}, {36, 22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-14, 34}, {36, 34}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{10, 22}, {10, 6}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-14, -6}, {36, -6}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-14, 6}, {36, 6}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{10, -6}, {10, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-16, -22}, {40, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-18, -30}, {-10, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-10, -30}, {-2, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{-2, -30}, {6, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{6, -30}, {14, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{14, -30}, {22, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{22, -30}, {30, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None), Line(points=  {{30, -30}, {38, -22}}, color=  {0, 0, 255}, smooth=  Smooth.None)}),
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
end PwCapacitorBankWithModification;
