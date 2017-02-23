within iPSL.Electrical.Controls.Eurostag;


model sexs_Init
//SEXS SEXS_1(EFDMAX=999.,EFDMIN=-999.,EMAX=4.,EMIN=0.,K=200.,KC=1.,TA=3.,TB=10.,TE=0.05);
//SEXS SEXS_2(EFDMAX=5.,EFDMIN=-5.,EMAX=6.,EMIN=0.,K=400.,KC=1.,TA=1.,TB=10.,TE=0.0001);
//SEXS SEXS_3(EFDMAX=5.,EFDMIN=-5.,EMAX=4.,EMIN=0.,K=100.,KC=1.,TA=1.,TB=10.,TE=0.0001);
//SEXS SEXS_4(EFDMAX=5.,EFDMIN=-5.,EMAX=6.,EMIN=0.,K=100.,KC=1.,TA=1.,TB=10.,TE=0.0001);
//SEXS SEXS_5(EFDMAX=5.,EFDMIN=-5.,EMAX=4.5,EMIN=0.,K=100.,KC=1.,TA=1.,TB=10.,TE=0.0001);
  parameter Real EMAX;
  parameter Real EMIN;
  parameter Real K;
  parameter Real KC;
  parameter Real TA;
  parameter Real TB;
  parameter Real TE;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  Modelica.Blocks.Math.Gain Gain_1 (k = 1 / K); //Eurostag Block number: 1
  Modelica.Blocks.Math.MultiSum MultiSum_2 (nu = 3, k={+1, +1, -1}); //Eurostag Block number: 2
  Modelica.Blocks.Math.Gain Gain_4 (k = 1 / KC); //Eurostag Block number: 4
  Modelica.Blocks.Interfaces.RealInput pin_VS;
  Modelica.Blocks.Interfaces.RealInput pin_TerminalVoltage;
  Modelica.Blocks.Interfaces.RealInput pin_EFD;
  Modelica.Blocks.Interfaces.RealOutput pin_YLL; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_VREF; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_At_V;
equation
  connect(Gain_1.y, MultiSum_2.u[2]);
  connect(pin_TerminalVoltage, MultiSum_2.u[1]);
  connect(Gain_4.y, Gain_1.u);
  connect(pin_VS, MultiSum_2.u[3]);
  connect(pin_EFD, Gain_4.u);
  connect(pin_YLL, Gain_1.y);
  connect(pin_VREF, MultiSum_2.y);
  connect(pin_At_V, pin_TerminalVoltage);
end sexs_Init;
