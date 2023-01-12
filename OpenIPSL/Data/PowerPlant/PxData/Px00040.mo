within OpenIPSL.Data.PowerPlant.PxData;
record Px00040 "Record for power flow solutions - Pload = 40 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PxBus00040   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PxLoad00040    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PxMachine00040    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PxTrafo00040    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Px00040;
