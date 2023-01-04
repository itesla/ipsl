within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil.CrossCompound;
record AndersonCF2LP
  "Anderson Cross-Compound Fossil Steam Unit 2 LP (192 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataCF2LP  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataCF2LP  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor =
      TurbGovData.TurbGovernorDataCF2LP                                constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataCF2LP  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonCF2LP;
