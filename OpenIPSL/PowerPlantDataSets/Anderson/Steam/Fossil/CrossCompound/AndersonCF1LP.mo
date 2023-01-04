within OpenIPSL.PowerPlantDataSets.Anderson.Steam.Fossil.CrossCompound;
record AndersonCF1LP
  "Anderson Cross-Compound Fossil Steam Unit 1 LP (128 MVA)"

  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineDataCF1LP  constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ExcSystemDataCF1LP  constrainedby
    ESData.ExcSystemDataTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor =
      TurbGovData.TurbGovernorDataCF1LP                                constrainedby
    TurbGovData.TurbGovernorDataTemplate     "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSSData.PSSDataCF1LP  constrainedby
    PSSData.PSSDataTemplate     "Power system stabilizer data";
      PSS pss;

end AndersonCF1LP;
