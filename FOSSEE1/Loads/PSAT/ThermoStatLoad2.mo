within FOSSEE1.Loads.PSAT;
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
    annotation (Placement(transformation(extent={{-40,-40},{-60,-20}})));
  Modelica.Blocks.Math.Gain gain(k=K1)
                                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={20,-24})));
  Modelica.Blocks.Math.Gain gain1(k=Kp)
                                 annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=180,
        origin={-20.5,60})));
  Modelica.Blocks.Math.Add add(k2=-1, k1=+1)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Continuous.LimIntegrator
                                    Limiter(outMax=Gmax, outMin=Gmin,
    k=Ki/Ti,
    limitsAtInit=true,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=G0 - (Kp*(T_ref - T0)))
    annotation (Placement(transformation(extent={{-12,14},{0,26}})));
  Modelica.Blocks.Interfaces.RealInput t_ref
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput t_a
                                          annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-60})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,-24})));
  Modelica.Blocks.Math.Add add1(k2=+1, k1=+1)
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Modelica.Blocks.Nonlinear.Limiter Limiter1(strict=false,
    uMax=Gmax,
    uMin=Gmin)
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
protected
  Modelica.Blocks.Math.Add add4(k2=+1, k1=+1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-18,-30})));
public
  Modelica.Blocks.Math.Gain gain2(k=K3)
                                 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-36,20})));
initial equation
  //v0 = V;
 // t_a= Ta;
equation
    product.u1 = v*v;
    v=sqrt(p.vr^2 + p.vi^2);
    //product.u1 = v0*v0;
    P=(Limiter1.y)*(v^2);
    Q = Q_0/S_b; // in p
  connect(add.u2, firstOrder.y) annotation (Line(points={{-82,34},{-90,34},{-90,-30},{-61,-30}},
                                    color={0,0,127}));
  connect(t_ref, add.u1) annotation (Line(points={{-120,60},{-88,60},{-88,46},{-82,46}},
                        color={0,0,127}));
  connect(product.y, gain.u) annotation (Line(points={{49,-24},{32,-24}},
                                color={0,0,127}));
  connect(gain1.y, add1.u1) annotation (Line(points={{-8.95,60},{11.375,60},{11.375,46},{18,46}},
                                     color={0,0,127}));
  connect(Limiter.y, add1.u2) annotation (Line(points={{0.6,20},{12,20},{12,34},{18,34}},
                        color={0,0,127}));
  connect(add1.y, Limiter1.u)
    annotation (Line(points={{41,40},{58,40}},     color={0,0,127}));
  connect(Limiter1.y, product.u2) annotation (Line(points={{81,40},{90,40},{90,-18},{72,-18}},
                                color={0,0,127}));
  connect(gain.y, add4.u2) annotation (Line(points={{9,-24},{-6,-24}},
                                       color={0,0,127}));
  connect(add4.u1, t_a) annotation (Line(points={{-6,-36},{0,-36},{0,-60},{-120,-60}},
                                 color={0,0,127}));
  connect(firstOrder.u, add4.y) annotation (Line(points={{-38,-30},{-29,-30}},
                                           color={0,0,127}));
  connect(gain1.u, add.y) annotation (Line(points={{-33.1,60},{-50,60},{-50,40},{-59,40}},
                           color={0,0,127}));
  connect(gain2.u, add.y) annotation (Line(points={{-43.2,20},{-50,20},{-50,40},{-59,40}},
                       color={0,0,127}));
  connect(gain2.y, Limiter.u)
    annotation (Line(points={{-29.4,20},{-13.2,20}}, color={0,0,127}));
  annotation (                              Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(
        graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}));
end ThermoStatLoad2;
