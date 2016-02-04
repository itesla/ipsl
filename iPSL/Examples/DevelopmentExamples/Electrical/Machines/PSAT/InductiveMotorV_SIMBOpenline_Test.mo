within iPSL.Examples.DevelopmentExamples.Electrical.Machines.PSAT;
model InductiveMotorV_SIMBOpenline_Test
  iPSL.Electrical.Machines.PSAT.InductionMachine.MotorTypeV motorTypeI(
    Sup=0,
    V_0=1.0336,
    angle_0=-0.02173,
    P_0=0.251061717038311,
    Q_0=0.226568616630697) annotation (Placement(transformation(
        extent={{-27,-22},{27,22}},
        rotation=180,
        origin={65,-16})));
  iPSL.Electrical.Branches.PwLine pwLine1(
    G=0,
    B=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        extent={{-25,-16},{25,16}},
        rotation=180,
        origin={-9,-38})));
  iPSL.Electrical.Branches.PwLine2Openings pwLine2(
    G=0,
    B=0,
    R=0.01,
    X=0.1,
    t1=2,
    t2=3) annotation (Placement(transformation(
        extent={{-25,-16},{25,16}},
        rotation=180,
        origin={-9,4})));
  iPSL.Electrical.Buses.InfiniteBus infiniteBus(V=1.05, angle=0) annotation (Placement(transformation(
        extent={{-16.5,-13.5},{16.5,13.5}},
        rotation=0,
        origin={-86.5,-15.5})));
  inner iPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(transformation(extent={{40,60},{64,80}})));
equation
  connect(infiniteBus.p, pwLine2.n) annotation (Line(
      points={{-68.35,-15.5},{-48.175,-15.5},{-48.175,4},{-26.5,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, infiniteBus.p) annotation (Line(
      points={{-26.5,-38},{-48,-38},{-48,-15.5},{-68.35,-15.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.p, motorTypeI.p) annotation (Line(
      points={{8.5,4},{26,4},{26,-16},{42.32,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, motorTypeI.p) annotation (Line(
      points={{8.5,-38},{26,-38},{26,-16},{42.32,-16}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(revisions="<!--DISCLAIMER-->
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
end InductiveMotorV_SIMBOpenline_Test;
