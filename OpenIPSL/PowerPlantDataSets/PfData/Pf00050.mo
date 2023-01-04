within OpenIPSL.PowerPlantDataSets.PfData;
record Pf00050 "Record for power flow solutions - Pload = 50 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBus00050   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoad00050    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachine00050    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafo00050    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Pf00050;
