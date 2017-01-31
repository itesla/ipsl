within iPSL.Electrical.Controls.Eurostag;
model oelpsat_Init
//OELPSAT OELPSAT_1(IFDLIM=3.,K0=120.,T0=10.,T1=5.,T2=50.,TE=0.1,TR=0.001,V0=0.,VFMAX=5.,VFMIN=0.,VOELMAX=1.100000);
//OELPSAT OELPSAT_2(IFDLIM=3.,K0=50.,T0=10.,T1=4.,T2=20.,TE=0.1,TR=0.001,V0=0.,VFMAX=4.,VFMIN=0.,VOELMAX=1.100000);
  parameter Real IFDLIM;
  parameter Real K0;
  parameter Real T0;
  parameter Real T1;
  parameter Real T2;
  parameter Real TE;
  parameter Real TR;
  parameter Real V0;
  parameter Real VFMAX;
  parameter Real VFMIN;
  parameter Real VOELMAX;
  parameter Real XD;
  parameter Real XQ;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  Modelica.Blocks.Math.Gain Gain_1 (k=1); //Eurostag Block number: 1
  Modelica.Blocks.Interfaces.RealInput pin_TerminalVoltage;
  Modelica.Blocks.Interfaces.RealOutput pin_VREF; //isInitValue
  Modelica.Blocks.Interfaces.RealOutput pin_VV; //isInitValue
equation
  connect(pin_TerminalVoltage, Gain_1.u);
  connect(pin_VREF, Gain_1.y);
  connect(pin_VV, pin_TerminalVoltage);
end oelpsat_Init;