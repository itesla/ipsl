within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model Turbine "GE General GGOV1 Turbine Model"
	parameter Integer Flag=1 "Switch for fuel source
	characteristic" annotation (Evaluate=true, choices(choice=0
	      "Fuel flow independent of speed",                                                       choice=1
	      "Fuel flow proportional to speed"));
	parameter Types.Time Tact=0.5 "Actuator time constant";
	parameter Types.PerUnit Kturb=1.5 "Turbine gain";
	parameter Types.Time Tb=0.1 "Turbine lag time constant";
    parameter Types.Time Tc=0 "Turbine lead time constant";
	parameter Types.Time Teng=0 "Transport lag time constant for diesel engine";
	parameter Types.Time Tfload=3 "Load Limiter time constant";
	parameter Types.PerUnit Dm=0 "Mechanical damping coefficient";
	parameter Types.TimeAging Ropen=0.1 "Maximum valve opening rate";
    parameter Types.TimeAging Rclose=-0.1 "Maximum valve closing rate";
	parameter Types.Time Tsa=4 "Temperature detection lead time constant";
    parameter Types.Time Tsb=5 "Temperature detection lag time constant";
	parameter Types.Time DELT=0.005 "Time step used in simulation";
	parameter Types.PerUnit Wfnl=0.2 "No load fuel flow";
	Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{20,-62},{32,-50}})));
	OpenIPSL.NonElectrical.Continuous.LeadLag s4(
	  K=1,
	  T1=Tc,
	  T2=Tb,
	  y_start=s40) annotation (Placement(transformation(
	      extent={{-10,-10},{10,10}},
	      rotation=90,
	      origin={40,66})));
	Modelica.Blocks.Math.Gain gain1(k=Kturb) annotation (Placement(transformation(
	      extent={{-8,-8},{8,8}},
	      rotation=90,
	      origin={40,36})));
	Modelica.Blocks.Nonlinear.FixedDelay delay(delayTime=Teng)
	  "Transport lag time"
	  annotation (Placement(transformation(
	      extent={{-14,-14},{14,14}},
	      rotation=90,
	      origin={40,0})));
	Modelica.Blocks.Math.Add add4(k2=-1) annotation (Placement(transformation(
	      extent={{-6,-6},{6,6}},
	      rotation=90,
	      origin={40,-34})));
	Modelica.Blocks.Math.Add add5(k1=-1) annotation (Placement(transformation(
	      extent={{-10,-10},{10,10}},
	      rotation=0,
	      origin={74,96})));
	Modelica.Blocks.Math.Gain gain2(k=Dm) annotation (Placement(transformation(
	      extent={{-8,-8},{8,8}},
	      rotation=0,
	      origin={22,102})));
	OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.flag flag10(flag=Flag) annotation (Placement(transformation(
	      extent={{-10,-10},{10,10}},
	      rotation=90,
	      origin={18,-106})));
	OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.Dm_select dm_select(Dm=Dm) annotation (Placement(transformation(extent={{-16,92},{4,112}})));
	Modelica.Blocks.Math.Gain Tactgain(k=1/Tact) annotation (Placement(transformation(extent={{-50,-58},{-40,-48}})));
	Modelica.Blocks.Nonlinear.Limiter V1(uMax=Ropen, uMin=Rclose) annotation (Placement(transformation(extent={{-34,-60},{-20,-46}})));
	Modelica.Blocks.Continuous.Integrator s3(
	  k=1,
	  initType=Modelica.Blocks.Types.Init.InitialOutput,
	  y_start=s30) annotation (Placement(transformation(
	      extent={{-7,-7},{7,7}},
	      rotation=0,
	      origin={-3,-53})));
	Modelica.Blocks.Math.Add add8(k2=-1) annotation (Placement(transformation(
	      extent={{-6,-6},{6,6}},
	      rotation=0,
	      origin={-62,-54})));
	protected
	parameter Types.PerUnit Pmech0(fixed=false);
	parameter Types.PerUnit s30(fixed=false);
    parameter Types.PerUnit s40(fixed=false);
    parameter Types.PerUnit s50(fixed=false);
	parameter Types.PerUnit s90(fixed=false);
	parameter Types.PerUnit fsr0(fixed=false);
	public
	Modelica.Blocks.Interfaces.RealInput SPEED
	  "Machine speed deviation from nominal (pu)"
	  annotation (Placement(transformation(extent={{-164,-14},{-138,12}}), iconTransformation(extent={{-166,84},{-134,116}})));
	Modelica.Blocks.Interfaces.RealInput FSR "Governor Output" annotation (Placement(transformation(extent={{-110,-64},{-82,-36}}), iconTransformation(extent={{-168,-118},{-134,-84}})));
	Modelica.Blocks.Interfaces.RealOutput PMECH
	  "Turbine mechanical power (pu)"
	  annotation (Placement(transformation(extent={{116,50},{134,68}}), iconTransformation(extent={{140,-12},{164,12}})));
	OpenIPSL.NonElectrical.Continuous.SimpleLag s5(
	  T=Tfload,
	  y_start=s50,
	  K=1) annotation (Placement(transformation(
	      extent={{-10,10},{10,-10}},
	      rotation=180,
	      origin={-112,124})));
	OpenIPSL.NonElectrical.Continuous.LeadLag s9(
	  T1=Tsa,
	  T2=Tsb,
	  y_start=s90,
	  K=1) annotation (Placement(transformation(extent={{-64,114},{-84,134}})));
	Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
	      extent={{-10,-10},{10,10}},
	      rotation=180,
	      origin={-46,124})));
	Modelica.Blocks.Interfaces.RealOutput TEXM
	  "Measured Exhaust Temperature"
	  annotation (Placement(transformation(extent={{-140,114},{-160,134}}), iconTransformation(
	      extent={{-12,-12},{12,12}},
	      rotation=90,
	      origin={0,152})));
	Modelica.Blocks.Interfaces.RealOutput VSTROKE "Valve Position"
	  annotation (Placement(transformation(extent={{-46,-116},{-66,-96}}), iconTransformation(
	      extent={{-12,-12},{12,12}},
	      rotation=0,
	      origin={152,-100})));
	Modelica.Blocks.Interfaces.RealInput PELEC
	  "Machine electrical power (pu)"
	  annotation (Placement(transformation(
	      extent={{-15,-15},{15,15}},
	      rotation=90,
	      origin={101,-35}), iconTransformation(extent={{-164,-14},{-134,16}})));
	Modelica.Blocks.Sources.Constant const(k=Wfnl) annotation (Placement(transformation(extent={{76,-84},{56,-64}})));
	Modelica.Blocks.Math.Add Dw2w annotation (Placement(transformation(extent={{-108,12},{-88,32}})));
	Modelica.Blocks.Sources.Constant const1(k=1) annotation (Placement(transformation(extent={{-138,32},{-124,46}})));
	initial equation
	Pmech0 = PELEC;
	s30 = fsr0;
	s40 = Pmech0;
	s50 = s90;
	s90 = fsr0;
	fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

	equation
	connect(s4.y, add5.u2) annotation (Line(
	    points={{40,77},{40,90},{62,90}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(product.y, add4.u1) annotation (Line(
	    points={{32.6,-56},{36,-56},{36,-41.2},{36.4,-41.2}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(gain2.y, add5.u1) annotation (Line(
	    points={{30.8,102},{62,102}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(flag10.y, product.u2) annotation (Line(
	    points={{18.2,-95},{18.2,-59.6},{18.8,-59.6}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(dm_select.y, gain2.u) annotation (Line(
	    points={{5,101.8},{12.4,101.8},{12.4,102}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(V1.y, s3.u) annotation (Line(
	    points={{-19.3,-53},{-11.4,-53}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(Tactgain.y, V1.u) annotation (Line(
	    points={{-39.5,-53},{-35.4,-53}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(add8.y, Tactgain.u) annotation (Line(
	    points={{-55.4,-54},{-55.4,-53},{-51,-53}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(s3.y, product.u1) annotation (Line(
	    points={{4.7,-53},{9.35,-53},{9.35,-52.4},{18.8,-52.4}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(add8.u2, product.u1) annotation (Line(
	    points={{-69.2,-57.6},{-76,-57.6},{-76,-86},{10,-86},{10,-52.4},{18.8,-52.4}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(s4.u, gain1.y) annotation (Line(
	    points={{40,54},{40,44.8}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(delay.y, gain1.u) annotation (Line(points={{40,15.4},{40,26.4}}, color={0,0,127}));
	connect(delay.u, add4.y) annotation (Line(points={{40,-16.8},{40,-27.4}}, color={0,0,127}));
	connect(add5.y, PMECH) annotation (Line(points={{85,96},{90,96},{90,59},{125,59}}, color={0,0,127}));
	connect(s5.u, s9.y) annotation (Line(
	    points={{-100,124},{-85,124}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(product1.u2, gain2.u) annotation (Line(
	    points={{-34,130},{12.4,130},{12.4,102}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(product1.u1, add4.u1)
	  annotation (Line(
	    points={{-34,118},{-26,118},{-26,-32},{14,-32},{14,-44},{36,-44},{36,-42},{36.4,-42},{36.4,-41.2}},
	    color={0,0,127},
	    smooth=Smooth.None));
	connect(s9.u, product1.y) annotation (Line(points={{-62,124},{-57,124}}, color={0,0,127}));
	connect(s5.y, TEXM) annotation (Line(points={{-123,124},{-130,124},{-150,124}}, color={0,0,127}));
	connect(add8.u1, FSR) annotation (Line(points={{-69.2,-50.4},{-82.6,-50.4},{-82.6,-50},{-96,-50}}, color={0,0,127}));
	connect(VSTROKE, product.u1) annotation (Line(points={{-56,-106},{-32,-106},{-32,-86},{10,-86},{10,-52.4},{18.8,-52.4}}, color={0,0,127}));
	connect(const.y, add4.u2) annotation (Line(points={{55,-74},{43.6,-74},{43.6,-41.2}}, color={0,0,127}));
	connect(SPEED, Dw2w.u2) annotation (Line(points={{-151,-1},{-130,-1},{-130,16},{-110,16}}, color={0,0,127}));
	connect(const1.y, Dw2w.u1) annotation (Line(points={{-123.3,39},{-120,39},{-120,28},{-110,28}}, color={0,0,127}));
	connect(Dw2w.y, dm_select.speed) annotation (Line(points={{-87,22},{-60,22},{-60,101.8},{-18,101.8}}, color={0,0,127}));
	connect(flag10.speed, dm_select.speed) annotation (Line(points={{18.2,-118},{18.2,-130},{-120,-130},{-120,-20},{-60,-20},{-60,101.8},{-18,101.8}}, color={0,0,127}));
	annotation (
	  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,140}}), graphics={Text(
	                  extent={{-10,-72},{0,-80}},
	                  lineColor={255,0,0},
	                  textString="s3"),Text(
	                  extent={{48,88},{58,80}},
	                  lineColor={255,0,0},
	                  textString="s4"),Text(
	                  extent={{-96,138},{-86,130}},
	                  lineColor={255,0,0},
	                  textString="s9"),Text(
	                  extent={{-134,138},{-124,130}},
	                  lineColor={255,0,0},
	                  textString="s5")}),
	  Icon(coordinateSystem(extent={{-140,-140},{140,140}}, preserveAspectRatio=false), graphics={Rectangle(extent={{-140,140},{140,-140}}, lineColor={0,0,255}),Text(
	                  extent={{-64,42},{58,-40}},
	                  lineColor={28,108,200},
	                  textString="Turbine
	Model"),          Text(
	        extent={{-130,112},{-74,88}},
	                  lineColor={28,108,200},
	                  textString="SPEED"),Text(
	                  extent={{-138,-92},{-92,-112}},
	                  lineColor={28,108,200},
	                  textString="FSR"),Text(
	                  extent={{80,12},{136,-12}},
	                  lineColor={28,108,200},
	                  textString="PMECH"),Text(
	                  extent={{-24,136},{28,116}},
	                  lineColor={28,108,200},
	                  textString="TEXM"),Text(
	                  extent={{66,-88},{132,-114}},
	                  lineColor={28,108,200},
	                  textString="VSTROKE"),Text(
	                  extent={{-132,12},{-76,-12}},
	                  lineColor={28,108,200},
	                  textString="PELEC")}),
	  Documentation(revisions="<html>
	<!--DISCLAIMER-->
	<p>OpenIPSL:</p>
	<p>Copyright 2016 SmarTS Lab (Sweden)</p>
	<ul>
	<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
	</ul>
	<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

	<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
	<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

	<p></p>
	<p>iPSL:</p>
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
	</html>
	"));
end Turbine;