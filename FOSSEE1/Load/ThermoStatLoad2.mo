within FOSSEE1.Load;
model ThermoStatLoad2 "Thermostatically Controlled Load"
  extends OpenIPSL.Electrical.Loads.PSAT.BaseClasses.baseLoad;
  //parameter Real Gmin=0 "Minimum conductance";
  parameter Real Kl=2 "ceiling conductance output";
  parameter Real Kp=10 "gain of the proportional controller (pu/pu)";
  parameter Real Ki=25 "gain of the integral controller (pu/pu)";
  parameter Real Ti=10 "time constant of integral controller in seconds";
  parameter Real T1=1200 "Time constant of the thermal load in seconds";
  //parameter Real Ta=t_a "ambient temperature";
  parameter Real T_ref= 70      "reference temperature";
  //parameter Real V=1.2 "initial bus voltage in pu";
  //parameter Real P0=1.2 "bus active power in MW";
  parameter Real T0=10 "No idea what is it, probably initial temperature";
  parameter Real G0 = P_0/(100*V_0*V_0); //0.040539357 "initial conductance I guess"; //changing G0 and K1 doesnot compile the model
  parameter Real Gmax = Kl*G0 "Maximum conductance";
  parameter Real Gmin = 0 "Minimum conductance";
  parameter Real K1 = (T_ref-T0)/P_0 "active power gain (pu/pu)";
  parameter Real K3=1 "gain anti wind-up";
  Real v(start=1*V_0);
 // Real P1(start=P_0);
  //adding PQ feature
 // parameter Modelica.SIunits.PerUnit Vmax=1.2 "maximum voltage";
//  parameter Modelica.SIunits.PerUnit Vmin=0.8 "minimum voltage";
 // parameter Boolean forcePQ=true;
public
  OpenIPSL.NonElectrical.Continuous.SimpleLag
                                        firstOrder(
    K=1,
    T=T1,
    y_start=0)
    annotation (Placement(transformation(extent={{-44,-24},{-60,-7}})));
  Modelica.Blocks.Math.Gain gain(k=K1)
                                 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={15,-7})));
  Modelica.Blocks.Math.Gain gain1(k=Kp)
                                 annotation (Placement(transformation(
        extent={{7.5,-7.5},{-7.5,7.5}},
        rotation=180,
        origin={-23.5,60.5})));
  Modelica.Blocks.Math.Add add(k2=-1, k1=+1)
    annotation (Placement(transformation(extent={{-78,34},{-62,50}})));
  Modelica.Blocks.Continuous.LimIntegrator
                                    Limiter(outMax=Gmax, outMin=Gmin,
    k=Ki/Ti,
    limitsAtInit=true,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=G0 - (Kp*(T_ref - T0)))
    annotation (Placement(transformation(extent={{-16,18},{-4,30}})));
  Modelica.Blocks.Interfaces.RealInput t_ref
    annotation (Placement(transformation(extent={{-110,66},{-90,86}})));
  Modelica.Blocks.Interfaces.RealInput t_a
                                          annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-12,-100})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={43,-7})));
  Modelica.Blocks.Math.Add add1(k2=+1, k1=+1)
    annotation (Placement(transformation(extent={{24,34},{42,52}})));
  Modelica.Blocks.Nonlinear.Limiter Limiter1(strict=false,
    uMax=Gmax,
    uMin=Gmin)
    annotation (Placement(transformation(extent={{54,36},{68,50}})));
protected
  Modelica.Blocks.Math.Add add4(k2=+1, k1=+1)
    annotation (Placement(transformation(extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-21,-19})));
public
  Modelica.Blocks.Math.Gain gain2(k=K3)
                                 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-40,24})));
initial equation
  //v0 = V;
 // t_a= Ta;
equation
    product.u1 = v*v;
    v=sqrt(p.vr^2 + p.vi^2);
    //product.u1 = v0*v0;
    P=(Limiter1.y)*(v^2);
    Q = Q_0/S_b; // in p
  connect(add.u2, firstOrder.y) annotation (Line(points={{-79.6,37.2},{-84,37.2},
          {-84,-15.5},{-60.8,-15.5}},
                                    color={0,0,127}));
  connect(t_ref, add.u1) annotation (Line(points={{-100,76},{-84,76},{-84,46.8},{
          -79.6,46.8}}, color={0,0,127}));
  connect(product.y, gain.u) annotation (Line(points={{35.3,-7},{21,-7}},
                                color={0,0,127}));
  connect(gain1.y, add1.u1) annotation (Line(points={{-15.25,60.5},{11.375,60.5},
          {11.375,48.4},{22.2,48.4}},color={0,0,127}));
  connect(Limiter.y, add1.u2) annotation (Line(points={{-3.4,24},{12,24},{12,
          37.6},{22.2,37.6}},
                        color={0,0,127}));
  connect(add1.y, Limiter1.u)
    annotation (Line(points={{42.9,43},{42.9,43},{52.6,43}},
                                                   color={0,0,127}));
  connect(Limiter1.y, product.u2) annotation (Line(points={{68.7,43},{82,43},{
          82,-2.8},{51.4,-2.8}},color={0,0,127}));
  connect(gain.y, add4.u2) annotation (Line(points={{9.5,-7},{1.125,-7},{1.125,-14.8},
          {-12.6,-14.8}},              color={0,0,127}));
  connect(add4.u1, t_a) annotation (Line(points={{-12.6,-23.2},{0,-23.2},{0,-68},
          {-12,-68},{-12,-100}}, color={0,0,127}));
  connect(firstOrder.u, add4.y) annotation (Line(points={{-42.4,-15.5},{-33.2,-15.5},
          {-33.2,-19},{-28.7,-19}},        color={0,0,127}));
  connect(gain1.u, add.y) annotation (Line(points={{-32.5,60.5},{-54,60.5},{-54,
          42},{-61.2,42}}, color={0,0,127}));
  connect(gain2.u, add.y) annotation (Line(points={{-47.2,24},{-54,24},{-54,42},
          {-61.2,42}}, color={0,0,127}));
  connect(gain2.y, Limiter.u)
    annotation (Line(points={{-33.4,24},{-17.2,24}}, color={0,0,127}));
  annotation (                              Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(
        graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}));
end ThermoStatLoad2;
