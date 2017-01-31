within iPSL.Examples.Machines;
package PSAT 


  model Order2tesendTime

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={13.2834,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      X=0.1,
      R=0.01,
      G=0,
      B=0.001/2) annotation (Placement(visible=true, transformation(
          origin={-70.0,-10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=10,
      X=1,
      startTime=25,
      endTime=25.01) annotation (Placement(visible=true, transformation(
          origin={20.0,-57.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 order21(
      Sn=20,
      Q_0=0.11859436505981,
      P_0=0.160352698692006,
      V_b=400,
      V_0=1,
      angle_0=0,
      Vn=400,
      ra=0.001,
      xd1=0.302,
      M=10,
      D=0) annotation (Placement(visible=true, transformation(
          origin={-116.9458,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=21,
      endTime=21.02) annotation (Placement(visible=true, transformation(
          origin={-25.0,-0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-70.0,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-25.0,-30.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-25.0,15.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={15.0,-30.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{100,80},{135,100}})));
  equation
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={-7.25,-43.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={-1.5,-29.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={-42.75,-20.0},
        points={{-15.5833,10},{4.75,10},{4.75,-10},{6.08333,-10}}));
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={-2.7875,13.0},
        points={{-10.5458,2},{3.0708,2},{3.0708,8},{16.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={-18.0,7.5},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={-32.0,7.5},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={-42.75,12.5},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={-63.0,0.0},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={-77.0,0.0},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    connect(order21.p, pwLine2.p) annotation (Line(
        visible=true,
        origin={-98.2365,9.9248},
        points={{-7.7093,0.12484},{-6.7635,0.12484},{-6.7635,0.0752},{16.5698,
          0.0752}}));
    connect(order21.vf, order21.vf0) annotation (Line(points={{-126.946,15},{
          -130,15},{-130,25},{-124.946,25},{-124.946,21}},                                                                    color={0,0,127}));
    connect(order21.pm, order21.pm0) annotation (Line(points={{-126.946,5},{
          -130,5},{-130,-5},{-124.946,-5},{-124.946,-1}},                                                                   color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5}), graphics={Text(
            visible=true,
            origin={-70.0,29.1417},
            fillPattern=FillPattern.Solid,
            extent={{-35.0,-5.8583},{35.0,5.8583}},
            textString="SystemSbase=100 MVA",
            fontName="Arial")}), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order2tesendTime;

  model Order2tesendTime_perturbation

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={121.0667,-11.5778},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      X=0.1,
      R=0.01,
      G=0,
      B=0.001/2) annotation (Placement(visible=true, transformation(
          origin={37.7833,-31.5778},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=10,
      endTime=10.1) annotation (Placement(visible=true, transformation(
          origin={127.7833,-70.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=14,
      endTime=14.1) annotation (Placement(visible=true, transformation(
          origin={82.7833,-21.5778},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={37.7833,-11.5778},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={82.7833,-42.7},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={82.7833,-6.5778},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={122.7833,-42.7},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add3 add31 annotation (Placement(visible=true, transformation(
          origin={-62.2167,17.6329},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true, transformation(
          origin={-96.3229,38.3121},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2)
      annotation (Placement(visible=true, transformation(
          origin={-125.0,44.635},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1)
      annotation (Placement(visible=true, transformation(
          origin={-125.0,29.635},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2)
      annotation (Placement(visible=true, transformation(
          origin={-125.0,14.1152},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-96.3229,18.3121},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine2(
      amplitude=0.001,
      freqHz=0.2,
      startTime=5) annotation (Placement(visible=true, transformation(
          origin={-124.599,-1.8698},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine3(
      amplitude=0.001,
      freqHz=0.2,
      startTime=10) annotation (Placement(visible=true, transformation(
          origin={-124.599,-72.8548},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-96.3229,-52.6729},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine4(
      amplitude=0.001,
      freqHz=0.2,
      startTime=5) annotation (Placement(visible=true, transformation(
          origin={-125.0,-56.8698},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1)
      annotation (Placement(visible=true, transformation(
          origin={-125.0,-41.35},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7)
      annotation (Placement(visible=true, transformation(
          origin={-125.0,-26.35},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add4 annotation (Placement(visible=true, transformation(
          origin={-96.3229,-32.6729},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Math.Add3 add32 annotation (Placement(visible=true, transformation(
          origin={-62.2167,-53.3521},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Machines.PSAT.SecondOrder.Order2 order2_Inputs_Outputs1(
      D=0,
      V_b=400,
      V_0=1,
      angle_0=0,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Sn=20,
      Vn=400,
      ra=0.001,
      xd1=0.302,
      M=10) annotation (Placement(visible=true, transformation(
          origin={-7.2167,-18.6674},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{100,80},{135,100}})));
  equation
    connect(step3.y, add4.u2)
      annotation (Line(
        visible=true,
        origin={-109.3078,-38.9083},
        points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
        color={0,0,127}));
    connect(add3.y, add32.u2) annotation (Line(
        visible=true,
        origin={-79.5045,-53.0125},
        points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
        color={0,0,127}));
    connect(step4.y, add4.u1)
      annotation (Line(
        visible=true,
        origin={-109.3078,-27.6146},
        points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
        color={0,0,127}));
    connect(add4.y, add32.u1) annotation (Line(
        visible=true,
        origin={-79.5045,-39.0125},
        points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
        color={0,0,127}));
    connect(add3.u2, sine3.y)
      annotation (Line(
        visible=true,
        origin={-112.8859,-65.5321},
        points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
        color={0,0,127}));
    connect(sine4.y, add3.u1)
      annotation (Line(
        visible=true,
        origin={-110.7773,-51.8707},
        points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
        color={0,0,127}));
    connect(sine1.y, add2.u1)
      annotation (Line(
        visible=true,
        origin={-110.7773,19.1143},
        points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
        color={0,0,127}));
    connect(add2.u2, sine2.y)
      annotation (Line(
        visible=true,
        origin={-112.8859,5.4529},
        points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
        color={0,0,127}));
    connect(step2.y, add1.u2)
      annotation (Line(
        visible=true,
        origin={-109.3078,32.0767},
        points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
        color={0,0,127}));
    connect(step1.y, add1.u1)
      annotation (Line(
        visible=true,
        origin={-109.3078,43.3704},
        points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
        color={0,0,127}));
    connect(add1.y, add31.u1) annotation (Line(
        visible=true,
        origin={-79.5045,31.9725},
        points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
        color={0,0,127}));
    connect(add2.y, add31.u2) annotation (Line(
        visible=true,
        origin={-79.5045,17.9725},
        points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
        color={0,0,127}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={100.5333,-55.85},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={106.2833,-42.2},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={104.9958,-8.5778},
        points={{-10.5458,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={89.7833,-14.0778},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={75.7833,-14.0778},
        points={{-4.66667,7.5},{-4.66667,0},{-0,0},{-0,-7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={65.0333,-9.0778},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={44.7833,-21.5778},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={30.7833,-21.5778},
        points={{-4.66667,10},{-4.66667,5},{-7.10542e-015,5},{-7.10542e-015,
          3.55271e-015},{-4.66667,3.55271e-015},{-4.66667,-10}}));
    connect(order2_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
        visible=true,
        origin={21.0333,-15.1977},
        points={{-17.25,-3.42006},{3.75,-3.42006},{3.75,3.6199},{5.08333,3.6199}}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={65.0333,-37.1389},
        points={{-15.5833,5.5611},{4.75,5.5611},{4.75,-5.5611},{6.08333,-5.5611}}));
    connect(order2_Inputs_Outputs1.pm0, add32.u3)
      annotation (Line(
        visible=true,
        origin={-23.8167,-45.8774},
        points={{8.6,16.21},{36.6,16.21},{36.6,-25.4726},{-50.4,-25.4726},{-50.4,-15.4747}},
        color={0,0,127}));
    connect(order2_Inputs_Outputs1.vf0, add31.u3) annotation (Line(
        visible=true,
        origin={-34.4439,0.1797},
        points={{19.2272,-7.8471},{41.2272,-7.8471},{41.2272,0.3938},{-40.4545,0.3938},{-40.4545,9.4532},{-39.7728,9.4532}},
        color={0,0,127}));
    connect(add31.y, order2_Inputs_Outputs1.vf)
      annotation (Line(
        visible=true,
        origin={-34.8167,-1.2348},
        points={{-16.4,18.8677},{-7.4,18.8677},{-7.4,-12.6515},{17.6,-12.6515},
          {17.6,-12.4326}},
        color={0,0,127}));
    connect(add32.y, order2_Inputs_Outputs1.pm) annotation (Line(
        visible=true,
        origin={-44.2655,-33.481},
        points={{-6.9512,-19.8711},{-3.9512,-19.8711},{-3.9512,10.0574},{-5.0975,10.0574},{-5.0975,9.8136},{27.0488,9.8136}},
        color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order2tesendTime_perturbation;

  model Order3tesendTime

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={13.2834,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      X=0.1,
      R=0.01,
      G=0,
      B=0.001/2) annotation (Placement(visible=true, transformation(
          origin={-70.0,-10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=3,
      endTime=3.1) annotation (Placement(visible=true, transformation(
          origin={20.0,-57.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={-25.0,-0.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-70.0,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-25.0,-30.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-25.0,15.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={15.0,-30.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order31(
      V_b=400,
      V_0=1,
      angle_0=0,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Sn=20,
      Vn=400,
      ra=0.01,
      xd1=0.302,
      M=10,
      D=0,
      xd=1.9,
      Td10=8,
      xq=1.7) annotation (Placement(visible=true, transformation(
          origin={-110.0,10.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{100,80},{135,100}})));
  equation
    connect(order31.p, pwLine2.p) annotation (Line(
        visible=true,
        origin={-85.5,9.9248},
        points={{-13.5,0.12484},{2.5,0.12484},{2.5,0.0752},{3.83333,0.0752}}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={-7.25,-43.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={-1.5,-29.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={-42.75,-20.0},
        points={{-15.5833,10},{4.75,10},{4.75,-10},{6.08333,-10}}));
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={-2.7875,13.0},
        points={{-10.5458,2},{3.0708,2},{3.0708,8},{16.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={-18.0,7.5},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={-32.0,7.5},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={-42.75,12.5},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={-63.0,0.0},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={-77.0,0.0},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    connect(order31.vf, order31.vf0) annotation (Line(points={{-120,15},{-125,
          15},{-125,25},{-118,25},{-118,21}},                                                                     color={0,0,127}));
    connect(order31.pm, order31.pm0) annotation (Line(points={{-120,5},{-125,5},{-125,-5},{-118,-5},{-118,-1}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order3tesendTime;

  model Order3tesendTime_perturbation

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={123.1468,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      X=0.1,
      R=0.01,
      G=0,
      B=0.001/2) annotation (Placement(visible=true, transformation(
          origin={39.8634,-35.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=10,
      endTime=10.1) annotation (Placement(visible=true, transformation(
          origin={132.5,-77.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=14,
      endTime=14.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-25.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={87.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-10.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={127.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add3 add31 annotation (Placement(visible=true, transformation(
          origin={-45.0,13.9829},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true, transformation(
          origin={-79.1062,34.6621},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,40.985},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,25.985},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,10.4652},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-79.1062,14.6621},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine2(
      amplitude=0.001,
      freqHz=0.2,
      startTime=5) annotation (Placement(visible=true, transformation(
          origin={-107.3823,-5.5198},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine3(
      amplitude=0.001,
      freqHz=0.2,
      startTime=10) annotation (Placement(visible=true, transformation(
          origin={-107.3823,-76.5048},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-79.1062,-56.3229},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine4(
      amplitude=0.001,
      freqHz=0.2,
      startTime=5) annotation (Placement(visible=true, transformation(
          origin={-107.7833,-60.5198},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,-45.0},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,-30.0},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add4 annotation (Placement(visible=true, transformation(
          origin={-79.1062,-36.3229},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Math.Add3 add32 annotation (Placement(visible=true, transformation(
          origin={-45.0,-57.0021},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order3_Inputs_Outputs1(
      V_b=400,
      V_0=1,
      angle_0=0,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Sn=20,
      Vn=400,
      ra=0.01,
      xd1=0.302,
      M=10,
      D=0,
      xd=1.9,
      Td10=8,
      xq=1.7) annotation (Placement(visible=true, transformation(
          origin={3.3113,-20.7513},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{100,80},{135,100}})));
  equation
    connect(order3_Inputs_Outputs1.pm0, add32.u3) annotation (Line(
        visible=true,
        origin={-19.0108,-51.4898},
        points={{14.3221,19.7385},{41.1619,19.7385},{41.1619,-23.5102},{-38.8284,-23.5102},{-38.8284,-13.5123},{-37.9892,-13.5123}},
        color={0,0,127}));
    connect(order3_Inputs_Outputs1.vf0, add31.u3) annotation (Line(
        visible=true,
        origin={-21.3443,-2.9483},
        points={{16.6556,-6.803},{38.6557,-6.803},{38.6557,-0.1282},{-38.6557,-0.1282},{-38.6557,8.9312},{-35.6557,8.9312}},
        color={0,0,127}));
    connect(add31.y, order3_Inputs_Outputs1.vf) annotation (Line(
        visible=true,
        origin={-28.1135,-5.371},
        points={{-5.8865,19.3539},{-2.8865,19.3539},{-2.8865,-9.629},{-3.8826,
          -9.629},{-3.8826,-10.3803},{21.4248,-10.3803}},
        color={0,0,127}));
    connect(add32.y, order3_Inputs_Outputs1.pm) annotation (Line(
        visible=true,
        origin={-28.216,-45.5845},
        points={{-5.784,-11.4176},{-2.784,-11.4176},{-2.784,-9.4155},{-4.0877,-9.4155},{-4.0877,19.8332},{21.5273,19.8332}},
        color={0,0,127}));
    connect(step3.y, add4.u2)
      annotation (Line(
        visible=true,
        origin={-92.0911,-42.5583},
        points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
        color={0,0,127}));
    connect(add3.y, add32.u2) annotation (Line(
        visible=true,
        origin={-62.2878,-56.6625},
        points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
        color={0,0,127}));
    connect(step4.y, add4.u1)
      annotation (Line(
        visible=true,
        origin={-92.0911,-31.2646},
        points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
        color={0,0,127}));
    connect(add4.y, add32.u1) annotation (Line(
        visible=true,
        origin={-62.2878,-42.6625},
        points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
        color={0,0,127}));
    connect(add3.u2, sine3.y)
      annotation (Line(
        visible=true,
        origin={-95.6692,-69.1821},
        points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
        color={0,0,127}));
    connect(sine4.y, add3.u1)
      annotation (Line(
        visible=true,
        origin={-93.5606,-55.5207},
        points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
        color={0,0,127}));
    connect(sine1.y, add2.u1)
      annotation (Line(
        visible=true,
        origin={-93.5606,15.4643},
        points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
        color={0,0,127}));
    connect(add2.u2, sine2.y)
      annotation (Line(
        visible=true,
        origin={-95.6692,1.8029},
        points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
        color={0,0,127}));
    connect(step2.y, add1.u2)
      annotation (Line(
        visible=true,
        origin={-92.0911,28.4267},
        points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
        color={0,0,127}));
    connect(step1.y, add1.u1)
      annotation (Line(
        visible=true,
        origin={-92.0911,39.7204},
        points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
        color={0,0,127}));
    connect(add1.y, add31.u1) annotation (Line(
        visible=true,
        origin={-62.2878,28.3225},
        points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
        color={0,0,127}));
    connect(add2.y, add31.u2) annotation (Line(
        visible=true,
        origin={-62.2878,14.3225},
        points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
        color={0,0,127}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={69.0909,-42.8357},
        points={{-17.5608,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{6.74243,
          -7.1643}}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={105.25,-63.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={111.0,-49.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
        visible=true,
        origin={25.2254,-18.2865},
        points={{-10.9141,-2.41516},{1.638,-2.41516},{1.638,2.6151},{2.97133,
          2.6151}}));
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={107.0759,-12.6714},
        points={{-10.5458,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={91.8634,-18.1714},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={77.8634,-18.1714},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={67.1134,-13.1714},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={46.8634,-25.6714},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={32.8634,-25.6714},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order3tesendTime_perturbation;

  model Order3tesendTime_TG

    iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order3_Inputs_Outputs1(
      V_b=400,
      V_0=1,
      angle_0=0,
      Sn=20,
      Vn=400,
      ra=0.01,
      xd1=0.302,
      M=10,
      D=0,
      xd=1.9,
      Td10=8,
      xq=1.7,
      P_0=0.200012000627281,
      Q_0=0.0518626935184656) annotation (Placement(visible=true, transformation(
          origin={3.3113,-20.7513},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={123.1468,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-35.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=3,
      endTime=3.1) annotation (Placement(visible=true, transformation(
          origin={132.5,-77.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-25.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={87.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-10.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={127.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Controls.PSAT.TG.TGtypeII TGtypeII1 annotation (Placement(visible=true, transformation(
          origin={-50.0,-40.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{100,80},{135,100}})));
  equation
    connect(order3_Inputs_Outputs1.vf0, order3_Inputs_Outputs1.vf) annotation (Line(
        visible=true,
        origin={3.3742,-9.512},
        points={{-8.0629,-0.2393},{13.9371,-0.2393},{13.9371,7.8232},{-13.3742,
          7.8232},{-13.3742,-6.2393},{-10.0629,-6.2393}},
        color={0,0,127}));
    connect(order3_Inputs_Outputs1.pm, TGtypeII1.pm)
      annotation (Line(
        visible=true,
        origin={-29.9222,-32.3757},
        points={{23.2335,6.6244},{-6.0778,6.6244},{-6.0778,-7.6243},{-9.0778,-7.6243}},
        color={0,0,127}));
    connect(order3_Inputs_Outputs1.pm0, TGtypeII1.pm0) annotation (Line(
        visible=true,
        origin={-23.7162,-4.1558},
        points={{19.0275,-27.5955},{45.412,-27.5955},{45.412,34.1558},{-51.2838,34.1558},{-51.2838,-23.8442},{-26.2838,-23.8442}},
        color={0,0,127}));
    connect(order3_Inputs_Outputs1.w, TGtypeII1.W) annotation (Line(
        visible=true,
        origin={-23.7171,-43.5838},
        points={{38.0284,31.8325},{51.4102,31.8325},{51.4102,-21.4162},{-51.2829,-21.4162},{-51.2829,3.5838},{-38.2829,3.5838}},
        color={0,0,127}));
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={107.0759,-12.6714},
        points={{-10.5458,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={77.8634,-18.1714},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={105.25,-63.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={111.0,-49.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={91.8634,-18.1714},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={67.1134,-13.1714},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={69.0909,-42.8357},
        points={{-17.5608,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{6.74243,
          -7.1643}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={46.8634,-25.6714},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
        visible=true,
        origin={25.2254,-18.2865},
        points={{-10.9141,-2.41516},{1.638,-2.41516},{1.638,2.6151},{2.97133,
          2.6151}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={32.8634,-25.6714},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105.0},{148.5,105.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order3tesendTime_TG;

  model Order3tesendTime_AVR

    iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order3_Inputs_Outputs1(
      V_b=400,
      V_0=1,
      angle_0=0,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Sn=20,
      Vn=400,
      ra=0.01,
      xd1=0.302,
      M=10,
      D=0,
      xd=1.9,
      Td10=8,
      xq=1.7) annotation (Placement(visible=true, transformation(
          origin={3.3113,-20.7513},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={123.1468,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-35.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=3,
      endTime=3.1) annotation (Placement(visible=true, transformation(
          origin={132.5,-77.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-25.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={87.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-10.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={127.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1
      annotation (Placement(visible=true, transformation(
          origin={-51.6542,-7.4083},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,80},{75,100}})));
  equation
    connect(order3_Inputs_Outputs1.v, AVRtypeIII1.v)
      annotation (Line(
        visible=true,
        origin={-13.9377,2.581},
        points={{28.249,-20.3323},{38.9377,-20.3323},{38.9377,22.419},{-49.7165,22.419},{-49.7165,-4.9893}},
        color={0,0,127}));
    connect(order3_Inputs_Outputs1.vf, AVRtypeIII1.vf)
      annotation (Line(
        visible=true,
        origin={-33.6722,-11.3844},
        points={{26.9835,-4.3669},{-7.3278,-4.3669},{-7.3278,3.9761},{-6.982,
          3.9761}},
        color={0,0,127}));
    connect(order3_Inputs_Outputs1.pm0, order3_Inputs_Outputs1.pm) annotation (Line(
        visible=true,
        origin={4.3767,-24.7396},
        points={{-9.0654,-7.0117},{18.179,-7.0117},{18.179,-10.2604},{-16.6137,-10.2604},{-16.6137,-1.0117},{-11.0654,-1.0117}},
        color={0,0,127}));
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={107.0759,-12.6714},
        points={{-10.5458,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={77.8634,-18.1714},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={105.25,-63.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={111.0,-49.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={91.8634,-18.1714},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={67.1134,-13.1714},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={69.0909,-42.8357},
        points={{-17.5608,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{6.74243,
          -7.1643}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={46.8634,-25.6714},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
        visible=true,
        origin={25.2254,-18.2865},
        points={{-10.9141,-2.41516},{1.638,-2.41516},{1.638,2.6151},{2.97133,
          2.6151}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={32.8634,-25.6714},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    connect(order3_Inputs_Outputs1.vf0, AVRtypeIII1.vs) annotation (Line(points={{-4.6887,-9.7513},{-4.6887,45},{-63.6542,45},{-63.6542,-11.4083}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order3tesendTime_AVR;

  model Order4tesendTime

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={-22.5,67.5},
          extent={{-12.5,-12.5},{12.5,12.5}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={-45,55},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-45,70},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-45,35},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={-22.5,42.5},
          extent={{-12.5,-12.5},{12.5,12.5}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-70,60},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-70,45},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFault(
      X=0.001,
      startTime=3,
      endTime=3.1,
      R=10) annotation (Placement(transformation(extent={{-25,-15},{0,10}})));
    iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 Generator(
      Sn=100,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Vn=20,
      V_b=400,
      V_0=1,
      angle_0=0,
      ra=0.001,
      M=10,
      D=0,
      xd1=0.302) annotation (Placement(transformation(extent={{-120,40},{-90,70}})));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,80},{75,100}})));
  equation
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={-38,62.5},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={-52,62.5},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        points={{-58.3333,45},{-58.3333,50},{-60,50},{-53.6666,50},{-58.3333,50},
          {-58.3333,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        points={{-58.3333,60},{-60,60},{-60,70},{-56.6667,70}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        points={{-58.3333,45},{-60,45},{-60,35},{-56.6667,35}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Generator.p, pwLine2.p) annotation (Line(
        points={{-88.5,55.0745},{-80,55.0745},{-80,60},{-81.6667,60}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Generator.p, pwLine1.p) annotation (Line(
        points={{-88.5,55.0745},{-80,55.0745},{-80,45},{-81.6667,45}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine3.n, pwLoadPQ1.p) annotation (Line(
        points={{-33.3333,35},{-22.5,35},{-22.5,56.25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine4.n, pwLoadPQ2.p) annotation (Line(
        points={{-33.3333,70},{-32.125,70},{-32.125,81.25},{-22.5,81.25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine3.n, pwFault.p) annotation (Line(
        points={{-33.3333,35},{-35,35},{-35,-2.5},{-27.0833,-2.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Generator.vf0, Generator.vf) annotation (Line(points={{-117,71.5},{
          -117,75},{-130,75},{-130,62.5},{-120,62.5}},                                                                      color={0,0,127}));
    connect(Generator.pm, Generator.pm0) annotation (Line(points={{-120,47.5},{-125,47.5},{-125,50},{-125,38.5},{-117,38.5}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5}), graphics={Text(
            extent={{-120,85},{-20,80}},
            lineColor={0,0,255},
            textString="GenOrder4: LineOpening and Line-to-Ground Fault")}),
      experiment(StopTime=20),
      __Dymola_experimentSetupOutput,
      Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order4tesendTime;

  model Order4tesendTime_perturbation

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={123.1468,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      X=0.1,
      R=0.01,
      G=0,
      B=0.001/2) annotation (Placement(visible=true, transformation(
          origin={39.8634,-35.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=10,
      endTime=10.1) annotation (Placement(visible=true, transformation(
          origin={132.5,-77.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=14,
      endTime=14.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-25.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={87.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-10.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={127.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add3 add31 annotation (Placement(visible=true, transformation(
          origin={-45.0,13.9829},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add1 annotation (Placement(visible=true, transformation(
          origin={-79.1062,34.6621},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,40.985},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,25.985},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, freqHz=0.2)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,10.4652},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-79.1062,14.6621},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine2(
      amplitude=0.001,
      freqHz=0.2,
      startTime=5) annotation (Placement(visible=true, transformation(
          origin={-107.3823,-5.5198},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine3(
      amplitude=0.001,
      freqHz=0.2,
      startTime=10) annotation (Placement(visible=true, transformation(
          origin={-107.3823,-76.5048},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(visible=true, transformation(
          origin={-79.1062,-56.3229},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Sources.Sine sine4(
      amplitude=0.001,
      freqHz=0.2,
      startTime=5) annotation (Placement(visible=true, transformation(
          origin={-107.7833,-60.5198},
          extent={{-4.4802,-4.4802},{4.4802,4.4802}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,-45.0},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7)
      annotation (Placement(visible=true, transformation(
          origin={-107.7833,-30.0},
          extent={{-5.0,-5.0},{5.0,5.0}},
          rotation=0)));
    Modelica.Blocks.Math.Add add4 annotation (Placement(visible=true, transformation(
          origin={-79.1062,-36.3229},
          extent={{-6.3229,-6.3229},{6.3229,6.3229}},
          rotation=0)));
    Modelica.Blocks.Math.Add3 add32 annotation (Placement(visible=true, transformation(
          origin={-45.0,-57.0021},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 order4_Inputs_Outputs(
      V_b=200,
      V_0=1,
      angle_0=0,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      ra=0.001,
      xd1=0.302,
      M=10,
      D=0,
      Sn=370,
      Vn=200) annotation (Placement(transformation(extent={{-15,-25},{5,-5}})));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,80},{75,100}})));
  equation
    connect(step3.y, add4.u2)
      annotation (Line(
        visible=true,
        origin={-92.0911,-42.5583},
        points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
        color={0,0,127}));
    connect(add3.y, add32.u2) annotation (Line(
        visible=true,
        origin={-62.2878,-56.6625},
        points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
        color={0,0,127}));
    connect(step4.y, add4.u1)
      annotation (Line(
        visible=true,
        origin={-92.0911,-31.2646},
        points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
        color={0,0,127}));
    connect(add4.y, add32.u1) annotation (Line(
        visible=true,
        origin={-62.2878,-42.6625},
        points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
        color={0,0,127}));
    connect(add3.u2, sine3.y)
      annotation (Line(
        visible=true,
        origin={-95.6692,-69.1821},
        points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
        color={0,0,127}));
    connect(sine4.y, add3.u1)
      annotation (Line(
        visible=true,
        origin={-93.5606,-55.5207},
        points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
        color={0,0,127}));
    connect(sine1.y, add2.u1)
      annotation (Line(
        visible=true,
        origin={-93.5606,15.4643},
        points={{-9.29448,-4.9991},{-1.4394,-0.9841},{3.8669,2.9916},{6.86692,2.99154}},
        color={0,0,127}));
    connect(add2.u2, sine2.y)
      annotation (Line(
        visible=true,
        origin={-95.6692,1.8029},
        points={{8.97552,9.06546},{2.2971,9.06546},{2.2971,-5.4041},{-6.78488,-5.4041},{-6.78488,-7.3227}},
        color={0,0,127}));
    connect(step2.y, add1.u2)
      annotation (Line(
        visible=true,
        origin={-92.0911,28.4267},
        points={{-10.1922,-2.4417},{2.3974,-2.4417},{2.3974,2.44166},{5.39742,2.44166}},
        color={0,0,127}));
    connect(step1.y, add1.u1)
      annotation (Line(
        visible=true,
        origin={-92.0911,39.7204},
        points={{-10.1922,1.2646},{2.3974,1.2646},{2.3974,-1.26456},{5.39742,-1.26456}},
        color={0,0,127}));
    connect(add1.y, add31.u1) annotation (Line(
        visible=true,
        origin={-62.2878,28.3225},
        points={{-9.86321,6.3396},{2.2878,6.3396},{2.2878,-6.3396},{5.2878,-6.3396}},
        color={0,0,127}));
    connect(add2.y, add31.u2) annotation (Line(
        visible=true,
        origin={-62.2878,14.3225},
        points={{-9.86321,0.3396},{2.2878,0.3396},{2.2878,-0.3396},{5.2878,-0.3396}},
        color={0,0,127}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={69.0909,-42.8357},
        points={{-17.5608,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{6.74243,
          -7.1643}}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={105.25,-63.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={111.0,-49.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={107.0759,-12.6714},
        points={{-10.5458,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={91.8634,-18.1714},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={77.8634,-18.1714},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={67.1134,-13.1714},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={46.8634,-25.6714},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={32.8634,-25.6714},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
        points={{6,-14.9504},{20.5,-14.9504},{20.5,-15.6714},{28.1967,-15.6714}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(order4_Inputs_Outputs.vf0, add31.u3) annotation (Line(
        points={{-13,-4},{10,-4},{10,0},{-65,0},{-65,5.9829},{-57,5.9829}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(order4_Inputs_Outputs.pm0, add32.u3) annotation (Line(
        points={{-13,-26},{10,-26},{10,-75},{-65,-75},{-65,-65.0021},{-57,-65.0021}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add32.y, order4_Inputs_Outputs.pm) annotation (Line(
        points={{-34,-57.0021},{-30,-57.0021},{-30,-20},{-15,-20}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add31.y, order4_Inputs_Outputs.vf) annotation (Line(
        points={{-34,13.9829},{-30,13.9829},{-30,-10},{-15,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order4tesendTime_perturbation;

  model Order4tesendTime_TG

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={123.1468,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-35.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=3,
      endTime=3.1) annotation (Placement(visible=true, transformation(
          origin={132.5,-77.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-25.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={87.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-10.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={127.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Controls.PSAT.TG.TGtypeII TGtypeII1 annotation (Placement(visible=true, transformation(
          origin={-67.5,-27.5},
          extent={{-17.5,-12.5},{17.5,12.5}},
          rotation=0)));
    iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 Generator(
      V_b=200,
      V_0=1,
      angle_0=0,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      ra=0.001,
      xd1=0.302,
      M=10,
      D=0,
      Sn=370,
      Vn=200) annotation (Placement(transformation(extent={{-55,30},{-25,60}})));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,80},{75,100}})));
  equation
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={107.0759,-12.6714},
        points={{-10.5458,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={77.8634,-18.1714},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={105.25,-63.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={111.0,-49.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={91.8634,-18.1714},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={67.1134,-13.1714},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={69.0909,-42.8357},
        points={{-17.5608,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{6.74243,
          -7.1643}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={46.8634,-25.6714},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={32.8634,-25.6714},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    connect(Generator.vf0, Generator.vf) annotation (Line(
        points={{-52,61.5},{-15,61.5},{-15,70},{-60,70},{-60,52.5},{-55,52.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Generator.pm0, TGtypeII1.pm0) annotation (Line(
        points={{-52,28.5},{-5,28.5},{-5,85},{-85,85},{-85,-12.5},{-67.5,-12.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TGtypeII1.pm, Generator.pm) annotation (Line(
        points={{-48.25,-27.5},{-35,-27.5},{-35,25},{-65,25},{-65,37.5},{-55,37.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Generator.w, TGtypeII1.W) annotation (Line(
        points={{-23.5,58.5},{-15,58.5},{-15,-65},{-90,-65},{-90,-27.5},{-88.5,-27.5}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Generator.p, pwLine2.p) annotation (Line(
        points={{-23.5,45.0745},{10,45.0745},{10,-15.6714},{28.1967,-15.6714}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order4tesendTime_TG;

  model Order4tesendTime_AVR

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={123.1468,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-35.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFaulstartTime(
      R=20,
      X=1,
      startTime=3,
      endTime=3.1) annotation (Placement(visible=true, transformation(
          origin={132.5,-77.3},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-25.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={39.8634,-15.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={87.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={84.8634,-10.6714},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={127.5,-50.0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1
      annotation (Placement(visible=true, transformation(
          origin={-56.6542,-7.4083},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 order4_Inputs_Outputs(
      V_b=200,
      V_0=1,
      angle_0=0,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Sn=370,
      Vn=200,
      ra=0.001,
      xd1=0.302,
      M=10,
      D=0) annotation (Placement(transformation(extent={{-10,-5},{10,15}})));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,50},{75,70}})));
  equation
    connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={107.0759,-12.6714},
        points={{-10.5458,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={77.8634,-18.1714},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwFaulstartTime.p, pwLine3.n) annotation (Line(
        visible=true,
        origin={105.25,-63.15},
        points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-6.08333,13.15}}));
    connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={111.0,-49.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={91.8634,-18.1714},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        visible=true,
        origin={67.1134,-13.1714},
        points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        visible=true,
        origin={69.0909,-42.8357},
        points={{-17.5608,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{6.74243,
          -7.1643}}));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        visible=true,
        origin={46.8634,-25.6714},
        points={{4.66667,-10},{4.66667,-5},{5,-5},{5,0},{4.66667,0},{4.66667,10}}));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        visible=true,
        origin={32.8634,-25.6714},
        points={{-4.66667,10},{-4.66667,5},{-5,5},{-5,0},{-4.66667,0},{-4.66667,
          -10}}));
    connect(AVRtypeIII1.vf, order4_Inputs_Outputs.vf) annotation (Line(
        points={{-45.6542,-7.4083},{-40,-7.4083},{-40,10},{-10,10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(order4_Inputs_Outputs.vf0, AVRtypeIII1.vf0) annotation (Line(
        points={{-8,16},{20,16},{20,35},{-80,35},{-80,-10.4083},{-68.6542,-10.4083}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(order4_Inputs_Outputs.v, AVRtypeIII1.v) annotation (Line(
        points={{11,8},{25,8},{25,25},{-75,25},{-75,-2.4083},{-68.6542,-2.4083}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm) annotation (Line(
        points={{-8,-6},{30,-6},{30,-10},{-20,-10},{-20,0},{-10,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
        points={{11,5.04964},{20,5.04964},{20,-15.6714},{28.1967,-15.6714}},
        color={0,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5})), Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order4tesendTime_AVR;

  model Order5_1tesendTime

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={53.2834,20},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={15,10},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={15,25},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={20,-25},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={60,-25},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-20,20},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-20,5},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFault(
      X=0.001,
      startTime=3,
      endTime=3.1,
      R=10) annotation (Placement(transformation(extent={{40,-55},{60,-35}})));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,80},{75,100}})));
    iPSL.Electrical.Machines.PSAT.FifthOrder.Order5_Type1 order5Type1_Inputs_Outputs(
      Sn=370,
      Vn=200,
      ra=0.001,
      xd1=0.302,
      M=10,
      D=0) annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  equation
    connect(pwLine4.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={37.2125,23},
        points={{-10.5458,2},{3.0708,2},{3.0708,8},{16.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={22,17.5},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={8,17.5},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine3.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={43.5,-24.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLine1.p, pwLine2.p) annotation (Line(
        points={{-31.6667,5},{-31.6667,10},{-30,10},{-36.3334,10},{-31.6667,10},
          {-31.6667,20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        points={{-8.33333,5},{-8.33333,10},{-10,10},{-3.66666,10},{-8.33333,10},
          {-8.33333,20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        points={{-8.33333,20},{0,20},{0,25},{3.33333,25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        points={{-8.33333,5},{0,5},{0,-25},{8.33333,-25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwFault.p, pwLine3.n) annotation (Line(
        points={{38.3333,-45},{38.3333,-34.5},{31.6667,-34.5},{31.6667,-25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(order5Type1_Inputs_Outputs.p, pwLine2.p) annotation (Line(points={{-79,
          10.0496},{-40,10.0496},{-40,20},{-31.6667,20}},                                                                     color={0,0,255}));
    connect(order5Type1_Inputs_Outputs.vf, order5Type1_Inputs_Outputs.vf0) annotation (Line(points={{-100,15},
          {-105,15},{-105,25},{-98,25},{-98,21}},                                                                                                     color={0,0,127}));
    connect(order5Type1_Inputs_Outputs.pm, order5Type1_Inputs_Outputs.pm0) annotation (Line(points={{-100,5},{-105,5},{-105,-5},{-98,-5},{-98,-1}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5}), graphics={Text(
            visible=true,
            origin={-60,54.1417},
            fillPattern=FillPattern.Solid,
            extent={{-35.0,-5.8583},{35.0,5.8583}},
            textString="SystemSbase=100 MVA",
            fontName="Arial")}),
      experiment(StopTime=20),
      __Dymola_experimentSetupOutput,
      Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order5_1tesendTime;

  model Order5_2tesendTime

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={13.2834,10},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=8,
      endTime=8.1) annotation (Placement(visible=true, transformation(
          origin={-25,0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-25,15},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-20,-35},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={20,-35},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-60,10},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-60,-5},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFault(
      X=0.001,
      startTime=3,
      endTime=3.1,
      R=10) annotation (Placement(transformation(extent={{0,-65},{20,-45}})));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{0,80},{25,100}})));
    iPSL.Electrical.Machines.PSAT.FifthOrder.Order5_Type2 order5Type2_Inputs_Outputs(
      V_b=200,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Sn=370,
      Vn=200,
      ra=0.001,
      xd1=0.302,
      M=10,
      D=0) annotation (Placement(transformation(extent={{-115,-5},{-95,15}})));
  equation
    connect(pwLine4.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={-2.7875,13},
        points={{-10.5458,2},{3.0708,2},{3.0708,8},{16.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={-18,7.5},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={-32,7.5},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine3.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={3.5,-34.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLine1.p, pwLine2.p) annotation (Line(
        points={{-71.6667,-5},{-71.6667,0},{-70,0},{-76.3334,0},{-71.6667,0},{
          -71.6667,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine1.n, pwLine2.n) annotation (Line(
        points={{-48.3333,-5},{-48.3333,0},{-50,0},{-43.6666,0},{-48.3333,0},{
          -48.3333,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        points={{-48.3333,10},{-40,10},{-40,15},{-36.6667,15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        points={{-48.3333,-5},{-40,-5},{-40,-35},{-31.6667,-35}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwFault.p, pwLine3.n) annotation (Line(
        points={{-1.66667,-55},{-1.66667,-44.5},{-8.33333,-44.5},{-8.33333,-35}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(order5Type2_Inputs_Outputs.pm, order5Type2_Inputs_Outputs.pm0) annotation (Line(points={{-115,0},{-120,0},{-120,-10},{-113,-10},{-113,-6}}, color={0,0,127}));
    connect(order5Type2_Inputs_Outputs.vf, order5Type2_Inputs_Outputs.vf0) annotation (Line(points={{-115,10},
          {-120,10},{-120,20},{-113,20},{-113,16}},                                                                                                     color={0,0,127}));
    connect(order5Type2_Inputs_Outputs.p, pwLine2.p) annotation (Line(points={{-94,
          5.04964},{-80,5.04964},{-80,10},{-71.6667,10}},                                                                     color={0,0,255}));
    annotation (
      Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5}), graphics={Text(
            visible=true,
            origin={-60,54.1417},
            fillPattern=FillPattern.Solid,
            extent={{-35.0,-5.8583},{35.0,5.8583}},
            textString="SystemSbase=100 MVA",
            fontName="Arial")}),
      experiment(StopTime=20),
      __Dymola_experimentSetupOutput,
      Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order5_2tesendTime;

  model Order6tesendTime

    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={18.2834,10},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1,
      startTime=12,
      endTime=12.1) annotation (Placement(visible=true, transformation(
          origin={-25,0},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine4(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-25,15},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine3(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-20,-35},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
      P_0=0.08,
      Q_0=0.06,
      V_0=1,
      angle_0=0) annotation (Placement(visible=true, transformation(
          origin={20,-35},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine2(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-60,10},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Branches.PwLine pwLine1(
      B=0.001/2,
      G=0,
      R=0.01,
      X=0.1) annotation (Placement(visible=true, transformation(
          origin={-60,-20},
          extent={{-10.0,-10.0},{10.0,10.0}},
          rotation=0)));
    iPSL.Electrical.Events.PwFault pwFault(
      X=0.001,
      startTime=3,
      endTime=3.1,
      R=10) annotation (Placement(transformation(extent={{25,-70},{45,-50}})));
    iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 order6Type2_1(
      Sn=100,
      P_0=0.160352698692006,
      Q_0=0.11859436505981,
      Vn=20000,
      V_b=400000,
      V_0=1,
      angle_0=0,
      ra=0.001,
      xd1=0.302,
      M=10,
      D=0) annotation (Placement(transformation(extent={{-140,-10},{-100,30}})));
    inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,50},{75,70}})));
  equation
    connect(pwLine4.n, pwLoadPQ2.p) annotation (Line(
        visible=true,
        origin={-2.7875,13},
        points={{-10.5458,2},{3.0708,2},{3.0708,8},{21.0709,8}}));
    connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
        visible=true,
        origin={-18,7.5},
        points={{0,-7.5},{0,0},{0,7.5},{4.66667,7.5}}));
    connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
        visible=true,
        origin={-32,7.5},
        points={{-4.66667,7.5},{-4.66667,0},{0,0},{0,-7.5}}));
    connect(pwLine3.n, pwLoadPQ1.p) annotation (Line(
        visible=true,
        origin={3.5,-34.5},
        points={{-11.8333,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
    connect(pwLine2.n, pwLine4.p) annotation (Line(
        points={{-48.3333,10},{-40,10},{-40,15},{-36.6667,15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine1.n, pwLine3.p) annotation (Line(
        points={{-48.3333,-20},{-40,-20},{-40,-35},{-31.6667,-35}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwFault.p, pwLine3.n) annotation (Line(
        points={{23.3333,-60},{23.3333,-44.5},{-8.33333,-44.5},{-8.33333,-35}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(order6Type2_1.p, pwLine2.p) annotation (Line(
        points={{-98,10.0993},{-94.5,10.0993},{-94.5,10},{-71.6667,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine2.p, pwLine1.p) annotation (Line(
        points={{-71.6667,10},{-71.6667,-20},{-71.6667,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(pwLine2.n, pwLine1.n) annotation (Line(
        points={{-48.3333,10},{-48.3333,-20},{-48.3333,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(order6Type2_1.vf0, order6Type2_1.vf) annotation (Line(points={{-136,32},
          {-136,35},{-150,35},{-150,20},{-140,20}},                                                                           color={0,0,127}));
    connect(order6Type2_1.pm, order6Type2_1.pm0) annotation (Line(points={{-140,0},{-150,0},{-150,-15},{-136,-15},{-136,-12}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(
          extent={{-148.5,-105},{148.5,105}},
          preserveAspectRatio=false,
          initialScale=0.1,
          grid={5,5}), graphics={Text(
            visible=true,
            origin={-60,54.1417},
            fillPattern=FillPattern.Solid,
            extent={{-35.0,-5.8583},{35.0,5.8583}},
            textString="SystemSbase=100 MVA",
            fontName="Arial")}),
      experiment(StopTime=20),
      __Dymola_experimentSetupOutput,
      Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
  end Order6tesendTime;

annotation (Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end PSAT;
