within iPSL.Examples.DevelopmentExamples.Electrical.Machines.PSAT;


model InductiveMotorI_SIMBOpenline_Test "Order 1 inductive machine from PSAT, line opened at 2 s for 1 s"
  iPSL.Electrical.Machines.PSAT.InductionMachine.MotorTypeI motorTypeI(
    Sup=0,
    V_0=1.0336,
    angle_0=-0.02173,
    P_0=0.5,
    Q_0=0.286) annotation (Placement(transformation(
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
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{40,60},{64,80}})));
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
  annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
end InductiveMotorI_SIMBOpenline_Test;
