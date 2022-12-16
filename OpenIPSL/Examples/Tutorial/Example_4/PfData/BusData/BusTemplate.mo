within OpenIPSL.Examples.Tutorial.Example_4.PFData.BusData;
partial record BusTemplate "Record template for power flow solutions in buses"

parameter OpenIPSL.Types.PerUnit v1 annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A1 annotation(Dialog(enable = false));

parameter OpenIPSL.Types.PerUnit v2 annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A2 annotation(Dialog(enable = false));

parameter OpenIPSL.Types.PerUnit v3 annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A3 annotation(Dialog(enable = false));

parameter OpenIPSL.Types.PerUnit v4 annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A4 annotation(Dialog(enable = false));

end BusTemplate;
