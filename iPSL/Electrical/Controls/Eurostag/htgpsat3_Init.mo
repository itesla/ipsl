within iPSL.Electrical.Controls.Eurostag;
model htgpsat3_Init
//HTGPSAT3 HTGPSAT3_1(A11=0.5,A13=1.,A21=1.5,A23=1.,DELTA=.3000000,PMAX=1.,PMIN=0.,SIGMA=0.04,TG=0.2,TP=0.04,TR=5.,TW=1.,UC=-0.1,UO=0.1);
  parameter Real A11;
  parameter Real A13;
  parameter Real A21;
  parameter Real A23;
  parameter Real DELTA;
  parameter Real PMAX;
  parameter Real PMIN;
  parameter Real SIGMA;
  parameter Real TG;
  parameter Real TP;
  parameter Real TR;
  parameter Real TW;
  parameter Real UC;
  parameter Real UO;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  Modelica.Blocks.Math.Gain Gain_1 (k=1/A23); //Eurostag Block number: 1
  Modelica.Blocks.Sources.Constant Constant_4 (k=A13*A21); //Eurostag Block number: 4
  Modelica.Blocks.Math.MultiSum MultiSum_5 (nu =2, k={-TW/A23, A11*TW}); //Eurostag Block number: 5
  Modelica.Blocks.Math.Gain Gain_2 (k=1); //Eurostag Block number: 2
  Modelica.Blocks.Interfaces.RealInput pin_CM;
  Modelica.Blocks.Interfaces.RealInput pin_OMEGA;
  Modelica.Blocks.Interfaces.RealOutput pin_PREF; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_T1; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_OMEGREF; //isInitValue
equation
  connect(Constant_4.y, MultiSum_5.u[1]);
  connect(pin_CM, Gain_1.u);
  connect(pin_OMEGA, Gain_2.u);
  connect(pin_PREF, Gain_1.y);
  connect(pin_T1, MultiSum_5.y);
  connect(pin_OMEGREF, Gain_2.y);
  MultiSum_5.u[2] =1;
end htgpsat3_Init;