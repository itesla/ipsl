within iPSL.Electrical.Controls.Eurostag;
model gsteam1 
//GSTEAM1 GSTEAM1_1(F1={0.,0.,.4000000,0.75,0.5,.9100000,.6000000,.9800000,1.,1.},DB1=0.,DB2=0.,K=25.,K1=0.2,K2=0.,K3=.3000000,K4=0.,K5=0.5,K6=0.,K7=0.,K8=0.,PMAX=1.,PMIN=0.,SDB1=1.,SDB2=1.,T1=0.,T2=0.,T3=0.1,T4=.3000000,T5=5.,T6=0.5,T7=0.,UC=-10.,UO=1.,VALVE=0.);
//GSTEAM1 GSTEAM1_2(F1={0.,0.,.4000000,0.75,0.5,.9100000,.6000000,.9800000,1.,1.},DB1=0.,DB2=0.,K=20.,K1=0.208,K2=0.,K3=.3320000,K4=0.,K5=0.461,K6=0.,K7=0.,K8=0.,PMAX=1.100000,PMIN=0.,SDB1=1.,SDB2=1.,T1=0.,T2=0.,T3=.1500000,T4=.4360000,T5=.2580000,T6=.5530000,T7=0.,UC=-0.012,UO=0.012,VALVE=0.);
//GSTEAM1 GSTEAM1_3(F1={0.,0.,.4000000,0.75,0.5,.9100000,.6000000,.9800000,1.,1.},DB1=0.,DB2=0.,K=25.,K1=.3000000,K2=0.,K3=.4000000,K4=0.,K5=.3000000,K6=0.,K7=0.,K8=0.,PMAX=1.,PMIN=.3000000,SDB1=1.,SDB2=1.,T1=0.25,T2=0.001,T3=0.1,T4=.3000000,T5=10.,T6=.4000000,T7=0.001,UC=-0.1,UO=0.1,VALVE=0.);
  parameter Real init_3 = init_CM;
  parameter Real init_4 = init_CM;
  parameter Real init_6 = init_CM;
  parameter Real init_8 = init_CM;
  parameter Real init_9 = init_CM;
  parameter Real init_11 = init_CM2;
  parameter Real init_12 = 0;
  parameter Real init_14 = init_PGV;
  parameter Real init_17 = init_PGV;
  parameter Real init_23 = init_CM;
  parameter Real init_24 = init_CM;
  parameter Real init_26 = SDB1;
  parameter Real init_5 = SDB2;
  parameter Real[:] F1;
  parameter Real DB1;
  parameter Real DB2;
  parameter Real K;
  parameter Real K1;
  parameter Real K2;
  parameter Real K3;
  parameter Real K4;
  parameter Real K5;
  parameter Real K6;
  parameter Real K7;
  parameter Real K8;
  parameter Real PMAX;
  parameter Real PMIN;
  parameter Real SDB1;
  parameter Real SDB2;
  parameter Real T1;
  parameter Real T2;
  parameter Real T3;
  parameter Real T4;
  parameter Real T5;
  parameter Real T6;
  parameter Real T7;
  parameter Real UC;
  parameter Real UO;
  parameter Real VALVE;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  parameter Real init_OMEGREF;
  parameter Real init_CM;
  parameter Real init_CM2;
  parameter Real init_PGV;
  Modelica.Blocks.Math.MultiSum MultiSum_1 (nu =2, k={K1, K3}); //Eurostag Block number: 1
  Modelica.Blocks.Math.MultiSum MultiSum_2 (nu =2, k={K4, K2}); //Eurostag Block number: 2
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_3 (K=1., T=T6, y_start=init_3, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 3
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_4 (K=1., T=T5, y_start=init_4, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 4
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_6 (K=1.0, T=T4, y_start=init_6, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 6
  Modelica.Blocks.Math.MultiSum MultiSum_7 (nu =2, k={1., K5}); //Eurostag Block number: 7
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_8 (K=1., T=T7, y_start=init_8, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 8
  Modelica.Blocks.Math.MultiSum MultiSum_9 (nu =2, k={1., K7}, y(start =init_9)); //Eurostag Block number: 9
  Modelica.Blocks.Math.MultiSum MultiSum_10 (nu =2, k={K6, 1.}); //Eurostag Block number: 10
  Modelica.Blocks.Math.MultiSum MultiSum_11 (nu =2, k={K8*PN, PN}, y(start =init_11)); //Eurostag Block number: 11
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_12 (K=K, T1=T2, T2=T1, y_start=init_12); //Eurostag Block number: 12
  Modelica.Blocks.Math.MultiSum MultiSum_13 (nu =2, k={-1., init_OMEGREF}); //Eurostag Block number: 13
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_14 (V=init_14); //Eurostag Block number: 14
  Modelica.Blocks.Math.MultiSum MultiSum_15 (nu =3, k={1., 1., -1.}); //Eurostag Block number: 15
  Modelica.Blocks.Math.Gain Gain_16 (k=1/T3); //Eurostag Block number: 16
  Modelica.Blocks.Continuous.LimIntegrator LimIntegrator_17 (outMax=PMAX, k=1., outMin=PMIN, y_start=init_17); //Eurostag Block number: 17
  Modelica.Blocks.Nonlinear.Limiter Limiter_19 (uMax=UO, uMin=UC); //Eurostag Block number: 19
  iPSL.NonElectrical.Logical.Relay Relay_21; //Eurostag Block number: 21
  iPSL.NonElectrical.Eurostag.ImFunction ImFunction_18 (v=F1); //Eurostag Block number: 18
  Modelica.Blocks.Sources.Constant Constant_22 (k=VALVE); //Eurostag Block number: 22
  Modelica.Blocks.Math.MultiSum MultiSum_23 (nu =2, k={1, 1}, y(start =init_23)); //Eurostag Block number: 23
  iPSL.NonElectrical.Eurostag.Continuous.ImDiv2 ImDiv2_24 (a1=1, a2=1, a0=0, y_start=init_24, StartValue=true); //Eurostag Block number: 24
  Modelica.Blocks.Nonlinear.DeadZone DeadZone_25 (uMax=DB1, uMin=-DB1); //Eurostag Block number: 25
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_26 (V=init_26); //Eurostag Block number: 26
  iPSL.NonElectrical.Logical.Relay Relay_27; //Eurostag Block number: 27
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_5 (V=init_5); //Eurostag Block number: 5
  Modelica.Blocks.Nonlinear.DeadZone DeadZone_20 (uMax=DB2, uMin=-DB2); //Eurostag Block number: 20
  iPSL.NonElectrical.Logical.Relay Relay_28; //Eurostag Block number: 28
  Modelica.Blocks.Nonlinear.DeadZone DeadZone_29 (uMax=DB2, uMin=-DB2); //Eurostag Block number: 29
  iPSL.NonElectrical.Logical.Relay Relay_30; //Eurostag Block number: 30
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_FHP; //CM
  Modelica.Blocks.Interfaces.RealOutput pin_PMHP; //CM
  Modelica.Blocks.Interfaces.RealOutput pin_PMLP; //CM2
  Modelica.Blocks.Interfaces.RealOutput pin_PMECH; //CM
  Modelica.Blocks.Interfaces.RealOutput pin_CM; //CM
  Modelica.Blocks.Interfaces.RealOutput pin_At_A;
  iPSL.Interfaces.AddedConnector setPointModification_14;
  iPSL.Interfaces.AddedConnector setPointModification_5;
  iPSL.Interfaces.AddedConnector setPointModification_26;

equation
  connect(LeadLag_12.y, MultiSum_15.u[2]);
  connect(ImSetPoint_14.y, MultiSum_15.u[1]);
  connect(ImSetPoint_14.setPointModification, setPointModification_14);
  connect(MultiSum_13.y, DeadZone_25.u);
  connect(MultiSum_13.y, Relay_27.u3);
  connect(Relay_27.y, LeadLag_12.u);
  connect(DeadZone_25.y, Relay_27.u2);
  connect(ImSetPoint_26.y, Relay_27.u1);
  connect(ImSetPoint_26.setPointModification, setPointModification_26);
  connect(Relay_21.y, SimpleLag_6.u);
  connect(ImFunction_18.y, Relay_21.u2);
  connect(Constant_22.y, Relay_21.u1);
  connect(MultiSum_15.y, Gain_16.u);
  connect(Gain_16.y, Limiter_19.u);
  connect(Limiter_19.y, LimIntegrator_17.u);
  connect(LimIntegrator_17.y, DeadZone_20.u);
  connect(DeadZone_20.y, Relay_28.u2);
  connect(ImSetPoint_5.y, Relay_28.u1);
  connect(LimIntegrator_17.y, Relay_28.u3);
  connect(Relay_28.y, Relay_30.u2);
  connect(Relay_28.y, DeadZone_29.u);
  connect(DeadZone_29.y, Relay_30.u3);
  connect(Relay_30.y, Relay_21.u3);
  connect(Relay_30.y, ImFunction_18.u);
  connect(ImSetPoint_5.y, Relay_30.u1);
  connect(ImSetPoint_5.setPointModification, setPointModification_5);
  connect(MultiSum_9.y, MultiSum_23.u[1]);
  connect(MultiSum_11.y, MultiSum_23.u[2]);
  connect(SimpleLag_4.y, SimpleLag_3.u);
  connect(SimpleLag_4.y, MultiSum_1.u[2]);
  connect(SimpleLag_4.y, MultiSum_2.u[1]);
  connect(SimpleLag_6.y, MultiSum_1.u[1]);
  connect(SimpleLag_6.y, MultiSum_2.u[2]);
  connect(SimpleLag_6.y, SimpleLag_4.u);
  connect(MultiSum_7.y, MultiSum_9.u[1]);
  connect(MultiSum_10.y, MultiSum_11.u[2]);
  connect(SimpleLag_8.y, MultiSum_9.u[2]);
  connect(SimpleLag_8.y, MultiSum_11.u[1]);
  connect(SimpleLag_3.y, MultiSum_7.u[2]);
  connect(MultiSum_1.y, MultiSum_7.u[1]);
  connect(SimpleLag_3.y, SimpleLag_8.u);
  connect(MultiSum_2.y, MultiSum_10.u[2]);
  connect(SimpleLag_3.y, MultiSum_10.u[1]);
  connect(MultiSum_23.y, ImDiv2_24.u1);
  connect(pin_OMEGA, MultiSum_13.u[1]);
  connect(pin_At_A, MultiSum_15.u[3]);
  connect(pin_OMEGA, ImDiv2_24.u2);
  connect(pin_FHP, SimpleLag_6.y);
  connect(pin_PMHP, MultiSum_9.y);
  connect(pin_PMLP, MultiSum_11.y);
  connect(pin_PMECH, MultiSum_23.y);
  connect(pin_CM, ImDiv2_24.y);
  connect(pin_At_A, Relay_28.y);
  MultiSum_13.u[2] = 1;
end gsteam1;