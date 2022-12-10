within OpenIPSL.Examples.Tutorial.Example_4.PfData.BusData;
partial record BusTemplate "Record template for power flow solutions in buses"

parameter OpenIPSL.Types.PerUnit v1 "B01" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A1 "B01" annotation(Dialog(enable = false));

parameter OpenIPSL.Types.PerUnit v2 "B02" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A2 "B02" annotation(Dialog(enable = false));

parameter OpenIPSL.Types.PerUnit v3 "B03" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A3 "B03" annotation(Dialog(enable = false));

parameter OpenIPSL.Types.PerUnit v4 "B04" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.Angle A4 "B04" annotation(Dialog(enable = false));

end BusTemplate;
