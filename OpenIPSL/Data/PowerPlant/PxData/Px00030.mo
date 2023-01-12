within OpenIPSL.Data.PowerPlant.PxData;
record Px00030 "Record for power flow solutions - Pload = 30 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PxBus00030   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PxLoad00030    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PxMachine00030    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PxTrafo00030    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Px00030;
