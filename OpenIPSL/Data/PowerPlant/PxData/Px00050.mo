within OpenIPSL.Data.PowerPlant.PxData;
record Px00050 "Record for power flow solutions - Pload = 50 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PxBus00050   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PxLoad00050    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PxMachine00050    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PxTrafo00050    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Px00050;
