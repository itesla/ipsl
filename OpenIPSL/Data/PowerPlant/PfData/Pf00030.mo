within OpenIPSL.Data.PowerPlant.PFData;
record PF00030 "Record for power flow solutions - Pload = 30 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00030   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00030    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00030    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00030    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PF00030;
