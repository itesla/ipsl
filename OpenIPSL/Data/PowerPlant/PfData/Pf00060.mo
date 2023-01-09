within OpenIPSL.Data.PowerPlant.PFData;
record PF00060 "Record for power flow solutions - Pload = 60 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00060   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00060    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00060    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00060    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PF00060;
