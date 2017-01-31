within iPSL.Electrical.Controls.Eurostag;
model gsteam1_Init
//GSTEAM1 GSTEAM1_1(F1={0.,0.,.4000000,0.75,0.5,.9100000,.6000000,.9800000,1.,1.},DB1=0.,DB2=0.,K=25.,K1=0.2,K2=0.,K3=.3000000,K4=0.,K5=0.5,K6=0.,K7=0.,K8=0.,PMAX=1.,PMIN=0.,SDB1=1.,SDB2=1.,T1=0.,T2=0.,T3=0.1,T4=.3000000,T5=5.,T6=0.5,T7=0.,UC=-10.,UO=1.,VALVE=0.);
//GSTEAM1 GSTEAM1_2(F1={0.,0.,.4000000,0.75,0.5,.9100000,.6000000,.9800000,1.,1.},DB1=0.,DB2=0.,K=20.,K1=0.208,K2=0.,K3=.3320000,K4=0.,K5=0.461,K6=0.,K7=0.,K8=0.,PMAX=1.100000,PMIN=0.,SDB1=1.,SDB2=1.,T1=0.,T2=0.,T3=.1500000,T4=.4360000,T5=.2580000,T6=.5530000,T7=0.,UC=-0.012,UO=0.012,VALVE=0.);
//GSTEAM1 GSTEAM1_3(F1={0.,0.,.4000000,0.75,0.5,.9100000,.6000000,.9800000,1.,1.},DB1=0.,DB2=0.,K=25.,K1=.3000000,K2=0.,K3=.4000000,K4=0.,K5=.3000000,K6=0.,K7=0.,K8=0.,PMAX=1.,PMIN=.3000000,SDB1=1.,SDB2=1.,T1=0.25,T2=0.001,T3=0.1,T4=.3000000,T5=10.,T6=.4000000,T7=0.001,UC=-0.1,UO=0.1,VALVE=0.);
  parameter Real init_8=VALVE;
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
  Modelica.Blocks.Math.Gain Gain_1 (k=PN); //Eurostag Block number: 1
  iPSL.NonElectrical.Eurostag.Math.ImMult5 ImMult5_2 (nu =2, a={1., 1.}); //Eurostag Block number: 2
  Modelica.Blocks.Sources.Constant Constant_3 (k=K2+K4); //Eurostag Block number: 3
  Modelica.Blocks.Math.MultiSum MultiSum_4 (nu =2, k={1., K6+K8}); //Eurostag Block number: 4
  Modelica.Blocks.Math.Gain Gain_6 (k=1.0); //Eurostag Block number: 6
  iPSL.NonElectrical.Logical.Relay Relay_5; //Eurostag Block number: 5
  iPSL.NonElectrical.Eurostag.ImInverseFunction ImInverseFunction_7 (v=F1); //Eurostag Block number: 7
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_8 (V=init_8); //Eurostag Block number: 8
  Modelica.Blocks.Interfaces.RealInput pin_CM;
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_CM2; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_OMEGREF; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_PGV; //isInitValue
equation
  connect(Constant_3.y, MultiSum_4.u[1]);
  connect(MultiSum_4.y, ImMult5_2.u[2]);
  connect(ImMult5_2.y, Gain_1.u);
  connect(ImSetPoint_8.y, Relay_5.u1);
  connect(ImInverseFunction_7.y, Relay_5.u2);
  connect(pin_CM, ImMult5_2.u[1]);
  connect(pin_OMEGA, Gain_6.u);
  connect(pin_CM, Relay_5.u3);
  connect(pin_CM, ImInverseFunction_7.u);
  connect(pin_CM2, Gain_1.y);
  connect(pin_OMEGREF, Gain_6.y);
  connect(pin_PGV, Relay_5.y);
  MultiSum_4.u[2] =1;
end gsteam1_Init;