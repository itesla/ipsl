within OpenIPSL.Data.PowerPlant.Examples.PFData;
record PF00040 "PF solutions for Pload = 40 MW"
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

end PF00040;
