within iPSL.Electrical.Controls.Eurostag;
model oelpsat
//OELPSAT OELPSAT_1(IFDLIM=3.,K0=120.,T0=10.,T1=5.,T2=50.,TE=0.1,TR=0.001,V0=0.,VFMAX=5.,VFMIN=0.,VOELMAX=1.100000);
//OELPSAT OELPSAT_2(IFDLIM=3.,K0=50.,T0=10.,T1=4.,T2=20.,TE=0.1,TR=0.001,V0=0.,VFMAX=4.,VFMIN=0.,VOELMAX=1.100000);
  parameter Real init_2=0;
  parameter Real init_10=init_VREF;
  parameter Real init_4=init_VV;
  parameter Real init_7=init_EFD;
  parameter Real init_1=init_EFD;
  parameter Real init_16=0;
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
  parameter Real init_VREF;
  parameter Real init_VV;
  parameter Real init_EFD;
  iPSL.NonElectrical.Continuous.LeadLag LeadLag_2 (K=K0, T1=T1, T2=T2, y_start=init_2); //Eurostag Block number: 2
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_10 (V=init_10); //Eurostag Block number: 10
  Modelica.Blocks.Math.MultiSum MultiSum_11 (nu =2, k={-1., 1}); //Eurostag Block number: 11
  iPSL.NonElectrical.Continuous.SimpleLag SimpleLag_4 (K=1, T=TR, y_start=init_4, initType = Modelica.Blocks.Types.Init.SteadyState); //Eurostag Block number: 4
  iPSL.NonElectrical.Eurostag.Math.ImSetPoint ImSetPoint_7 (V=init_7); //Eurostag Block number: 7
  Modelica.Blocks.Math.MultiSum MultiSum_8 (nu =2, k={1, 1}); //Eurostag Block number: 8
  iPSL.NonElectrical.Continuous.SimpleLagLim SimpleLagLim_1 (outMax=VFMAX, K=1, T=TE, outMin=VFMIN, y_start=init_1); //Eurostag Block number: 1
  iPSL.NonElectrical.Logical.Relay Relay_5; //Eurostag Block number: 5
  iPSL.NonElectrical.Eurostag.Math.ImMult5 ImMult5_12 (nu =2, a={1, 1}); //Eurostag Block number: 12
  Modelica.Blocks.Math.Abs Abs_13; //Eurostag Block number: 13
  iPSL.NonElectrical.Eurostag.Continuous.ImDiv2 ImDiv2_14 (a1=1, a2=1, a0=0, StartValue=false); //Eurostag Block number: 14
  Modelica.Blocks.Sources.Constant Constant_15 (k=1); //Eurostag Block number: 15
  Modelica.Blocks.Math.MultiSum MultiSum_17 (nu =2, k={1, -IFDLIM}); //Eurostag Block number: 17
  Modelica.Blocks.Continuous.LimIntegrator LimIntegrator_16 (outMax=VOELMAX, k=1/T0, outMin=0, y_start=init_16); //Eurostag Block number: 16
  Modelica.Blocks.Math.MultiSum MultiSum_18 (nu =2, k={-1, 1}); //Eurostag Block number: 18
  iPSL.NonElectrical.Logical.Relay Relay_19; //Eurostag Block number: 19
  Modelica.Blocks.Sources.Constant Constant_20 (k=0); //Eurostag Block number: 20
  Modelica.Blocks.Sources.Constant Constant_9 (k=V0); //Eurostag Block number: 9
  iPSL.NonElectrical.Eurostag.Continuous.ImDiv2 ImDiv2_24 (a1=XQ, a2=1, a0=0, StartValue=false); //Eurostag Block number: 24
  iPSL.NonElectrical.Eurostag.Continuous.ImDiv2 ImDiv2_27 (a1=XQ, a2=1, a0=0, StartValue=false); //Eurostag Block number: 27
  Modelica.Blocks.Math.MultiSum MultiSum_31 (nu =2, k={1, 1}); //Eurostag Block number: 31
  iPSL.NonElectrical.Eurostag.Math.ImRampUpToAPower ImRampUpToAPower_32 (A=2); //Eurostag Block number: 32
  iPSL.NonElectrical.Eurostag.Math.ImRampUpToAPower ImRampUpToAPower_34 (A=2); //Eurostag Block number: 34
  iPSL.NonElectrical.Eurostag.Math.ImSqrt ImSqrt_35; //Eurostag Block number: 35
  Modelica.Blocks.Math.MultiSum MultiSum_36 (nu =2, k={1, 1}); //Eurostag Block number: 36
  Modelica.Blocks.Math.MultiSum MultiSum_28 (nu =2, k={1, 1}); //Eurostag Block number: 28
  iPSL.NonElectrical.Eurostag.Math.ImMult5 ImMult5_37 (nu =2, a={1, 1}); //Eurostag Block number: 37
  Modelica.Blocks.Math.MultiSum MultiSum_38 (nu =2, k={1, 1}); //Eurostag Block number: 38
  Modelica.Blocks.Math.MultiSum MultiSum_39 (nu =2, k={1, 1}); //Eurostag Block number: 39
  iPSL.NonElectrical.Eurostag.Continuous.ImDiv2 ImDiv2_40 (a1=XD-XQ, a2=XQ, a0=0, StartValue=false); //Eurostag Block number: 40
  Modelica.Blocks.Math.Gain Gain_6 (k=SNREF/SN); //Eurostag Block number: 6
  Modelica.Blocks.Math.Gain Gain_29 (k=SNREF/SN); //Eurostag Block number: 29
  iPSL.NonElectrical.Eurostag.Math.ImRampUpToAPower ImRampUpToAPower_41 (A=2); //Eurostag Block number: 41
  Modelica.Blocks.Interfaces.RealInput pin_TerminalVoltage;
  Modelica.Blocks.Interfaces.RealInput pin_ActivePowerSNREF;
  Modelica.Blocks.Interfaces.RealInput pin_ReactivePowerSNREF;
  Modelica.Blocks.Interfaces.RealOutput pin_At_V;
  Modelica.Blocks.Interfaces.RealOutput pin_VF0; //EFD
  Modelica.Blocks.Interfaces.RealOutput pin_EFD; //EFD
  Modelica.Blocks.Interfaces.RealOutput pin_At_VOXL;//Start = 0
  Modelica.Blocks.Interfaces.RealOutput pin_At_V0;
  Modelica.Blocks.Interfaces.RealOutput pin_At_DENOM;
  Modelica.Blocks.Interfaces.RealOutput pin_At_IF;
  Modelica.Blocks.Interfaces.RealOutput pin_At_DP;
  Modelica.Blocks.Interfaces.RealOutput pin_At_DQ;
  iPSL.Interfaces.AddedConnector setPointModification_10;
  iPSL.Interfaces.AddedConnector setPointModification_7;
