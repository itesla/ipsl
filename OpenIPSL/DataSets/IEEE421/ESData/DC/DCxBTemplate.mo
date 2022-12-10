within OpenIPSL.DataSets.IEEE421.ESData.DC;
partial record DCxBTemplate
  "Type DCxB Excitation System Data Record Template"
  extends DCxATemplate;

  parameter OpenIPSL.Types.PerUnit K_P "Voltage regulator proportional gain";
  parameter OpenIPSL.Types.PerUnit K_I "Voltage regulator integral gain";
  parameter OpenIPSL.Types.PerUnit K_D "Voltage regulator derivative gain";
  parameter OpenIPSL.Types.Time T_D "Voltage regulator derivative filter time constant";

end DCxBTemplate;
