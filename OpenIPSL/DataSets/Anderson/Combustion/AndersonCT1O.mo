within OpenIPSL.DataSets.Anderson.Combustion;
record AndersonCT1O
  "Anderson Combustion Turbine Unit 1 Oil (20.65 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataCT1  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataCT1  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataCT1O  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonCT1O;
