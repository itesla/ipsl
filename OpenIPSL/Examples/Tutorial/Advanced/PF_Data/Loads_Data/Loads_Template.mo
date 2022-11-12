within OpenIPSL.Examples.Tutorial.Advanced.PF_Data.Loads_Data;
partial record Loads_Template

parameter OpenIPSL.Types.ActivePower PL1 "load" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QL1 "load" annotation(Dialog(enable = false));

end Loads_Template;
