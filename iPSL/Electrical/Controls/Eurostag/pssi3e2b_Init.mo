within iPSL.Electrical.Controls.Eurostag;
model pssi3e2b_Init
//PSSI3E2B PSSI3E2B_1(KS1=10.,KS2=0.1564,KS3=1.,T1=0.25,T10=0.,T11=0.,T2=0.03,T3=.1500000,T4=0.015,T6=0.,T7=2.,T8=0.,T9=0.,TW1=2.,TW2=2.,TW3=2.,VSI1MAX=999.,VSI1MIN=-999.,VSI2MAX=999.,VSI2MIN=-999.,VSTMAX=0.1,VSTMIN=-0.1);
  parameter Real KS1;
  parameter Real KS2;
  parameter Real KS3;
  parameter Real T1;
  parameter Real T10;
  parameter Real T11;
  parameter Real T2;
  parameter Real T3;
  parameter Real T4;
  parameter Real T6;
  parameter Real T7;
  parameter Real T8;
  parameter Real T9;
  parameter Real TW1;
  parameter Real TW2;
  parameter Real TW3;
  parameter Real VSI1MAX;
  parameter Real VSI1MIN;
  parameter Real VSI2MAX;
  parameter Real VSI2MIN;
  parameter Real VSTMAX;
  parameter Real VSTMIN;
  parameter Real SNREF;
  parameter Real SN;
  parameter Real PN;
  parameter Real PNALT;
  Modelica.Blocks.Interfaces.RealInput pin_ActivePowerSN;
  Modelica.Blocks.Interfaces.RealOutput pin_APREF; //isInitValue
equation
  connect(pin_APREF, pin_ActivePowerSN);
end pssi3e2b_Init;


