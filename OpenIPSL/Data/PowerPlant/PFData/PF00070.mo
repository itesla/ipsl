within OpenIPSL.Data.PowerPlant.PFData;
record PF00070 "Record for power flow solutions - Pload = 70 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PFBus00070   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PFLoad00070    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PFMachine00070    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PFTrafo00070    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PF00070;
