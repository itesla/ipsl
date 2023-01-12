within OpenIPSL.Data.PowerPlant.PFData;
record PF00050 "Record for power flow solutions - Pload = 50 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00050   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00050    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00050    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00050    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PF00050;
