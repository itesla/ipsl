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
  annotation (Documentation(info="", revisions="<!--DISCLAIMER-->
<html>
<p>Copyright 2015 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<p>​- ​RTE: http://www.rte-france.com/</p>
<p>- SmarTS Lab, research group at KTH: https://www.kth.se/en</p>
<p>​- ​AIA: http://www.aia.es/en/energy/</p>
<p>​- ​DTU: http://www.dtu.dk/english</p>
<p>The authors can be contacted by email: info@itesla-ipsl.org </p>
<p>​</p>
<p>​​This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.</p>
</html>"));
end TransformerParameter;
