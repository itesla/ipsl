within OpenIPSL.Examples.Tutorial.Example_4.PfData;
record Pf00000 "Record for power flow solutions - Id 00000"
extends OpenIPSL.Examples.Tutorial.Example_4.PfData.PowerFlowTemplate;

replaceable record Bus =
      OpenIPSL.Examples.Tutorial.Example_4.PfData.BusData.PfBus00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PfData.BusData.BusTemplate
                                                            "Power flow results for buses";
Bus bus;

replaceable record Load =
      OpenIPSL.Examples.Tutorial.Example_4.PfData.LoadData.PfLoad00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PfData.LoadData.LoadTemplate
    "Power flow results for loads";
  Load loads;

replaceable record Machine =
      OpenIPSL.Examples.Tutorial.Example_4.PfData.MachineData.PfMachine00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PfData.MachineData.MachineTemplate
    "Power flow results for machines";
  Machine machines;

replaceable record Trafo =
      OpenIPSL.Examples.Tutorial.Example_4.PfData.TrafoData.PfTrafo00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PfData.TrafoData.TrafoTemplate
    "Power flow results for transformers";
  Trafo trafos;

end Pf00000;
