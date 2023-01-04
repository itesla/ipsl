within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil.CrossCompound;
record AndersonCF5HP
  "Anderson Cross-Compound Fossil Steam Unit 5 HP (483 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataCF5HP  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataCF5HP  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor =
      TurbGovData.TurbGovernorDataCF5HP                                constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataCF5HP  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonCF5HP;
