within iPSL.Electrical.Loads.PSAT.BaseClasses;
partial model baseLoad
  import Modelica.Constants.pi;
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real Sn=S_b "Power rating (MVA)";
  iPSL.Connectors.PwPin p annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={0.0,0.0},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100},
        rotation=0),
      visible=true));
  Real V "Voltage magnitude (pu)";
  Real Angle_V "voltage angle (rad)";
  Real P "Active power (pu)";
  Real Q "Reactive power (pu)";
protected
  parameter Real CoB=Sn/S_b "Change of base between Machine and System";
equation
  P = p.vr*p.ir + p.vi*p.ii;
  Q = p.vi*p.ir - p.vr*p.ii;
  V = sqrt(p.vr^2 + p.vi^2);
  Angle_V = atan2(p.vi, p.vr);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color={28,108,200}),Text(
          extent={{-62,66},{66,34}},
          lineColor={28,108,200},
          textString="%P_0+j%Q_0")}), Documentation(info="", revisions="<!--DISCLAIMER-->
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
end baseLoad;
