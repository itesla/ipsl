within OpenIPSL.Data.PowerPlant.PFData;
record PF00060 "PF solutions for Pload = 60 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00060   constrainedby BusData.BusTemplate
    "Power flow results for buses";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00060    constrainedby LoadData.LoadTemplate
    "Power flow results for loads";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00060    constrainedby MachineData.MachineTemplate
    "Power flow results for machines";
  Machines machines;

end PF00060;
