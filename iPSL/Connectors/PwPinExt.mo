within iPSL.Connectors;
expandable connector PwPinExt "connector for electrical blocks treating voltage and current as complex variables"
  iPSL.Connectors.PwPin p;
  annotation (
    defaultComponentName="u",
    Icon(graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid)}, coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        initialScale=0.2)),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        initialScale=0.2,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={Text(
          extent={{-10,85},{-10,60}},
          lineColor={0,0,127},
          textString="%name"),Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,127},
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
Connector of type V, I.
</p>
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
end PwPinExt;
