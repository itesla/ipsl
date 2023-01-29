within OpenIPSL.Data.PowerPlant.PFData;
record PF00030 "Record for power flow solutions - Pload = 30 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00030   constrainedby BusData.BusTemplate
    "Power flow results for buses";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00030    constrainedby LoadData.LoadTemplate
    "Power flow results for loads";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00030    constrainedby MachineData.MachineTemplate
    "Power flow results for machines";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00030    constrainedby TrafoData.TrafoTemplate
    "Power flow results for transformers";
  Trafos trafos;

end PF00030;
