within iPSL.NonElectrical.Functions;
function SE_exp "Exponential Saturation Function (PTI PSS/E) "
  extends Modelica.Icons.Function;
  input Real u "Unsaturated Input";
  input Real S_EE_1 "Saturation factor at point E_1";
  input Real S_EE_2 "Saturation factor at point E_2";
  input Real E_1 "First saturation point";
  input Real E_2 "Second saturation point";
  output Real sys "Saturated Output";
protected
  parameter Real X=log(S_EE_2/S_EE_1)/log(E_2);
algorithm
  sys := S_EE_1*u^X;
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
end SE_exp;
