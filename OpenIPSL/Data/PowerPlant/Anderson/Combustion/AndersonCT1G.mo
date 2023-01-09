within OpenIPSL.Data.PowerPlant.Anderson.Combustion;
record AndersonCT1G
  "Anderson Combustion Turbine Unit 1 Gas (20.65 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataCT1  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataCT1  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataCT1G  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataND  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonCT1G;
