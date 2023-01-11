within OpenIPSL.Examples.Tutorial.Example_4.PxData;
record Px00000 "Record for power flow solutions - Id 00000"
extends OpenIPSL.Examples.Tutorial.Example_4.PxData.PowerFlowTemplate;

replaceable record Bus =
      OpenIPSL.Examples.Tutorial.Example_4.PxData.BusData.PxBus00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PxData.BusData.BusTemplate
                                                            "Power flow results for buses";
  Bus bus;

replaceable record Load =
      OpenIPSL.Examples.Tutorial.Example_4.PxData.LoadData.PxLoad00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PxData.LoadData.LoadTemplate
    "Power flow results for loads";
  Load load;

replaceable record Machine =
      OpenIPSL.Examples.Tutorial.Example_4.PxData.MachineData.PxMachine00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PxData.MachineData.MachineTemplate
    "Power flow results for machines";
  Machine machine;

replaceable record Trafo =
      OpenIPSL.Examples.Tutorial.Example_4.PxData.TrafoData.PxTrafo00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PxData.TrafoData.TrafoTemplate
    "Power flow results for transformers";
  Trafo trafo;

end Px00000;
