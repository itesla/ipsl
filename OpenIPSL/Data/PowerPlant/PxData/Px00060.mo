within OpenIPSL.Data.PowerPlant.PxData;
record Px00060 "Record for power flow solutions - Pload = 60 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PxBus00060   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PxLoad00060    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PxMachine00060    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PxTrafo00060    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Px00060;
