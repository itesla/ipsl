within iPSL.Connectors;
connector PwPin "connector for electrical blocks treating voltage and current as complex variables"
  Real vr;
  // real part of the voltage
  Real vi;
  // imaginary part of the voltage
  flow Real ir;
  // real part of the current
  flow Real ii;
  // imaginary part of the current
  annotation (Icon(graphics={Rectangle(
          extent={{-100,98},{100,-102}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}), Documentation(revisions="<!--DISCLAIMER-->
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
end PwPin;
