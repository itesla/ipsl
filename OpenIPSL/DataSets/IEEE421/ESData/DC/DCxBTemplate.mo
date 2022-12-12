within OpenIPSL.DataSets.IEEE421.ESData.DC;
partial record DCxBTemplate
  "Type DCxB Excitation System Data Record Template"
  extends DCxATemplate;

  parameter Types.PerUnit K_P "Voltage regulator proportional gain";
  parameter Types.PerUnit K_I "Voltage regulator integral gain";
  parameter Types.PerUnit K_D "Voltage regulator derivative gain";
  parameter Types.Time T_D "Voltage regulator derivative filter time constant";

end DCxBTemplate;
