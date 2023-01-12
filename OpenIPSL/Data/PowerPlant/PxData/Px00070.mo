within OpenIPSL.Data.PowerPlant.PxData;
record Px00070 "Record for power flow solutions - Pload = 70 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PxBus00070   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PxLoad00070    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PxMachine00070    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PxTrafo00070    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Px00070;
