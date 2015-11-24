within iPSL.Electrical.Branches;
model PwLine_Bis "Model for a transmission Line based on the pi-equivalent circuit 
  with explicit equations for currents. Developed by RTE. 2014/12/16"

  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-10},
            {-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-10},
            {80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  parameter Real R "Resistance p.u.";
  parameter Real X "Reactance p.u.";
  parameter Real G "Shunt half conductance p.u.";
  parameter Real B "Shunt half susceptance p.u.";
protected
  parameter Real Y=1/sqrt(R*R+X*X);
  parameter Real angle = atan2(R,X);
  parameter Real A=Y*sin(angle)+G;
  parameter Real A1=-B+Y*cos(angle);
  parameter Real A2=-Y*sin(angle);
  parameter Real A3=-Y*cos(angle);
  parameter Real A4=Y*cos(angle);
  parameter Real A5=-Y*sin(angle);
  parameter Real A6=B-Y*cos(angle);
  parameter Real A7=Y*sin(angle)+G;
equation
  n.ir=A*n.vr + A1*n.vi + A2*p.vr + A3*p.vi;
  n.ii=A6*n.vr + A7*n.vi + A4*p.vr + A2*p.vi;
  p.ir=A5*n.vr + A3*n.vi + A*p.vr + A1*p.vi;
  p.ii=A4*n.vr + A5*n.vi + A6*p.vr + A7*p.vi;

  annotation (Icon(graphics={Rectangle(extent={{
              -60,40},{60,-42}}, lineColor={0,0,255}), Rectangle(
          extent={{-40,10},{40,-10}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid)}),
                             Diagram(graphics),
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
end PwLine_Bis;
