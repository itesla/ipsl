within iPSL.Electrical.Controls.Eurostag;
model pssi3e3b_Init
//PSSI3E3B PSSI3E3B_1(A1=0.359,A2=.5860000,A3=.4290000,A4=.5640000,A5=0.,A6=0.,A7=0.031,A8=0.000001,KS1=-0.602,KS2=30.12000,T1=0.012,T2=0.012,TW1=.3000000,TW2=.3000000,TW3=.6000000,VSTMAX=0.1,VSTMIN=-0.1);
  parameter Real A1;
  parameter Real A2;
  parameter Real A3;
  parameter Real A4;
  parameter Real A5;
  parameter Real A6;
  parameter Real A7;
  parameter Real A8;
  parameter Real KS1;
  parameter Real KS2;
  parameter Real T1;
  parameter Real T2;
  parameter Real TW1;
  parameter Real TW2;
  parameter Real TW3;
  parameter Real VSTMAX;
  parameter Real VSTMIN;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  Modelica.Blocks.Interfaces.RealInput pin_ActivePowerSN;
  Modelica.Blocks.Interfaces.RealOutput pin_P; //isInitValue
equation
  connect(pin_P, pin_ActivePowerSN);
end pssi3e3b_Init;