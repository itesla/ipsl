within OpenIPSL.Data.PowerPlant.PxData;
package BusData "Records with power flow solutions for buses"
  extends Modelica.Icons.RecordsPackage;

  partial record BusTemplate "Record template for power flow solutions in buses"

    parameter OpenIPSL.Types.PerUnit v1 "Voltage magnitude at bus 'FAULT'"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A1 "Voltage angle at bus 'FAULT'" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v2 "Voltage magnitude at bus 'GEN1'"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A2 "Voltage angle at bus 'GEN1'" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v3 "Voltage magnitude at bus 'GEN2'"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A3 "Voltage angle at bus 'GEN2'" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v4 "Voltage magnitude at bus 'LOAD'"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A4 "Voltage angle at bus 'LOAD'" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v5 "Voltage magnitude at bus 'SHUNT'"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A5 "Voltage angle at bus 'SHUNT'" annotation (Dialog(enable=false));

  end BusTemplate;

  record PxBus00030 "Record for power flow solutions in buses - Pload = 30 MW"
    extends BusTemplate(
      v1=1.000000000000,
      A1=0.090529953603,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.994766094833,
      A3=0.010062704392,
      v4=0.997370423401,
      A4=0.005018150727,
      v5=0.997370423401,
      A5=0.005018150727);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PxBus00030;

  record PxBus00040 "Record for power flow solutions in buses - Pload = 40 MW"
    extends BusTemplate(
      v1=1.000000000000,
      A1=0.080586618023,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.993415764494,
      A3=0.000016592033,
      v4=0.996707882213,
      A4=0.000008268615,
      v5=0.996707882213,
      A5=0.000008268615);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PxBus00040;

  record PxBus00050 "Record for power flow solutions in buses - Pload = 50 MW"
    extends BusTemplate(
      v1=1.000000000000,
      A1=0.070620799599,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.991993544450,
      A3=-0.010057778279,
      v4=0.995984178212,
      A4=-0.005008676264,
      v5=0.995984178212,
      A5=-0.005008676264);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PxBus00050;

  record PxBus00060 "Record for power flow solutions in buses - Pload = 60 MW"
    extends BusTemplate(
      v1=1.000000000000,
      A1=0.060629254996,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.990498491772,
      A3=-0.020163770821,
      v4=0.995198666704,
      A4=-0.010033758590,
      v5=0.995198666704,
      A5=-0.010033758590);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PxBus00060;

  record PxBus00070 "Record for power flow solutions in buses - Pload = 70 MW"
    extends BusTemplate(
      v1=1.000000000000,
      A1=0.050608662468,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.988929565666,
      A3=-0.030304839568,
      v4=0.994350626073,
      A4=-0.015068074562,
      v5=0.994350626073,
      A5=-0.015068074562);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PxBus00070;
end BusData;
