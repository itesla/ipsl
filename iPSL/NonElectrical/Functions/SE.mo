within iPSL.NonElectrical.Functions;
function SE "Scaled Quadratic Saturation Function (PTI PSS/E) "
  extends Modelica.Icons.Function;
  input Real u "Unsaturated Input";
  input Real SE1;
  input Real SE2;
  input Real E1;
  input Real E2;
  output Real sys "Saturated Output";
protected
  parameter Real a=if (SE2 <> 0) then sqrt(SE1*E1/(SE2*E2)) else 0;
  parameter Real A=E2 - (E1 - E2)/(a - 1);
  parameter Real B=SE2*E2*(a - 1)^2/(E1 - E2)^2;
algorithm
  if SE1 == 0.0 or u <= 0.0 then
    sys := 0.0;
  else
    if u <= A then
      sys := 0.0;
    else
      sys := B*(u - A)^2/u;
    end if;
  end if;
  annotation (Documentation(info="<html>
</html>", revisions="<!--DISCLAIMER-->
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
end SE;
