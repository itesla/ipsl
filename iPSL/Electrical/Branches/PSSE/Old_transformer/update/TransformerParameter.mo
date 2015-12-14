within iPSL.Electrical.Branches.PSSE.Old_transformer.update;


model TransformerParameter "Basic Two Winding Transformer"
  constant Real pi=Modelica.Constants.pi;
  parameter Real R "Resistance p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real X "Reactance p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real G "Magnetizing impedance on From side p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real B "Magnetizing impedance on From side p.u." annotation (Dialog(group=" The measured impedance across the windings"));
  parameter Real ti "From side winding tap ratio" annotation (Dialog(group=" Norminal turns ratio"));
  parameter Real tj "To side winding tap ratio" annotation (Dialog(group=" Norminal turns ratio"));
  //parameter Real phase " From side and To side phase shift in degree";
  //protected
  // parameter Real A = (-phase * pi / 180) + 0.5 * pi;
  parameter Real Req=tj^2*R "Equivalent impedance is always transfered to the 'To' side circuit";
  parameter Real Xeq=tj^2*X "Equivalent impedance is always transfered to the 'To' side circuit";
  annotation (Documentation(info="<html>
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
end TransformerParameter;