equation
  connect(ImSqrt_35.y, ImDiv2_40.u2);
  connect(ImDiv2_40.y, MultiSum_39.u[1]);
  connect(MultiSum_39.y, MultiSum_17.u[1]);
  connect(ImRampUpToAPower_41.y, MultiSum_38.u[2]);
  connect(pin_TerminalVoltage, MultiSum_28.u[1]);
  connect(MultiSum_28.y, ImMult5_37.u[1]);
  connect(ImMult5_37.y, MultiSum_38.u[1]);
  connect(MultiSum_38.y, ImDiv2_40.u1);
  connect(pin_ActivePowerSNREF, ImDiv2_24.u1);
  connect(pin_TerminalVoltage, ImDiv2_24.u2);
  connect(pin_ReactivePowerSNREF, ImDiv2_27.u1);
  connect(pin_TerminalVoltage, ImDiv2_27.u2);
  connect(pin_TerminalVoltage, MultiSum_31.u[1]);
  connect(MultiSum_31.y, ImRampUpToAPower_32.u);
  connect(pin_ActivePowerSNREF, ImRampUpToAPower_34.u);
  connect(ImRampUpToAPower_32.y, MultiSum_36.u[1]);
  connect(ImRampUpToAPower_34.y, MultiSum_36.u[2]);
  connect(MultiSum_36.y, ImSqrt_35.u);
  connect(ImSqrt_35.y, MultiSum_39.u[2]);
  connect(ImDiv2_24.y, Gain_6.u);
  connect(ImDiv2_27.y, Gain_29.u);
  connect(Relay_5.y, ImMult5_12.u[1]);
  connect(Constant_15.y, Relay_5.u3);
  connect(ImDiv2_14.y, Relay_5.u2);
  connect(Abs_13.y, Relay_5.u1);
  connect(Constant_9.y, Abs_13.u);
  connect(SimpleLag_4.y, MultiSum_11.u[1]);
  connect(pin_TerminalVoltage, SimpleLag_4.u);
  connect(MultiSum_17.y, LimIntegrator_16.u);
  connect(LimIntegrator_16.y, Relay_19.u2);
  connect(Constant_20.y, Relay_19.u3);
  connect(MultiSum_17.y, Relay_19.u1);
  connect(Relay_19.y, MultiSum_18.u[1]);
  connect(ImSetPoint_10.y, MultiSum_18.u[2]);
  connect(ImSetPoint_10.setPointModification, setPointModification_10);
  connect(MultiSum_18.y, MultiSum_11.u[2]);
  connect(ImMult5_12.y, SimpleLagLim_1.u);
  connect(MultiSum_8.y, ImMult5_12.u[2]);
  connect(LeadLag_2.y, MultiSum_8.u[1]);
  connect(ImSetPoint_7.y, MultiSum_8.u[2]);
  connect(ImSetPoint_7.setPointModification, setPointModification_7);
  connect(MultiSum_11.y, LeadLag_2.u);
  connect(pin_At_V, ImDiv2_14.u1);
  connect(pin_At_V0, ImDiv2_14.u2);
  connect(pin_At_DQ, MultiSum_31.u[2]);
  connect(pin_At_DQ, MultiSum_28.u[2]);
  connect(pin_At_DQ, ImMult5_37.u[2]);
  connect(pin_At_DP, ImRampUpToAPower_41.u);
  connect(pin_At_V, pin_TerminalVoltage);
  connect(pin_VF0, ImSetPoint_7.y);
  connect(pin_EFD, SimpleLagLim_1.y);
  connect(pin_At_VOXL, LimIntegrator_16.y);
  connect(pin_At_V0, Constant_9.y);
  connect(pin_At_DENOM, ImSqrt_35.y);
  connect(pin_At_IF, MultiSum_39.y);
  connect(pin_At_DP, Gain_6.y);
  connect(pin_At_DQ, Gain_29.y);
  MultiSum_17.u[2] =1;
  annotation(Documentation(info="<HTML>
   <table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
   <td align=center  width=50%><p>Development level</p></td>
   <td align=center width=25% bgcolor= #00FF00><p> 4 </p></td>
   </tr> 
   </table> 
   <p></p>  
	<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
	<tr>
	<td><p>Reference</p></td>
	<td></td>
	</tr>
	<tr>
	<td><p>Last update</p></td>
	<td>Unknown</td>
	</tr>
	<tr>
	<td><p>Author</p></td>
	<td><p>AIA</p></td>
	</tr>
	<tr>
	<td><p>Contact</p></td>
	<td><p>modelica@aia.es<a href=\"mailto:modelica@aia.es\"></a></p></td>
	</tr>
	</table>
	<p> 
	</p>
	</HTML>")); 
end oelpsat;
