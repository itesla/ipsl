within OpenIPSL.Examples.Tutorial.Example_4.PFData;
record PF00000 "Record for power flow solutions - Id 00000"
extends OpenIPSL.Examples.Tutorial.Example_4.PFData.PowerFlowTemplate;

replaceable record Bus =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.BusData.PfBus00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.BusData.BusTemplate
                                                            "Power flow results for buses";
Bus bus;

replaceable record Load =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.LoadData.PfLoad00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.LoadData.LoadTemplate
    "Power flow results for loads";
  Load loads;

replaceable record Machine =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.MachineData.PfMachine00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.MachineData.MachineTemplate
    "Power flow results for machines";
  Machine machines;

replaceable record Trafo =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.TrafoData.PfTrafo00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.TrafoData.TrafoTemplate
    "Power flow results for transformers";
  Trafo trafos;

end PF00000;
