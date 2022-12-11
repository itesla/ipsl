within OpenIPSL.DataSets.IEEE421.ST;
record ESST4B1
  "IEEE421.5 ST4B Type Excitation System Model Data Set 1 (Potential Source)"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.Machine1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ST.ESST4B1   constrainedby
    ESData.ST.ESSTxBTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS2B3   constrainedby
    PSSData.PSS2BTemplate     "Power system stabilizer data";
  PSS pss;

end ESST4B1;
