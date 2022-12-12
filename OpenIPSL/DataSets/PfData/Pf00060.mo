within OpenIPSL.DataSets.PfData;
record Pf00060 "Record for power flow solutions - Pload = 60 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBus00060   constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoad00060    constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachine00060    constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafo00060    constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Pf00060;
