within OpenIPSL.PowerPlantDataSets.PfData;
record Pf00030 "Record for power flow solutions - Pload = 30 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBus00030   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoad00030    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachine00030    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafo00030    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Pf00030;
