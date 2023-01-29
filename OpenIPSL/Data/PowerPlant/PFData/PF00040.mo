within OpenIPSL.Data.PowerPlant.PFData;
record PF00040 "Record for power flow solutions - Pload = 40 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00040   constrainedby BusData.BusTemplate
    "Power flow results for buses";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00040    constrainedby LoadData.LoadTemplate
    "Power flow results for loads";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00040    constrainedby MachineData.MachineTemplate
    "Power flow results for machines";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00040    constrainedby TrafoData.TrafoTemplate
    "Power flow results for transformers";
  Trafos trafos;

end PF00040;
