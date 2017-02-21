within iPSL.Electrical.Controls.Eurostag;
model tgov1
//TGOV1 TGOV1_1(DT=0.,RR=0.05,T1=0.5,T2=3.,T3=10.,VMAX=1.010000,VMIN=0.);
//TGOV1 TGOV1_2(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_3(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_4(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_5(DT=0.,RR=0.05,T1=.4900000,T2=2.100000,T3=7.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_6(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_7(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_8(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_9(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_10(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_11(DT=0.,RR=0.011,T1=.4900000,T2=2.730000,T3=9.990000,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_12(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_13(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_14(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_15(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_16(DT=0.,RR=0.05,T1=.4000000,T2=2.,T3=6.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_17(DT=0.,RR=0.011,T1=.4900000,T2=2.730000,T3=9.990000,VMAX=1.,VMIN=.3000000);
//TGOV1 TGOV1_18(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=0.25);
//TGOV1 TGOV1_19(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_20(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.,VMAX=1.,VMIN=.2900000);
//TGOV1 TGOV1_21(DT=0.,RR=0.05,T1=.4000000,T2=1.,T3=4.,VMAX=1.,VMIN=.2700000);
//TGOV1 TGOV1_22(DT=0.,RR=0.05,T1=.4900000,T2=3.,T3=9.990000,VMAX=1.,VMIN=.3000000);
//TGOV1 TGOV1_23(DT=.3000000,RR=0.04,T1=.3000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_24(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_25(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_26(DT=.3000000,RR=0.06,T1=0.05,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_27(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_28(DT=.3000000,RR=0.04,T1=.3000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_29(DT=0.,RR=0.05,T1=.4000000,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
//TGOV1 TGOV1_30(DT=.3000000,RR=0.08,T1=0.05,T2=1.5,T3=5.,VMAX=1.,VMIN=0.);
  parameter Real init_3=init_REF;
  parameter Real init_4=init_PMECH;
  parameter Real init_5=init_PMECH;
  parameter Real init_8=init_PMECH;
  parameter Real init_10=init_CM;
  parameter Real init_11=0;
  parameter Real DT;
  parameter Real RR;
  parameter Real T1;
  parameter Real T2;
  parameter Real T3;
  parameter Real VMAX;
  parameter Real VMIN;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  parameter Real init_REF;
  parameter Real init_PMECH;
  parameter Real init_CM;
  Modelica.Blocks.Math.Gain Gain_1 (k = 1 / RR); //Eurostag Block number: 1
  Modelica.Blocks.Math.MultiSum MultiSum_2( nu= 2, k={1, -1}); //Eurostag Block number: 2
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_3( V=init_3); //Eurostag Block number: 3
  iPSL.NonElectrical.Continuous.SimpleLagLim SimpleLagLim_4( outMax=VMAX, K=1, T=T1, outMin=VMIN, y_start=init_4); //Eurostag Block number: 4
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_5( K=1, T1=T2, T2=T3, y_start=init_5); //Eurostag Block number: 5
  Modelica.Blocks.Math.Gain Gain_6( k=DT); //Eurostag Block number: 6
  Modelica.Blocks.Math.MultiSum MultiSum_7( nu= 2, k={1, -1}); //Eurostag Block number: 7
  Modelica.Blocks.Math.MultiSum MultiSum_8( nu= 2, k={+1, -1}, y(start= init_8)); //Eurostag Block number: 8
  iPSL.NonElectrical.Eurostag.Continuous.ImDiv2 ImDiv2_9( a1=1, a2=1, a0=0, StartValue=false); //Eurostag Block number: 9
  Modelica.Blocks.Math.MultiSum MultiSum_10( nu= 2, k={1, 1}, y(start= init_10)); //Eurostag Block number: 10
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_11( V=init_11); //Eurostag Block number: 11
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_PMECH; //PMECH
  Modelica.Blocks.Interfaces.RealOutput pin_CM; //CM
  Modelica.Blocks.Interfaces.RealOutput pin_CMREF;//Start = 0
  iPSL.Interfaces.AddedConnector setPointModification_3;
  iPSL.Interfaces.AddedConnector setPointModification_11;
equation
  connect(ImSetPoint_3.y, MultiSum_2.u[1]);
  connect(ImSetPoint_3.setPointModification, setPointModification_3);
  connect(MultiSum_2.y, Gain_1.u);
  connect(Gain_1.y, SimpleLagLim_4.u);
  connect(SimpleLagLim_4.y, LeadLag_5.u);
  connect(LeadLag_5.y, MultiSum_8.u[1]);
  connect(MultiSum_8.y, ImDiv2_9.u1);
  connect(Gain_6.y, MultiSum_8.u[2]);
  connect(MultiSum_7.y, Gain_6.u);
  connect(MultiSum_7.y, MultiSum_2.u[2]);
  connect(ImDiv2_9.y, MultiSum_10.u[1]);
  connect(ImSetPoint_11.y, MultiSum_10.u[2]);
  connect(ImSetPoint_11.setPointModification, setPointModification_11);
  connect(pin_OMEGA, MultiSum_7.u[1]);
  connect(pin_OMEGA, ImDiv2_9.u2);
  connect(pin_PMECH, MultiSum_8.y);
  connect(pin_CM, MultiSum_10.y);
  connect(pin_CMREF, ImSetPoint_11.y);
  MultiSum_7.u[2] =1;
end tgov1;
