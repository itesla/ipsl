within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil.CrossCompound;
record AndersonCF3HP
  "Anderson Cross-Compound Fossil Steam Unit 3 HP (278.3 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataCF3HP  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataCF3HP  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor =
      TurbGovData.TurbGovernorDataCF3HP                                constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataCF3HP  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonCF3HP;
