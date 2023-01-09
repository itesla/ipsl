within OpenIPSL.Data.PowerPlant.IEEE421.PSSData;
record PSS1A2
  "PSS1A Data for Type DC2A Sample Data (Table H.2.1 in IEEE Std 421.5-2005 / Table H.5 in IEEE Std 421.5-2016)"
  extends PSS1ATemplate(
    K_S=1.4,
    T_1=0.5,
    T_2=0.06,
    T_3=0.5,
    T_4=0.06,
    T_5=30.0,
    T_6=0.016,
    V_STMAX=0.05,
    V_STMIN=-0.05);
end PSS1A2;
