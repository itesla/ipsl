within OpenIPSL.Data.PowerPlant.PFData;
record PF00040 "Record for power flow solutions - Pload = 40 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00040   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00040    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00040    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00040    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PF00040;
