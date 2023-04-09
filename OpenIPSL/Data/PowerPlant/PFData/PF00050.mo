within OpenIPSL.Data.PowerPlant.PFData;
record PF00050 "PF solutions for Pload = 50 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00050   constrainedby BusData.BusTemplate
    "Power flow results for buses";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00050    constrainedby LoadData.LoadTemplate
    "Power flow results for loads";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00050    constrainedby MachineData.MachineTemplate
    "Power flow results for machines";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00050    constrainedby TrafoData.TrafoTemplate
    "Power flow results for transformers";
  Trafos trafos;

end PF00050;
