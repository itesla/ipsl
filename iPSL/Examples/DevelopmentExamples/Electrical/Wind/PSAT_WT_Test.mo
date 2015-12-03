within iPSL.Examples.DevelopmentExamples.Electrical.Wind;
model PSAT_WT_Test
  iPSL.Electrical.Wind.PSAT.PSAT_Type_3.PSAT_WT dfig_Turbine1(
    V_b=1,
    angle_0=0.00161587015139445,
    P_0=0.016,
    Q_0=-0.002086945,
    fn=50,
    poles=2,
    vw_base=15,
    Pnom=10,
    ngb=1/89) annotation (Placement(visible=true, transformation(
        origin={46.6515,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine5(
    B=0.001,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={6.551,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Wind.WindGenerator windGenerator1(
    v0=0.537631527453836,
    typ=3,
    tstop=15,
    sigma=1,
    vmax=25/15,
    wmag=-0.2) annotation (Placement(visible=true, transformation(
        origin={25.0,40.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.InfiniteBus infiniteBus1(V=1, angle=0) annotation (
      Placement(visible=true, transformation(
        origin={-28.2108,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
equation
  connect(infiniteBus1.p, pwLine5.p) annotation (Line(
      visible=true,
      origin={-8.8299,15.0},
      points={{-8.3809,0.0},{8.3809,0.0}},
      color={0,0,255}));
  connect(windGenerator1.Vw, dfig_Turbine1.Wind_Speed) annotation (Line(
      visible=true,
      origin={43.101,34.2663},
      points={{-7.101,5.7337},{3.5505,5.7337},{3.5505,-11.4673}},
      color={0,0,127}));
  connect(pwLine5.n, dfig_Turbine1.pin) annotation (Line(
      visible=true,
      origin={24.6013,15.0},
      points={{-11.0503,0},{11.0502,0}},
      color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Documentation(info="<html>
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
end PSAT_WT_Test;

