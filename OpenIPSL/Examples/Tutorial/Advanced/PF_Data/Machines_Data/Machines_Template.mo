within OpenIPSL.Examples.Tutorial.Advanced.PF_Data.Machines_Data;
partial record Machines_Template

parameter OpenIPSL.Types.ActivePower PG1 "genunit" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG1 "genunit" annotation(Dialog(enable = false));

parameter OpenIPSL.Types.ActivePower PG2 "infiniteBus" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG2 "infiniteBus" annotation(Dialog(enable = false));

end Machines_Template;
