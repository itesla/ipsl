within iPSL.Electrical.Controls.Eurostag;
model pss2ab
//PSS2AB PSS2AB_1(KS1=12.,KS2=0.208,KS3=1.,M=2.,N=1.,T1=0.22,T2=0.03,T3=.2600000,T4=0.027,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_2(KS1=10.,KS2=0.1538,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_3(KS1=10.,KS2=0.162,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_4(KS1=10.,KS2=0.1666,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_5(KS1=10.,KS2=0.1587,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_6(KS1=10.,KS2=0.2,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_7(KS1=10.,KS2=.1633000,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_8(KS1=10.,KS2=0.1564,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_9(KS1=10.,KS2=0.149,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_10(KS1=10.,KS2=0.1742,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
//PSS2AB PSS2AB_11(KS1=10.,KS2=0.1804,KS3=1.,M=0.,N=0.,T1=0.25,T2=0.03,T3=.1500000,T4=0.015,T7=2.,TW1=2.,TW2=2.,TW3=2.,VSTMAX=0.1,VSTMIN=-0.1);
  parameter Real init_11=0.;
  parameter Real init_4=init_IN;
  parameter Real init_5=0;
  parameter Real init_2=init_AP;
  parameter Real init_8=0;
  parameter Real init_19=0;
  parameter Real init_20=0;
  parameter Real KS1;
  parameter Real KS2;
  parameter Real KS3;
  parameter Real M;
  parameter Real N;
  parameter Real T1;
  parameter Real T2;
  parameter Real T3;
  parameter Real T4;
  parameter Real T7;
  parameter Real TW1;
  parameter Real TW2;
  parameter Real TW3;
  parameter Real VSTMAX;
  parameter Real VSTMIN;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  parameter Real init_IN;
  parameter Real init_AP;
  Modelica.Blocks.Nonlinear.Limiter Limiter_11 (uMax=VSTMAX, uMin=VSTMIN); //Eurostag Block number: 11
  Modelica.Blocks.Continuous.Derivative Derivative_4 (k=TW1, T=TW1, y_start=0, x_start=init_4, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 4
  Modelica.Blocks.Continuous.Derivative Derivative_5 (k=TW2, T=TW2, y_start=0, x_start=init_5, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 5
  Modelica.Blocks.Continuous.Derivative Derivative_2 (k=TW3, T=TW3, y_start=0, x_start=init_2, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 2
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_8 (K=KS2, T=T7, y_start=init_8, initType = Modelica.Blocks.Types.Init.InitialOutput); //Eurostag Block number: 8
  Modelica.Blocks.Math.MultiSum MultiSum_9 (nu =3, k={1, 1, M}); //Eurostag Block number: 9
  Modelica.Blocks.Math.Gain Gain_10 (k=KS3); //Eurostag Block number: 10
  Modelica.Blocks.Math.MultiSum MultiSum_17 (nu =3, k={1, -1, N}); //Eurostag Block number: 17
  Modelica.Blocks.Math.Gain Gain_18 (k=KS1); //Eurostag Block number: 18
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_19 (K=1, T1=T1, T2=T2, y_start=init_19); //Eurostag Block number: 19
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_20 (K=1, T1=T3, T2=T4, y_start=init_20); //Eurostag Block number: 20
  Modelica.Blocks.Interfaces.RealInput pin_ActivePowerSN;
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_VS;
  Modelica.Blocks.Interfaces.RealOutput pin_At_4; //At_IN
  Modelica.Blocks.Interfaces.RealOutput pin_At_5;//Start = 0
  Modelica.Blocks.Interfaces.RealOutput pin_At_2; //At_AP
  Modelica.Blocks.Interfaces.RealOutput pin_At_8;//Start = 0
  Modelica.Blocks.Interfaces.RealOutput pin_At_19;//Start = 0
  Modelica.Blocks.Interfaces.RealOutput pin_At_20;//Start = 0
equation
  connect(MultiSum_9.y, MultiSum_17.u[1]);
  connect(pin_ActivePowerSN, Derivative_2.u);
  connect(Derivative_4.y, Derivative_5.u);
  connect(SimpleLag_8.y, Gain_10.u);
  connect(Gain_10.y, MultiSum_9.u[2]);
  connect(SimpleLag_8.y, MultiSum_17.u[2]);
  connect(MultiSum_17.y, Gain_18.u);
  connect(Gain_18.y, LeadLag_19.u);
  connect(LeadLag_19.y, LeadLag_20.u);
  connect(LeadLag_20.y, Limiter_11.u);
  connect(Derivative_5.y, MultiSum_9.u[1]);
  connect(Derivative_2.y, SimpleLag_8.u);
  connect(pin_OMEGA, Derivative_4.u);
  connect(pin_VS, Limiter_11.y);
  connect(pin_At_4, Derivative_4.y);
  connect(pin_At_5, Derivative_5.y);
  connect(pin_At_2, Derivative_2.y);
  connect(pin_At_8, SimpleLag_8.y);
  connect(pin_At_19, LeadLag_19.y);
  connect(pin_At_20, LeadLag_20.y);
  MultiSum_9.u[3] =1;
  MultiSum_17.u[3] =1;
end pss2ab;