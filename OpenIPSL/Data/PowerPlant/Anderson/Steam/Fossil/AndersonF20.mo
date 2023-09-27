within OpenIPSL.Data.PowerPlant.Anderson.Steam.Fossil;
record AndersonF20 "Anderson Fossil Steam Unit 20 (896 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataF20  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataF20  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGovData.TurbGovernorDataF20  constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataF20  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonF20;
