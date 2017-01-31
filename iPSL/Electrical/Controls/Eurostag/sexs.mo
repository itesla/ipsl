within iPSL.Electrical.Controls.Eurostag;
model sexs
//SEXS SEXS_1(EFDMAX=999.,EFDMIN=-999.,EMAX=4.,EMIN=0.,K=200.,KC=1.,TA=3.,TB=10.,TE=0.05);
//SEXS SEXS_2(EFDMAX=5.,EFDMIN=-5.,EMAX=6.,EMIN=0.,K=400.,KC=1.,TA=1.,TB=10.,TE=0.0001);
//SEXS SEXS_3(EFDMAX=5.,EFDMIN=-5.,EMAX=4.,EMIN=0.,K=100.,KC=1.,TA=1.,TB=10.,TE=0.0001);
//SEXS SEXS_4(EFDMAX=5.,EFDMIN=-5.,EMAX=6.,EMIN=0.,K=100.,KC=1.,TA=1.,TB=10.,TE=0.0001);
//SEXS SEXS_5(EFDMAX=5.,EFDMIN=-5.,EMAX=4.5,EMIN=0.,K=100.,KC=1.,TA=1.,TB=10.,TE=0.0001);
  parameter Real init_2=init_YLL;
  parameter Real init_12=init_VREF;
  parameter Real init_1=init_EFD;
  parameter Real init_6=0;
  parameter Real init_4=init_EFD;
  parameter Real EFDMAX = 999;
  parameter Real EFDMIN = -999;
  parameter Real EMAX;
  parameter Real EMIN;
  parameter Real K = 1;
  parameter Real KC = 1;
  parameter Real TA;
  parameter Real TB;
  parameter Real TE;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  parameter Real init_YLL;
  parameter Real init_VREF;
  parameter Real init_EFD;
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_2( K=1., T1=TA, T2=TB, y_start=init_2); //Eurostag Block number: 2
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_12( V=init_12); //Eurostag Block number: 12
  Modelica.Blocks.Math.MultiSum MultiSum_13( nu= 4, k={-1, 1., 1, 1}); //Eurostag Block number: 13
  iPSL.NonElectrical.Continuous.SimpleLagLim SimpleLagLim_1( outMax=EMAX, K=K, T=TE, outMin=EMIN, y_start=init_1); //Eurostag Block number: 1
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_6( V=init_6); //Eurostag Block number: 6
  Modelica.Blocks.Math.Gain Gain_7( k=KC); //Eurostag Block number: 7
  Modelica.Blocks.Nonlinear.Limiter Limiter_4( uMax=EFDMAX, uMin=EFDMIN); //Eurostag Block number: 4
  Modelica.Blocks.Interfaces.RealInput pin_VS;
  Modelica.Blocks.Interfaces.RealInput pin_TerminalVoltage;
  Modelica.Blocks.Interfaces.RealOutput pin_At_VREF; //At_VREF
  Modelica.Blocks.Interfaces.RealOutput pin_At_VERR;
  Modelica.Blocks.Interfaces.RealOutput pin_PSSREF;//Start = 0
  Modelica.Blocks.Interfaces.RealOutput pin_EFD; //EFD
  iPSL.Interfaces.AddedConnector setPointModification_6;
  iPSL.Interfaces.AddedConnector setPointModification_12;


equation
  connect(ImSetPoint_12.y, MultiSum_13.u[2]);
  connect(ImSetPoint_12.setPointModification, setPointModification_12);
  connect(MultiSum_13.y, LeadLag_2.u);
  connect(ImSetPoint_6.y, MultiSum_13.u[3]);
   connect(ImSetPoint_6.setPointModification, setPointModification_6);
  connect(LeadLag_2.y, Gain_7.u);
  connect(Gain_7.y, SimpleLagLim_1.u);
  connect(SimpleLagLim_1.y, Limiter_4.u);
  connect(pin_TerminalVoltage, MultiSum_13.u[1]);
  connect(pin_VS, MultiSum_13.u[4]);
  connect(pin_At_VREF, ImSetPoint_12.y);
  connect(pin_At_VERR, MultiSum_13.y);
  connect(pin_PSSREF, ImSetPoint_6.y);
  connect(pin_EFD, Limiter_4.y);
end sexs;
