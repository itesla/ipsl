within OpenIPSL.Data.PowerPlant.IEEE421.PSSData;
record PSS1A3
  "PSS1A Data for Type ST1A Sample Data (Table H.13 in IEEE Std 421.5-2005 / Table H.26 in IEEE Std 421.5-2016)"
  extends PSS1ATemplate(
    K_S=16.7,
    T_1=0.15,
    T_2=0.03,
    T_3=0.15,
    T_4=0.03,
    T_5=1.65,
    T_6=0,
    V_STMAX=0.1,
    V_STMIN=-0.066);
end PSS1A3;
