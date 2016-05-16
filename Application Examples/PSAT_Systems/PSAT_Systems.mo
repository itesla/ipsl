within ;
package PSAT_Systems "Different test systems from PSAT"
  package TwoAreaOld "5-bus system"
    model ThirdOrder_AVRI "5-bus system with 3rd-order machine and AVR Type I"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder3;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeII(
        v0=1.05,
        vf0=1.046883400898693,
        vref0=1.198705028536746,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-136,-2},{-118,12}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-151,9})));
    equation
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-145.5,9},{-141.75,9},{-141.75,8.92},{-137.98,8.92}}, color={0,0,127}));
      connect(aVRTypeII.vf, order3.vf) annotation (Line(points={{-117.1,5.14},{-114.55,5.14},{-114.55,5},{-112,5}}, color={0,0,127}));
      connect(aVRTypeII.v, order3.v) annotation (Line(points={{-138.16,2.48},{-142,2.48},{-142,-14},{-86,-14},{-86,3},{-91,3}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end ThirdOrder_AVRI;

    model ThirdOrder_AVRII "5-bus system with 3rd-order machine and AVR Type II"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder3;

      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vf0=1.046883400898693,
        vref0=1.198705028536746,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-140,-8},{-120,12}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-151,7})));
    equation
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-145.5,7},{-141.75,7},{-141.75,7.4},{-138,7.4}}, color={0,0,127}));
      connect(aVRTypeII.vf, order3.vf) annotation (Line(points={{-121.5,4.6},{-117.75,4.6},{-117.75,5},{-112,5}}, color={0,0,127}));
      connect(aVRTypeII.v, order3.v) annotation (Line(points={{-138,1},{-140,1},{-140,2},{-142,2},{-142,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end ThirdOrder_AVRII;

    model FourthOrder_AVRI "5-bus system with 4th-order machine and AVR Type I"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder4;

      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-149,9})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeIchange1_1(vrmax=7.57) annotation (Placement(transformation(extent={{-132,-2},{-120,12}})));
    equation
      connect(vref2.y, aVRTypeIchange1_1.vref) annotation (Line(points={{-143.5,9},{-138.75,9},{-138.75,8.92},{-133.32,8.92}}, color={0,0,127}));
      connect(aVRTypeIchange1_1.vf, order4.vf) annotation (Line(points={{-119.4,5.14},{-115.7,5.14},{-115.7,5},{-112,5}}, color={0,0,127}));
      connect(aVRTypeIchange1_1.v, order4.v) annotation (Line(points={{-133.44,2.48},{-136,2.48},{-136,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRI;

    model FourthOrder_AVRII "5-bus system with 4th-order machine and AVR Type II"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder4;

      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vf0=1.046883400898693,
        vref0=1.198705028536746,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-136,-8},{-116,12}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-149,7})));
    equation
      connect(order4.vf, aVRTypeII.vf) annotation (Line(points={{-112,5},{-114,5},{-114,4.6},{-117.5,4.6}}, color={0,0,127}));
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-143.5,7},{-138.75,7},{-138.75,7.4},{-134,7.4}}, color={0,0,127}));
      connect(aVRTypeII.v, order4.v) annotation (Line(points={{-134,1},{-138,1},{-138,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRII;

    model FifthOrder_AVRI "5-bus system with 5th-order machine and AVR Type I"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder5;

      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198316846325759,
        vf0=1.044150598133340) annotation (Placement(transformation(extent={{-134,-4},{-118,12}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198316846325759) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-149,9})));
    equation
      connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-143.5,9},{-142,9},{-142,8.48},{-135.76,8.48}},color={0,0,127}));
      connect(aVRTypeI.vf, order5.vf) annotation (Line(points={{-117.2,4.16},{-114.6,4.16},{-114.6,5},{-112,5}}, color={0,0,127}));
      connect(aVRTypeI.v, order5.v) annotation (Line(points={{-135.92,1.12},{-140,1.12},{-140,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FifthOrder_AVRI;

    model FifthOrder_AVRII "5-bus system with 5th-order machine and AVR Type II"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder5;

      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198316846325759,
        vf0=1.044150598133340) annotation (Placement(transformation(extent={{-134,-8},{-114,12}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198316846325759) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-147,7})));
    equation
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-141.5,7},{-138,7},{-138,7.4},{-132,7.4}}, color={0,0,127}));
      connect(aVRTypeII.vf, order5.vf) annotation (Line(points={{-115.5,4.6},{-113.75,4.6},{-113.75,5},{-112,5}}, color={0,0,127}));
      connect(aVRTypeII.v, order5.v) annotation (Line(points={{-132,1},{-134,1},{-134,2},{-136,2},{-136,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FifthOrder_AVRII;


    model SixthOrder_AVRI "5-bus system with 6th-order machine and AVR Type I"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder6;

      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-149,9})));
      PowerSystems.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198705028536746,
        vf0=1.046883400898693) annotation (Placement(transformation(extent={{-134,-2},{-118,12}})));
    equation
      connect(aVRTypeI.vf, order6.vf) annotation (Line(points={{-117.2,5.14},{-114.6,5.14},{-114.6,5},{-112,5}}, color={0,0,127}));
      connect(aVRTypeI.v, order6.v) annotation (Line(points={{-135.92,2.48},{-140,2.48},{-140,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
      connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-143.5,9},{-139.75,9},{-139.75,8.92},{-135.76,8.92}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end SixthOrder_AVRI;

    model SixthOrder_AVRII "5-bus system with 6th-order machine and AVR Type II"
      extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseOrder6;

      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198705028536746,
        vf0=1.046883400898693,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1) annotation (Placement(transformation(extent={{-136,-8},{-116,12}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-149,7})));
    equation
      connect(aVRTypeII.vf, order6.vf) annotation (Line(points={{-117.5,4.6},{-114.75,4.6},{-114.75,5},{-112,5}}, color={0,0,127}));
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-143.5,7},{-137.75,7},{-137.75,7.4},{-134,7.4}}, color={0,0,127}));
      connect(aVRTypeII.v, order6.v) annotation (Line(points={{-134,1},{-136,1},{-136,2},{-140,2},{-140,-14},{-88,-14},{-88,3},{-91,3}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-160,-80},{160,80}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end SixthOrder_AVRII;

    package BaseClasses

      partial model BaseNetwork

        OpenIPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
        OpenIPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(extent={{70,-10},{90,10}})));
        OpenIPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        OpenIPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
        OpenIPSL.Electrical.Buses.Bus bus5 annotation (Placement(transformation(extent={{30,-10},{50,10}})));
        OpenIPSL.Electrical.Branches.PwLine line_1_4(
          R=0,
          X=0.05,
          G=0,
          B=0) annotation (Placement(transformation(extent={{-66,-4},{-54,4}})));
        OpenIPSL.Electrical.Branches.PwLine line_4_3(
          R=0,
          X=0.05,
          G=0,
          B=0) annotation (Placement(transformation(extent={{-26,-4},{-14,4}})));
        OpenIPSL.Electrical.Branches.PwLine line_3_5(
          R=0,
          X=0.05,
          G=0,
          B=0) annotation (Placement(transformation(extent={{14,-4},{26,4}})));
        OpenIPSL.Electrical.Branches.PwLine line_5_2(
          R=0,
          X=0.05,
          G=0,
          B=0) annotation (Placement(transformation(extent={{54,-4},{66,4}})));
        OpenIPSL.Electrical.Events.PwFault pwFault(
          R=0.15,
          X=0,
          t1=2,
          t2=2.1) annotation (Placement(transformation(
              extent={{-5,-5},{5,5}},
              rotation=-90,
              origin={5,-25})));
        OpenIPSL.Electrical.Machines.PSAT.Order2 order2(
          Sn=991,
          V_0=1.081,
          ra=0,
          xd1=0.01,
          M=6,
          V_b=20,
          Vn=20,
          D=0,
          angle_0=0,
          P_0=-90.0000000000001,
          Q_0=23.9371894974117) annotation (Placement(transformation(extent={{120,-10},{100,10}})));
        inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-160,60},{-100,80}})));
      equation
        connect(bus1.p, line_1_4.p) annotation (Line(
            points={{-80,0},{-67,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(line_1_4.n, bus4.p) annotation (Line(
            points={{-53,0},{-40,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(bus4.p, line_4_3.p) annotation (Line(
            points={{-40,0},{-27,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(bus3.p, line_4_3.n) annotation (Line(
            points={{0,0},{-13,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(bus3.p, line_3_5.p) annotation (Line(
            points={{0,0},{13,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(line_3_5.n, bus5.p) annotation (Line(
            points={{27,0},{40,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(bus5.p, line_5_2.p) annotation (Line(
            points={{40,0},{53,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(line_5_2.n, bus2.p) annotation (Line(
            points={{67,0},{80,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwFault.p, line_3_5.p) annotation (Line(points={{5,-19.1667},{5,0},{13,0}}, color={0,0,255}));
        connect(order2.p, bus2.p) annotation (Line(points={{99,0.04964},{89.5,0.04964},{89.5,0},{80,0}}, color={0,0,255}));
        connect(order2.vf, order2.vf0) annotation (Line(points={{120,5},{122,5},{122,14},{118,14},{118,11}}, color={0,0,127}));
        connect(order2.pm, order2.pm0) annotation (Line(points={{120,-5},{122,-5},{122,-6},{122,-14},{118,-14},{118,-11}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,80}})), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,80}})));
      end BaseNetwork;

      partial model BaseOrder3
        extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order3 order3(
          Sn=991,
          Vn=20,
          V_b=20,
          V_0=1.05,
          angle_0=0.159255652433349,
          ra=0,
          xd=2,
          xq=1.91,
          xd1=0.245,
          Td10=5,
          M=2.8756*2,
          P_0=89.9999999999999,
          Q_0=-9.0933105025882,
          D=0) annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
      equation
        connect(order3.pm, order3.pm0) annotation (Line(points={{-112,-5},{-114,-5},{-114,-6},{-114,-11},{-110,-11}}, color={0,0,127}));
        connect(order3.p, bus1.p) annotation (Line(points={{-91,0.04964},{-85.5,0.04964},{-85.5,0},{-80,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end BaseOrder3;

      partial model BaseOrder4
        extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseNetwork;

        OpenIPSL.Electrical.Machines.PSAT.Order4 order4(
          Sn=991,
          V_b=20,
          V_0=1.05,
          angle_0=0.159255652433349,
          P_0=89.9999999999999,
          Q_0=-9.0933105025882,
          ra=0,
          xd=2,
          xq=1.91,
          xd1=0.245,
          xq1=0.42,
          Td10=5,
          Tq10=0.66,
          M=2.8756*2,
          Vn=20,
          D=0) annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));

      equation
        connect(order4.pm, order4.pm0) annotation (Line(points={{-112,-5},{-114,-5},{-114,-6},{-114,-11},{-110,-11}}, color={0,0,127}));
        connect(order4.p, bus1.p) annotation (Line(points={{-91,0.04964},{-85.5,0.04964},{-85.5,0},{-80,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end BaseOrder4;

      partial model BaseOrder5
        extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 order5(
          Sn=991,
          Vn=20,
          V_b=20,
          V_0=1.05,
          angle_0=0.159255652433349,
          ra=0,
          Td10=5,
          xd2=0.2,
          xq2=0.2,
          Td20=0.05,
          Tq20=0.1,
          xd=1.1,
          xq=0.7,
          xd1=0.25,
          M=6,
          D=0,
          Taa=0.002,
          P_0=89.9999999999999,
          Q_0=-9.0933105025882) annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
      equation
        connect(order5.p, bus1.p) annotation (Line(points={{-91,0.04964},{-84.35,0.04964},{-84.35,0},{-80,0}}, color={0,0,255}));
        connect(order5.pm, order5.pm0) annotation (Line(points={{-112,-5},{-114,-5},{-114,-11},{-110,-11}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end BaseOrder5;

      partial model BaseOrder6
        extends PSAT_Systems.TwoAreaOld.BaseClasses.BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order6 order6(
          Sn=991,
          Vn=20,
          V_b=20,
          V_0=1.05,
          angle_0=0.159255652433349,
          ra=0,
          Td10=5,
          xd2=0.2,
          xq2=0.2,
          xd=2,
          xq=1.91,
          xd1=0.245,
          xq1=0.42,
          Tq10=0.66,
          Td20=0.031,
          Tq20=0.061,
          M=2.8756*2,
          D=0,
          Taa=0.002,
          P_0=89.9999999999999,
          Q_0=-9.0933105025882) annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
      equation
        connect(order6.p, bus1.p) annotation (Line(points={{-91,0.04964},{-85.5,0.04964},{-85.5,0},{-80,0}}, color={0,0,255}));
        connect(order6.pm, order6.pm0) annotation (Line(points={{-112,-5},{-114,-5},{-114,-6},{-114,-11},{-110,-11}}, color={0,0,127}));
      end BaseOrder6;
    end BaseClasses;
  end TwoAreaOld;

  package TwoArea "31-bus system"
    model ThirdOrder_AVRI "31-bus system with 3rd-order machine and AVR Type I"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder3;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198480294896434,
        vf0=1.045152426011381) annotation (Placement(transformation(extent={{-146,24},{-126,44}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-163,41})));
    equation
      connect(aVRTypeI.vf, order3_1.vf) annotation (Line(points={{-125,34.2},{-122.5,34.2},{-122.5,35},{-120,35}}, color={0,0,127}));
      connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-157.5,41},{-153.75,41},{-153.75,39.6},{-148.2,39.6}}, color={0,0,127}));
      connect(aVRTypeI.v, order3_1.v) annotation (Line(points={{-148.4,30.4},{-154,30.4},{-154,14},{-96,14},{-96,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end ThirdOrder_AVRI;

    model ThirdOrder_AVRII "31-bus system with 3rd-order machine and AVR Type II"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder3;

      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198480294896434,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        vf0=1.045301276070898) annotation (Placement(transformation(extent={{-150,22},{-130,42}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-167,49})));
    equation
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-161.5,49},{-158,49},{-158,37.4},{-148,37.4}}, color={0,0,127}));
      connect(aVRTypeII.vf, order3_1.vf) annotation (Line(points={{-131.5,34.6},{-125.75,34.6},{-125.75,35},{-120,35}}, color={0,0,127}));
      connect(aVRTypeII.v, order3_1.v) annotation (Line(points={{-148,31},{-150,31},{-150,30},{-152,30},{-152,16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end ThirdOrder_AVRII;

    model FourthOrder_AVRI "31-bus system with 4th-order machine and AVR Type I"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder4;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198480294896434,
        vf0=1.045301276070898) annotation (Placement(transformation(extent={{-146,26},{-128,44}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-163,51})));
    equation
      connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-157.5,51},{-154,51},{-154,40.04},{-147.98,40.04}}, color={0,0,127}));
      connect(aVRTypeI.vf, order4.vf) annotation (Line(points={{-127.1,35.18},{-123.55,35.18},{-123.55,35},{-120,35}}, color={0,0,127}));
      connect(aVRTypeI.v, order4.v) annotation (Line(points={{-148.16,31.76},{-152,31.76},{-152,16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRI;

    model FourthOrder_AVRII "31-bus system with 4th-order machine and AVR Type II"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder4;

      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198480294896434,
        vf0=1.045301276070898) annotation (Placement(transformation(extent={{-148,22},{-128,42}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-161,41})));
    equation
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-155.5,41},{-152,41},{-152,37.4},{-146,37.4}}, color={0,0,127}));
      connect(aVRTypeII.vf, order4.vf) annotation (Line(points={{-129.5,34.6},{-124.75,34.6},{-124.75,35},{-120,35}}, color={0,0,127}));
      connect(aVRTypeII.v, order4.v) annotation (Line(points={{-146,31},{-148,31},{-148,30},{-150,30},{-150,14},{-94,14},{-94,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRII;


    model FifthOrder_AVRI "31-bus system with 5th-order machine Type 2 and AVR Type I"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder5;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.197897259627584,
        vf0=1.041196707778194) annotation (Placement(transformation(extent={{-150,26},{-130,46}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.197897259627584) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-163,45})));
    equation
      connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-157.5,45},{-154,45},{-154,41.6},{-152.2,41.6}}, color={0,0,127}));
      connect(aVRTypeI.vf, order5.vf) annotation (Line(points={{-129,36.2},{-124.5,36.2},{-124.5,35},{-120,35}}, color={0,0,127}));
      connect(aVRTypeI.v, order5.v) annotation (Line(points={{-152.4,32.4},{-156,32.4},{-156,14},{-96,14},{-96,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FifthOrder_AVRI;

    model FifthOrder_AVRII "31-bus system with 5th-order machine Type 2 and AVR Type II"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder5;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.197897259627584,
        vf0=1.041196707778194) annotation (Placement(transformation(extent={{-148,22},{-128,42}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.197897259627584) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-161,41})));
    equation
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-155.5,41},{-152,41},{-152,37.4},{-146,37.4}}, color={0,0,127}));
      connect(aVRTypeII.vf, order5.vf) annotation (Line(points={{-129.5,34.6},{-124.75,34.6},{-124.75,35},{-120,35}}, color={0,0,127}));
      connect(aVRTypeII.v, order5.v) annotation (Line(points={{-146,31},{-150,31},{-150,18},{-94,18},{-94,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FifthOrder_AVRII;

    model SixthOrder_AVRI "31-bus system with 6th-order machine and AVR Type I"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder6;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198480294896434,
        vf0=1.045348880531484) annotation (Placement(transformation(extent={{-148,24},{-128,44}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-161,43})));
    equation
      connect(vref2.y, aVRTypeI.vref) annotation (Line(points={{-155.5,43},{-152,43},{-152,39.6},{-150.2,39.6}}, color={0,0,127}));
      connect(aVRTypeI.vf, order6.vf) annotation (Line(points={{-127,34.2},{-123.5,34.2},{-123.5,35},{-120,35}}, color={0,0,127}));
      connect(aVRTypeI.v, order6.v) annotation (Line(points={{-150.4,30.4},{-154,30.4},{-154,16},{-94,16},{-94,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end SixthOrder_AVRI;

    model SixthOrder_AVRII "31-bus system with 6th-order machine and AVR Type II"
      extends PSAT_Systems.TwoArea.BaseClasses.BaseOrder6;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vrmin=0,
        vrmax=7.57,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0,
        vref0=1.198480294896434,
        vf0=1.045348880531484,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1) annotation (Placement(transformation(extent={{-150,24},{-130,44}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198480294896434) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-163,43})));
    equation
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-157.5,43},{-154,43},{-154,39.4},{-148,39.4}}, color={0,0,127}));
      connect(aVRTypeII.vf, order6.vf) annotation (Line(points={{-131.5,36.6},{-125.75,36.6},{-125.75,35},{-120,35}}, color={0,0,127}));
      connect(aVRTypeII.v, order6.v) annotation (Line(points={{-148,33},{-152,33},{-152,18},{-152,16},{-96,16},{-96,33},{-99,33}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{180,100}}, preserveAspectRatio=false)),
        Icon(coordinateSystem(extent={{-180,-100},{180,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end SixthOrder_AVRII;

    package BaseClasses

      partial model BaseNetwork

        OpenIPSL.Electrical.Machines.PSAT.Order3 order3(
          Sn=991,
          Vn=20,
          V_b=20,
          V_0=1.081,
          ra=0,
          xd=2,
          xd1=0.245,
          Td10=5,
          xq=1.91,
          M=6,
          D=0,
          angle_0=0,
          P_0=-110.0000000000006,
          Q_0=30.3786000438159) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={150,-80})));
        OpenIPSL.Electrical.Buses.Bus B1 annotation (Placement(transformation(extent={{-88,22},{-72,38}})));
        OpenIPSL.Electrical.Buses.Bus B3 annotation (Placement(transformation(extent={{52,-48},{68,-32}})));
        OpenIPSL.Electrical.Buses.Bus B4 annotation (Placement(transformation(extent={{-88,-8},{-72,8}})));
        OpenIPSL.Electrical.Buses.Bus B5 annotation (Placement(transformation(extent={{-88,-88},{-72,-72}})));
        OpenIPSL.Electrical.Branches.PwLine L410(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-72,-2},{-66,2}})));
        OpenIPSL.Electrical.Events.PwFault pwFault(
          R=0.15,
          X=0,
          t1=2,
          t2=2.1) annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=-90,
              origin={64,-58})));
        OpenIPSL.Electrical.Buses.Bus B6 annotation (Placement(transformation(extent={{-48,22},{-32,38}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr16(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0,
          Sn=100,
          kT=1) annotation (Placement(transformation(extent={{-66,24},{-52,36}})));
        OpenIPSL.Electrical.Buses.Bus B7 annotation (Placement(transformation(extent={{-8,22},{8,38}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr67(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0,
          Sn=100,
          kT=1) annotation (Placement(transformation(extent={{-26,24},{-14,36}})));
        OpenIPSL.Electrical.Buses.Bus B8 annotation (Placement(transformation(extent={{32,22},{48,38}})));
        OpenIPSL.Electrical.Buses.Bus B9 annotation (Placement(transformation(extent={{72,22},{88,38}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr78(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0,
          Sn=100,
          kT=1) annotation (Placement(transformation(extent={{14,24},{26,36}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr89(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0,
          Sn=100,
          kT=1) annotation (Placement(transformation(extent={{54,24},{66,36}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr49(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0,
          Sn=100,
          kT=1) annotation (Placement(transformation(extent={{94,24},{106,36}})));
        OpenIPSL.Electrical.Buses.Bus B10 annotation (Placement(transformation(extent={{-68,-8},{-52,8}})));
        OpenIPSL.Electrical.Buses.Bus B2 annotation (Placement(transformation(extent={{112,-88},{128,-72}})));
        OpenIPSL.Electrical.Buses.Bus B11 annotation (Placement(transformation(extent={{-48,-8},{-32,8}})));
        OpenIPSL.Electrical.Buses.Bus B12 annotation (Placement(transformation(extent={{-28,-8},{-12,8}})));
        OpenIPSL.Electrical.Branches.PwLine L1011(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-54,-2},{-48,2}})));
        OpenIPSL.Electrical.Branches.PwLine L1112(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-34,-2},{-28,2}})));
        OpenIPSL.Electrical.Buses.Bus B13 annotation (Placement(transformation(extent={{-8,-8},{8,8}})));
        OpenIPSL.Electrical.Buses.Bus B14 annotation (Placement(transformation(extent={{12,-8},{28,8}})));
        OpenIPSL.Electrical.Buses.Bus B15 annotation (Placement(transformation(extent={{32,-8},{48,8}})));
        OpenIPSL.Electrical.Buses.Bus B16 annotation (Placement(transformation(extent={{52,-8},{68,8}})));
        OpenIPSL.Electrical.Buses.Bus B17 annotation (Placement(transformation(extent={{72,-8},{88,8}})));
        OpenIPSL.Electrical.Branches.PwLine L1213(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-14,-2},{-8,2}})));
        OpenIPSL.Electrical.Branches.PwLine L1314(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{6,-2},{12,2}})));
        OpenIPSL.Electrical.Branches.PwLine L1415(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{26,-2},{32,2}})));
        OpenIPSL.Electrical.Branches.PwLine L1516(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{46,-2},{52,2}})));
        OpenIPSL.Electrical.Branches.PwLine L1617(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{66,-2},{72,2}})));
        OpenIPSL.Electrical.Branches.PwLine L1718(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{88,-2},{94,2}})));
        OpenIPSL.Electrical.Buses.Bus B18 annotation (Placement(transformation(extent={{92,-8},{108,8}})));
        OpenIPSL.Electrical.Branches.PwLine L318(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(
              extent={{-3,-2},{3,2}},
              rotation=180,
              origin={71,-40})));
        OpenIPSL.Electrical.Buses.Bus B19 annotation (Placement(transformation(extent={{32,-48},{48,-32}})));
        OpenIPSL.Electrical.Buses.Bus B20 annotation (Placement(transformation(extent={{12,-48},{28,-32}})));
        OpenIPSL.Electrical.Buses.Bus B21 annotation (Placement(transformation(extent={{-8,-48},{8,-32}})));
        OpenIPSL.Electrical.Buses.Bus B22 annotation (Placement(transformation(extent={{-28,-48},{-12,-32}})));
        OpenIPSL.Electrical.Buses.Bus B23 annotation (Placement(transformation(extent={{-48,-48},{-32,-32}})));
        OpenIPSL.Electrical.Buses.Bus B24 annotation (Placement(transformation(extent={{-68,-48},{-52,-32}})));
        OpenIPSL.Electrical.Buses.Bus B25 annotation (Placement(transformation(extent={{-88,-48},{-72,-32}})));
        OpenIPSL.Electrical.Buses.Bus B26 annotation (Placement(transformation(extent={{-108,-48},{-92,-32}})));
        OpenIPSL.Electrical.Buses.Bus B27 annotation (Placement(transformation(extent={{-108,-88},{-92,-72}})));
        OpenIPSL.Electrical.Branches.PwLine L319(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{46,-42},{52,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L1920(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{26,-42},{32,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L2021(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{6,-42},{12,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L2122(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-14,-42},{-8,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L2223(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-34,-42},{-28,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L2324(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-54,-42},{-48,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L2425(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-74,-42},{-68,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L2526(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-94,-42},{-88,-38}})));
        OpenIPSL.Electrical.Branches.PwLine L2627(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-110,-82},{-104,-78}})));
        OpenIPSL.Electrical.Branches.PwLine L527(
          R=0,
          G=0,
          B=0,
          X=0.005) annotation (Placement(transformation(extent={{-88,-82},{-94,-78}})));
        OpenIPSL.Electrical.Buses.Bus B28 annotation (Placement(transformation(extent={{-48,-88},{-32,-72}})));
        OpenIPSL.Electrical.Buses.Bus B29 annotation (Placement(transformation(extent={{-8,-88},{8,-72}})));
        OpenIPSL.Electrical.Buses.Bus B30 annotation (Placement(transformation(extent={{32,-88},{48,-72}})));
        OpenIPSL.Electrical.Buses.Bus B31 annotation (Placement(transformation(extent={{72,-88},{88,-72}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr528(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0) annotation (Placement(transformation(extent={{-66,-86},{-52,-74}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr2829(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0) annotation (Placement(transformation(extent={{-26,-86},{-12,-74}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr2930(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0) annotation (Placement(transformation(extent={{14,-86},{28,-74}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr3031(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0) annotation (Placement(transformation(extent={{52,-86},{66,-74}})));
        OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr231(
          V_b=20,
          Vn=20,
          x=0.005,
          r=0) annotation (Placement(transformation(extent={{94,-86},{108,-74}})));
        inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-180,80},{-120,100}})));
      equation
        connect(Tr67.n, B7.p) annotation (Line(points={{-13.4,30},{0,30}}, color={0,0,255}));
        connect(Tr67.p, B6.p) annotation (Line(points={{-26.6,30},{-36.3,30},{-40,30}}, color={0,0,255}));
        connect(Tr16.n, B6.p) annotation (Line(points={{-51.3,30},{-51.3,30},{-40,30}}, color={0,0,255}));
        connect(Tr16.p, B1.p) annotation (Line(points={{-66.7,30},{-80,30}}, color={0,0,255}));
        connect(L410.n, B10.p) annotation (Line(points={{-65.5,0},{-60,0}}, color={0,0,255}));
        connect(L1011.n, B11.p) annotation (Line(points={{-47.5,0},{-47.5,0},{-40,0}}, color={0,0,255}));
        connect(B11.p, L1112.p) annotation (Line(points={{-40,0},{-34.5,0}}, color={0,0,255}));
        connect(B14.p, L1415.p) annotation (Line(points={{20,0},{25.5,0}}, color={0,0,255}));
        connect(B15.p, L1516.p) annotation (Line(points={{40,0},{45.5,0}}, color={0,0,255}));
        connect(B16.p, L1617.p) annotation (Line(points={{60,0},{65.5,0}}, color={0,0,255}));
        connect(L1617.n, B17.p) annotation (Line(points={{72.5,0},{72.5,0},{80,0}}, color={0,0,255}));
        connect(L319.n, B3.p) annotation (Line(points={{52.5,-40},{60,-40}}, color={0,0,255}));
        connect(L319.p, B19.p) annotation (Line(points={{45.5,-40},{45.5,-40},{40,-40}}, color={0,0,255}));
        connect(L1920.n, B19.p) annotation (Line(points={{32.5,-40},{32.5,-40},{40,-40}}, color={0,0,255}));
        connect(L1920.p, B20.p) annotation (Line(points={{25.5,-40},{25.5,-40},{20,-40}}, color={0,0,255}));
        connect(L2021.n, B20.p) annotation (Line(points={{12.5,-40},{12.5,-40},{20,-40}}, color={0,0,255}));
        connect(L2021.p, B21.p) annotation (Line(points={{5.5,-40},{5.5,-40},{0,-40}}, color={0,0,255}));
        connect(L2122.n, B21.p) annotation (Line(points={{-7.5,-40},{-7.5,-40},{0,-40}}, color={0,0,255}));
        connect(L2122.p, B22.p) annotation (Line(points={{-14.5,-40},{-14.5,-40},{-20,-40}}, color={0,0,255}));
        connect(L2223.n, B22.p) annotation (Line(points={{-27.5,-40},{-27.5,-40},{-20,-40}}, color={0,0,255}));
        connect(L2223.p, B23.p) annotation (Line(points={{-34.5,-40},{-34.5,-40},{-40,-40}}, color={0,0,255}));
        connect(L2324.p, B24.p) annotation (Line(points={{-54.5,-40},{-54.5,-40},{-60,-40}}, color={0,0,255}));
        connect(L2526.n, B25.p) annotation (Line(points={{-87.5,-40},{-87.5,-40},{-80,-40}}, color={0,0,255}));
        connect(L2526.p, B26.p) annotation (Line(points={{-94.5,-40},{-94.5,-40},{-100,-40}}, color={0,0,255}));
        connect(B26.p, L2627.p) annotation (Line(points={{-100,-40},{-116,-40},{-116,-80},{-110.5,-80}}, color={0,0,255}));
        connect(L2627.n, B27.p) annotation (Line(points={{-103.5,-80},{-103.5,-80},{-100,-80}}, color={0,0,255}));
        connect(B27.p, L527.n) annotation (Line(points={{-100,-80},{-94.5,-80}}, color={0,0,255}));
        connect(L527.p, B5.p) annotation (Line(points={{-87.5,-80},{-80,-80}}, color={0,0,255}));
        connect(Tr231.n, B2.p) annotation (Line(points={{108.7,-80},{116,-80},{120,-80}}, color={0,0,255}));
        connect(Tr231.p, B31.p) annotation (Line(points={{93.3,-80},{80,-80}}, color={0,0,255}));
        connect(Tr3031.n, B31.p) annotation (Line(points={{66.7,-80},{80,-80}}, color={0,0,255}));
        connect(Tr3031.p, B30.p) annotation (Line(points={{51.3,-80},{52,-80},{40,-80}}, color={0,0,255}));
        connect(Tr2930.n, B30.p) annotation (Line(points={{28.7,-80},{40,-80}}, color={0,0,255}));
        connect(Tr2930.p, B29.p) annotation (Line(points={{13.3,-80},{14.65,-80},{0,-80}}, color={0,0,255}));
        connect(Tr2829.n, B29.p) annotation (Line(points={{-11.3,-80},{0,-80}}, color={0,0,255}));
        connect(Tr528.n, B28.p) annotation (Line(points={{-51.3,-80},{-40,-80}}, color={0,0,255}));
        connect(Tr528.p, B5.p) annotation (Line(points={{-66.7,-80},{-80,-80}}, color={0,0,255}));
        connect(Tr78.p, B7.p) annotation (Line(points={{13.4,30},{6.7,30},{0,30}}, color={0,0,255}));
        connect(Tr78.n, B8.p) annotation (Line(points={{26.6,30},{33.3,30},{40,30}}, color={0,0,255}));
        connect(Tr89.p, B8.p) annotation (Line(points={{53.4,30},{46.7,30},{40,30}}, color={0,0,255}));
        connect(Tr89.n, B9.p) annotation (Line(points={{66.6,30},{73.3,30},{80,30}}, color={0,0,255}));
        connect(B10.p, L1011.p) annotation (Line(points={{-60,0},{-54.5,0}}, color={0,0,255}));
        connect(L1112.n, B12.p) annotation (Line(points={{-27.5,0},{-27.5,0},{-20,0}}, color={0,0,255}));
        connect(B12.p, L1213.p) annotation (Line(points={{-20,0},{-14.5,0}}, color={0,0,255}));
        connect(L1213.n, B13.p) annotation (Line(points={{-7.5,0},{-7.5,0},{0,0}}, color={0,0,255}));
        connect(B13.p, L1314.p) annotation (Line(points={{0,0},{5.5,0}}, color={0,0,255}));
        connect(L1314.n, B14.p) annotation (Line(points={{12.5,0},{16.25,0},{20,0}}, color={0,0,255}));
        connect(L1415.n, B15.p) annotation (Line(points={{32.5,0},{36.25,0},{40,0}}, color={0,0,255}));
        connect(L1516.n, B16.p) annotation (Line(points={{52.5,0},{56.25,0},{60,0}}, color={0,0,255}));
        connect(B9.p, Tr49.p) annotation (Line(points={{80,30},{93.4,30}}, color={0,0,255}));
        connect(B4.p, L410.p) annotation (Line(points={{-80,0},{-72.5,0}}, color={0,0,255}));
        connect(Tr49.n, B4.p) annotation (Line(points={{106.6,30},{110,30},{110,14},{-84,14},{-84,0},{-80,0}}, color={0,0,255}));
        connect(L1718.n, B18.p) annotation (Line(points={{94.5,0},{97.25,0},{100,0}}, color={0,0,255}));
        connect(B17.p, L1718.p) annotation (Line(points={{80,0},{87.5,0}}, color={0,0,255}));
        connect(B25.p, L2425.p) annotation (Line(points={{-80,-40},{-74.5,-40}}, color={0,0,255}));
        connect(L2425.n, B24.p) annotation (Line(points={{-67.5,-40},{-63.75,-40},{-60,-40}}, color={0,0,255}));
        connect(L2324.n, B23.p) annotation (Line(points={{-47.5,-40},{-43.75,-40},{-40,-40}}, color={0,0,255}));
        connect(B3.p, L318.n) annotation (Line(points={{60,-40},{67.5,-40}}, color={0,0,255}));
        connect(L318.p, B18.p) annotation (Line(points={{74.5,-40},{110,-40},{110,0},{100,0}}, color={0,0,255}));
        connect(pwFault.p, L318.n) annotation (Line(points={{64,-53.3333},{64,-40},{67.5,-40}}, color={0,0,255}));
        connect(B28.p, Tr2829.p) annotation (Line(points={{-40,-80},{-26.7,-80}}, color={0,0,255}));
        connect(B2.p, order3.p) annotation (Line(points={{120,-80},{139,-80},{139,-80.0496}}, color={0,0,255}));
        connect(order3.pm, order3.pm0) annotation (Line(points={{160,-75},{162,-75},{162,-69},{158,-69}}, color={0,0,127}));
        connect(order3.vf, order3.vf0) annotation (Line(points={{160,-85},{162,-85},{162,-86},{162,-91},{158,-91}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},{180,100}})), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},{180,100}})));
      end BaseNetwork;

      partial model BaseOrder3
        extends BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order3 order3_1(
          Sn=991,
          Vn=20,
          V_b=20,
          V_0=1.05,
          ra=0,
          xd=2,
          xq=1.91,
          xd1=0.245,
          Td10=5,
          M=2.8756*2,
          P_0=109.9999999999998,
          Q_0=-13.6620666228504,
          angle_0=0.145884959290248,
          D=0) annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
      equation
        connect(order3_1.p, B1.p) annotation (Line(points={{-99,30.0496},{-89.5,30.0496},{-89.5,30},{-80,30}}, color={0,0,255}));
        connect(order3_1.pm, order3_1.pm0) annotation (Line(points={{-120,25},{-122,25},{-122,20},{-122,19},{-118,19}}, color={0,0,127}));
      end BaseOrder3;

      partial model BaseOrder4
        extends BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order4 order4(
          Sn=991,
          Vn=20,
          V_b=20,
          V_0=1.05,
          ra=0,
          xd=2,
          xq=1.91,
          xd1=0.245,
          xq1=0.42,
          Td10=5,
          Tq10=0.66,
          M=2.8756*2,
          P_0=109.9999999999998,
          Q_0=-13.6620666228504,
          angle_0=0.145884959290248,
          D=0) annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
      equation
        connect(order4.p, B1.p) annotation (Line(points={{-99,30.0496},{-89.5,30.0496},{-89.5,30},{-80,30}}, color={0,0,255}));
        connect(order4.pm, order4.pm0) annotation (Line(points={{-120,25},{-122,25},{-122,24},{-122,19},{-118,19}}, color={0,0,127}));
      end BaseOrder4;

      partial model BaseOrder5
        extends BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 order5(
          Sn=991,
          Vn=20000,
          V_b=20000,
          V_0=1.05,
          ra=0,
          Td10=5,
          P_0=109.9999999999998,
          Q_0=-13.6620666228504,
          angle_0=0.145884959290248,
          xd=1.1,
          xq=0.7,
          xd1=0.25,
          xd2=0.2,
          xq2=0.2,
          Td20=0.05,
          Tq20=0.1,
          M=6,
          D=0,
          Taa=0.002) annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
      equation
        connect(order5.p, B1.p) annotation (Line(points={{-99,30.0496},{-89.5,30.0496},{-89.5,30},{-80,30}}, color={0,0,255}));
        connect(order5.pm, order5.pm0) annotation (Line(points={{-120,25},{-122,25},{-122,19},{-118,19}}, color={0,0,127}));
      end BaseOrder5;

      partial model BaseOrder6
        extends BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order6 order6(
          Sn=991,
          Vn=20,
          V_b=20,
          V_0=1.05,
          ra=0,
          Td10=5,
          angle_0=0.145884959290248,
          xd2=0.2,
          xq2=0.2,
          M=6,
          xd=2,
          xq=1.91,
          xd1=0.245,
          xq1=0.42,
          Tq10=0.66,
          Td20=0.031,
          Tq20=0.061,
          P_0=109.9999999999998,
          Q_0=-13.6620666228504,
          D=0,
          Taa=0.002) annotation (Placement(transformation(extent={{-120,20},{-100,40}})));

      equation
        connect(order6.p, B1.p) annotation (Line(points={{-99,30.0496},{-89.5,30.0496},{-89.5,30},{-80,30}}, color={0,0,255}));
        connect(order6.pm, order6.pm0) annotation (Line(points={{-120,25},{-122,25},{-122,19},{-118,19}}, color={0,0,127}));
      end BaseOrder6;
    end BaseClasses;
  end TwoArea;

  package ThreeArea "ABC test system"
    model ThirdOrder_AVRIII "ABC system with 3rd-order machines and AVR Type III"
      extends PSAT_Systems.ThreeArea.BaseClasses.BaseOrder3;
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
        T2=10,
        T1=1,
        Te=0.01,
        K0=25) annotation (Placement(transformation(extent={{-150,80},{-140,90}})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
        T2=10,
        T1=1,
        Te=0.01,
        K0=25) annotation (Placement(transformation(extent={{170,0},{160,10}})));
      Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=0,
            origin={-164,80})));
      Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(transformation(
            extent={{4,-4},{-4,4}},
            rotation=0,
            origin={184,0})));
    equation
      connect(Exc1.v, order3_1.v) annotation (Line(points={{-151,87.5},{-156,87.5},{-156,96},{-106,96},{-106,83},{-109,83}}, color={0,0,127}));
      connect(Exc2.v, order3_2.v) annotation (Line(points={{171,7.5},{174,7.5},{174,16},{128,16},{128,3},{131,3}}, color={0,0,127}));
      connect(vs_1.y, Exc1.vs) annotation (Line(points={{-159.6,80},{-156,80},{-156,83},{-151,83}}, color={0,0,127}));
      connect(vs_2.y, Exc2.vs) annotation (Line(points={{179.6,0},{174,0},{174,3},{171,3}}, color={0,0,127}));
      connect(Exc1.vf0, order3_1.vf0) annotation (Line(points={{-145,91},{-145,94},{-128,94},{-128,91}}, color={0,0,127}));
      connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{165,11},{165,14},{150,14},{150,11}}, color={0,0,127}));
      connect(Exc1.vf, order3_1.vf) annotation (Line(points={{-139.5,85},{-134.75,85},{-134.75,85},{-130,85}}, color={0,0,127}));
      connect(order3_2.vf, Exc2.vf) annotation (Line(points={{152,5},{156,5},{156,5},{159.5,5}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(extent={{-180,-120},{200,120}}, preserveAspectRatio=false)), Icon(coordinateSystem(extent={{-180,-120},{200,120}})));
    end ThirdOrder_AVRIII;

    model FourthOrder_AVRIII "ABC system with 4th-order machine (Syn2) and AVR Type III"

      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        anglev0=0.820649645221365,
        p0=0.499999999999999,
        q0=0.197946892114272,
        D0=2,
        T1q0=0.4) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
        T2=10,
        T1=1,
        Te=0.01,
        vref=1.05,
        v0=1.05,
        v(start=1.091853765980819),
        K0=25) annotation (Placement(transformation(extent={{-164,86},{-154,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        anglev0=0.755059086011694,
        p0=0.500000000000002,
        q0=0.219157659600514,
        D0=2,
        Taa=0) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
        T2=10,
        T1=1,
        Te=0.01,
        vref=1.05,
        v0=1.05,
        v(start=1.095878696492499),
        K0=25) annotation (Placement(transformation(extent={{78,-34},{88,-24}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-153.5,91},{-148,91},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-165,93.5},{-172,93.5},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.vf0, Exc1.vf0) annotation (Line(
          points={{-114.8,90.8},{-112,90.8},{-112,64},{-172,64},{-172,89.5},{-165,89.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{88.5,-29},{99.25,-29},{99.25,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.v, Syn3.v) annotation (Line(
          points={{77,-26.5},{68,-26.5},{68,-14},{144,-14},{144,-28.3977},{135.3,-28.3977}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.vf0, Exc2.vf0) annotation (Line(
          points={{135.3,-21.3},{148,-21.3},{148,-56},{76,-56},{76,-30.5},{77,-30.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-180,-100},{160,100}})));
    end FourthOrder_AVRIII;

    model FifthOrder_AVRIII "ABC system with 5th-order machine (Syn2) and AVR Type III"

      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.FifthOrder.Order5Type2_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        p0=0.499999999999999,
        q0=0.197946892114272,
        D0=2,
        T1q0=0.4,
        x2d0=0.25,
        x2q0=0.25,
        T2d0=0.03,
        T2q0=0.05,
        v0=1.05,
        anglev0=0.820649645221366) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
        T2=10,
        T1=1,
        Te=0.01,
        K0=25,
        vref=1.05,
        v0=1.05) annotation (Placement(transformation(extent={{-164,86},{-154,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        anglev0=0.755059086011694,
        p0=0.500000000000002,
        q0=0.219157659600514,
        D0=2,
        Taa=0) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
        T2=10,
        T1=1,
        Te=0.01,
        vref=1.05,
        v0=1.05,
        v(start=1.095878696492499),
        K0=25) annotation (Placement(transformation(extent={{78,-34},{88,-24}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-153.5,91},{-148,91},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-165,93.5},{-172,93.5},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.vf0, Exc1.vf0) annotation (Line(
          points={{-114.8,90.8},{-112,90.8},{-112,64},{-172,64},{-172,89.5},{-165,89.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{88.5,-29},{99.25,-29},{99.25,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.v, Syn3.v) annotation (Line(
          points={{77,-26.5},{68,-26.5},{68,-14},{144,-14},{144,-28.3977},{135.3,-28.3977}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.vf0, Exc2.vf0) annotation (Line(
          points={{135.3,-21.3},{148,-21.3},{148,-56},{76,-56},{76,-30.5},{77,-30.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-180,-100},{160,100}})));
    end FifthOrder_AVRIII;

    model SixthOrder_AVRIII "ABC system with 6th-order machine (Syn2) and AVR Type III"

      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.SixthOrder.Order6_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        p0=0.499999999999999,
        q0=0.197946892114272,
        D0=2,
        T1q0=0.4,
        x2d0=0.25,
        x2q0=0.25,
        T2d0=0.03,
        T2q0=0.05,
        v0=1.05,
        anglev0=0.820649645221366,
        x1q0=0.55) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
        T2=10,
        T1=1,
        Te=0.01,
        K0=25,
        vref=1.05,
        v0=1.05) annotation (Placement(transformation(extent={{-164,86},{-154,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        anglev0=0.755059086011694,
        p0=0.500000000000002,
        q0=0.219157659600514,
        D0=2,
        Taa=0) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
        T2=10,
        T1=1,
        Te=0.01,
        vref=1.05,
        v0=1.05,
        v(start=1.095878696492499),
        K0=25) annotation (Placement(transformation(extent={{78,-34},{88,-24}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-153.5,91},{-148,91},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-165,93.5},{-172,93.5},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.vf0, Exc1.vf0) annotation (Line(
          points={{-114.8,90.8},{-112,90.8},{-112,64},{-172,64},{-172,89.5},{-165,89.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{88.5,-29},{99.25,-29},{99.25,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.v, Syn3.v) annotation (Line(
          points={{77,-26.5},{68,-26.5},{68,-14},{144,-14},{144,-28.3977},{135.3,-28.3977}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.vf0, Exc2.vf0) annotation (Line(
          points={{135.3,-21.3},{148,-21.3},{148,-56},{76,-56},{76,-30.5},{77,-30.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics), Icon(coordinateSystem(extent={{-180,-100},{160,100}})));
    end SixthOrder_AVRIII;

    model ThirdOrder_AVRI "ABC system with 3rd-order machines and AVR Type I"
      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820)) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        anglev0=0.755059086011694,
        p0=0.500000000000002,
        q0=0.219157659600514,
        D0=2,
        Taa=0) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vref0=1.093835147859700,
        vf0=1.095878696492499,
        v(start=1.095878696492499)) annotation (Placement(transformation(extent={{80,-32},{90,-22}})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={57,-23})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-149.5,91.1},{-148,91.1},{-148,86.7866},{-142.4,86.7866}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-161.2,89.2},{-172,89.2},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-161.1,84.5},{-161.1,93.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{90.5,-26.9},{97.25,-26.9},{97.25,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{142,-28.3977},{142,-14},{70,-14},{70,-28.8},{78.8,-28.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{62.5,-23},{71.25,-23},{71.25,-24.2},{78.9,-24.2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end ThirdOrder_AVRI;

    model FourthOrder_AVRI "ABC system with 4th-order machines (Syn2) and AVR Type I"

      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274,
        x1q0=0.55,
        T1q0=0.4) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820)) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        anglev0=0.755059086011694,
        p0=0.500000000000002,
        q0=0.219157659600514,
        D0=2,
        Taa=0) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vref0=1.093835147859700,
        vf0=1.095878696492499,
        v(start=1.095878696492499)) annotation (Placement(transformation(extent={{84,-32},{94,-22}})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={61,-23})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-149.5,91.1},{-148,91.1},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-161.2,89.2},{-172,89.2},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-161.1,84.5},{-161.1,93.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{94.5,-26.9},{99.25,-26.9},{99.25,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{66.5,-23},{74.25,-23},{74.25,-24.2},{82.9,-24.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{140,-28.3977},{140,-14},{74,-14},{74,-28.8},{82.8,-28.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          Interval=0.001,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRI;

    model FifthOrder_AVRI "ABC system with 5th-order machines Type II (Syn2) and AVR Type I"
      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.FifthOrder.Order5Type2_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274,
        T1q0=0.4,
        x2d0=0.25,
        x2q0=0.25,
        T2d0=0.03,
        T2q0=0.05) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820)) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        anglev0=0.755059086011694,
        p0=0.500000000000002,
        q0=0.219157659600514,
        D0=2,
        Taa=0) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={63,-21})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vref0=1.093835147859700,
        vf0=1.095878696492499,
        v(start=1.095878696492499)) annotation (Placement(transformation(extent={{86,-30},{96,-20}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-149.5,91.1},{-148,91.1},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-161.2,89.2},{-172,89.2},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-161.1,84.5},{-161.1,93.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{96.5,-24.9},{101.25,-24.9},{101.25,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{68.5,-21},{76.25,-21},{76.25,-22.2},{84.9,-22.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{146,-28.3977},{146,-16},{80,-16},{80,-26.8},{84.8,-26.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          Interval=0.001,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FifthOrder_AVRI;

    model SixthOrder_AVRI "ABC system with 6th-order machines (Syn2) and AVR Type I"
      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.SixthOrder.Order6_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274,
        T1q0=0.4,
        x2d0=0.25,
        x2q0=0.25,
        T2d0=0.03,
        T2q0=0.05,
        x1q0=0.55) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc1(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820)) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        anglev0=0.755059086011694,
        p0=0.500000000000002,
        q0=0.219157659600514,
        D0=2,
        Taa=0) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={63,-23})));
      Electrical.Controls.PSAT.AVR.AVRTypeI Exc2(
        Te=0.01,
        v0=1.05,
        K0=25,
        vrmax=5,
        vrmin=-5,
        T1=10,
        T2=6.67,
        Tr=0.001,
        vref0=1.093835147859700,
        vf0=1.095878696492499,
        v(start=1.095878696492499)) annotation (Placement(transformation(extent={{86,-32},{96,-22}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-89.8,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-98.2,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-23.2},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-14.8},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-126.2,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-117.8,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-121.8,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-130.2,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,36.8},{-120,36.8}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,45.2}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-88.2,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-79.8,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-67.8,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-76.2,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-82.2,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-73.8,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-14.2,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-5.8,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{55.8,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{64.2,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{91.8,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{100.2,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-5.8,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-14.2,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-6.8},{-46,19},{-14.2,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-15.2},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-22.2,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{17.8,-16},{17.8,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{26.2,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-13.8,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-149.5,91.1},{-148,91.1},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-161.2,89.2},{-172,89.2},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{33,-27},{33,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-161.1,84.5},{-161.1,93.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{96.5,-26.9},{101.25,-26.9},{101.25,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{68.5,-23},{84.9,-23},{84.9,-24.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{146,-28.3977},{146,-14},{78,-14},{78,-28.8},{84.8,-28.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          Interval=0.001,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end SixthOrder_AVRI;

    model ThirdOrder_AVRII "ABC system with 3rd-order machines and AVR Type II"
      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc1(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820),
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        D0=2,
        Taa=0,
        anglev0=0.755059086011696,
        p0=0.500000000000001,
        q0=0.219157659600512) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={59,-21})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc2(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0,
        v(start=1.095878696492499),
        vref0=1.093835147859700,
        vf0=1.095878696492499) annotation (Placement(transformation(extent={{82,-32},{92,-22}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-150.75,92.3},{-148,92.3},{-148,86.7866},{-142.4,86.7866}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-159,90.5},{-172,90.5},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-159,84.5},{-159,93.7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{91.25,-25.7},{98.625,-25.7},{98.625,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{64.5,-21},{74.25,-21},{74.25,-24.3},{83,-24.3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{148,-28.3977},{148,-16},{72,-16},{72,-27.5},{83,-27.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end ThirdOrder_AVRII;

    model FourthOrder_AVRII "ABC system with 4th-order machines (Syn2) and AVR Type II"
      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274,
        x1q0=0.55,
        T1q0=0.4) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc1(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820),
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        D0=2,
        Taa=0,
        anglev0=0.755059086011696,
        p0=0.500000000000001,
        q0=0.219157659600512) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={59,-21})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc2(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0,
        v(start=1.095878696492499),
        vref0=1.093835147859700,
        vf0=1.095878696492499) annotation (Placement(transformation(extent={{82,-32},{92,-22}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-150.75,92.3},{-148,92.3},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-159,90.5},{-172,90.5},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-159,84.5},{-159,93.7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{91.25,-25.7},{98.625,-25.7},{98.625,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{64.5,-21},{74.25,-21},{74.25,-24.3},{83,-24.3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{148,-28.3977},{148,-16},{72,-16},{72,-27.5},{83,-27.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRII;

    model FifthOrder_AVRII "ABC system with 5th-order machines (Syn2) and AVR Type II"
      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.FifthOrder.Order5Type2_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274,
        T1q0=0.4,
        x2d0=0.25,
        x2q0=0.25,
        T2d0=0.03,
        T2q0=0.05) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc1(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820),
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        D0=2,
        Taa=0,
        anglev0=0.755059086011696,
        p0=0.500000000000001,
        q0=0.219157659600512) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={59,-21})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc2(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0,
        v(start=1.095878696492499),
        vref0=1.093835147859700,
        vf0=1.095878696492499) annotation (Placement(transformation(extent={{82,-32},{92,-22}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-150.75,92.3},{-148,92.3},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-159,90.5},{-172,90.5},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-159,84.5},{-159,93.7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{91.25,-25.7},{98.625,-25.7},{98.625,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{64.5,-21},{74.25,-21},{74.25,-24.3},{83,-24.3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{148,-28.3977},{148,-16},{72,-16},{72,-27.5},{83,-27.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FifthOrder_AVRII;

    model SixthOrder_AVRII "ABC system with 6th-order machines (Syn2) and AVR Type II"
      OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-82,-48})));
      OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-126,-30})));
      OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-138,-6})));
      OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-100,0})));
      OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-140,30})));
      OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-118,52})));
      OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=90,
            origin={-68,68})));
      OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
            extent={{-12,-12},{12,12}},
            rotation=0,
            origin={-96,82})));
      OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{-70,-12},{-46,12}})));
      OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{28,-14},{56,14}})));
      OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{64,-14},{92,14}})));
      OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{98,-14},{126,14}})));
      OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{-46,-30},{-18,-2}})));
      OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{-14,-30},{14,-2}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-100,-42},{-88,-28}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-132,-19})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-128,-8},{-116,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-84,-8},{-72,6}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
        R=0,
        G=0,
        B=0,
        X=1.2) annotation (Placement(transformation(extent={{-16,12},{-4,26}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=-90,
            origin={-46,-11})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-24,-24},{-12,-10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{16,-6},{28,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{54,-6},{66,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{90,-6},{102,8}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
        R=0,
        G=0,
        B=0,
        X=0.4) annotation (Placement(transformation(
            extent={{-6,-7},{6,7}},
            rotation=90,
            origin={-120,41})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
        R=0,
        G=0,
        B=0,
        X=0.1) annotation (Placement(transformation(extent={{-90,50},{-78,64}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-78,74},{-66,88}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
        R=0,
        G=0,
        B=0,
        X=0.2) annotation (Placement(transformation(extent={{-132,10},{-120,24}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
        R=0,
        G=0,
        B=0,
        X=1.3) annotation (Placement(transformation(extent={{-16,32},{-4,46}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn1(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        v0=1.050000000000000,
        ra0=0,
        M0=14,
        p0=-0.999999999999999,
        q0=0.413913357523525,
        D0=2,
        x1d0=0.3) annotation (Placement(transformation(extent={{-128,-80},{-108,-60}})));
      Electrical.Machines.PSAT.SixthOrder.Order6_Inputs_Outputs Syn2(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=21,
        v0=1.05,
        D0=2,
        anglev0=0.820649645221366,
        p0=0.5,
        q0=0.197946892114274,
        T1q0=0.4,
        x2d0=0.25,
        x2q0=0.25,
        T2d0=0.03,
        T2q0=0.05,
        x1q0=0.55) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc1(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        vf0=1.091853765980820,
        vref0=1.093674150639233,
        v(start=1.091853765980820),
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-160,86},{-150,96}})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
      OpenIPSL.Electrical.Machines.PSAT.ThirdOrder.Order3_Inputs_Outputs Syn3(
        Sn=900,
        Vn=1000,
        Vbus=1000,
        ra0=0,
        xd0=1.8,
        x1d0=0.3,
        M0=7,
        v0=1.05,
        D0=2,
        Taa=0,
        anglev0=0.755059086011696,
        p0=0.500000000000001,
        q0=0.219157659600512) annotation (Placement(transformation(extent={{108,-46},{134,-20}})));
      Modelica.Blocks.Sources.Constant vref(k=1.093674150639233) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,75})));
      Modelica.Blocks.Sources.Constant vref1(k=1.093835147859700) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={59,-21})));
      Electrical.Controls.PSAT.AVR.AVRTypeII Exc2(
        Te=0.01,
        v0=1.05,
        vrmax=5,
        vrmin=-5,
        Tr=0.001,
        Ka=25,
        Ta=10,
        Kf=6.67,
        Tf=1,
        Ke=1,
        Ae=0,
        Be=0,
        v(start=1.095878696492499),
        vref0=1.093835147859700,
        vf0=1.095878696492499) annotation (Placement(transformation(extent={{82,-32},{92,-22}})));
    equation
      connect(pwLine1to4.n, B100.p) annotation (Line(
          points={{-87,-35},{-82,-35},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.p, B200.p) annotation (Line(
          points={{-101,-35},{-126,-35},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.n, B200.p) annotation (Line(
          points={{-132,-26},{-132,-26},{-126,-26},{-126,-30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to1.p, B300.p) annotation (Line(
          points={{-132,-12},{-132,-14},{-138,-14},{-138,-6}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B300.p, pwLine1to2.p) annotation (Line(
          points={{-138,-6},{-138,-1},{-129,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to2.n, B400.p) annotation (Line(
          points={{-115,-1},{-107.9,-1},{-107.9,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.n, B400.p) annotation (Line(
          points={{-119,17},{-108,17},{-108,0},{-100,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to14.p, B500.p) annotation (Line(
          points={{-133,17},{-140,17},{-140,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B500.p, pwLine1to11.p) annotation (Line(
          points={{-140,30},{-140,34},{-120,34}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to11.n) annotation (Line(
          points={{-118,52},{-120,52},{-120,48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B600.p, pwLine1to12.p) annotation (Line(
          points={{-118,52},{-118,57},{-91,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B700.p, pwLine1to12.n) annotation (Line(
          points={{-68,68},{-68,57},{-77,57}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.n, B700.p) annotation (Line(
          points={{-65,81},{-68,81},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to13.p, B800.p) annotation (Line(
          points={{-79,81},{-86.1,81},{-86.1,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B400.p, pwLine1to3.p) annotation (Line(
          points={{-100,0},{-92,0},{-92,-1},{-85,-1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to3.n, B900.p) annotation (Line(
          points={{-71,-1},{-66.9,-1},{-66.9,0},{-58,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B900.p, pwLine1to5.p) annotation (Line(
          points={{-58,0},{-46,0},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to5.n, B1000.p) annotation (Line(
          points={{-3,19},{34,19},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1000.p, pwLine1to9.p) annotation (Line(
          points={{42,1.77636e-015},{50,1.77636e-015},{50,1},{53,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to9.n, B1100.p) annotation (Line(
          points={{67,1},{71.1,1},{71.1,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1100.p, pwLine1to10.p) annotation (Line(
          points={{78,0},{84,0},{84,1},{89,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to10.n, B1200.p) annotation (Line(
          points={{103,1},{108.1,1},{108.1,0},{112,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.n, B1000.p) annotation (Line(
          points={{-3,39},{34,39},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to15.p, B700.p) annotation (Line(
          points={{-17,39},{-68,39},{-68,68}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.p, pwLine1to5.p) annotation (Line(
          points={{-46,-4},{-46,19},{-17,19}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to6.n, B1300.p) annotation (Line(
          points={{-46,-18},{-46,-16},{-32,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1300.p, pwLine1to7.p) annotation (Line(
          points={{-32,-16},{-28,-16},{-28,-17},{-25,-17}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1400.p, pwLine1to8.p) annotation (Line(
          points={{1.77636e-015,-16},{15,-16},{15,1}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to8.n, B1000.p) annotation (Line(
          points={{29,1},{34,1},{34,1.77636e-015},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to7.n, B1400.p) annotation (Line(
          points={{-11,-17},{-4.9,-17},{-4.9,-16},{1.77636e-015,-16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn1.p, B100.p) annotation (Line(
          points={{-107,-70.1504},{-82,-70.1504},{-82,-48}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn2.pm0, Syn2.pm) annotation (Line(
          points={{-114.8,87.5406},{-102,87.5406},{-102,62},{-150,62},{-150,75.2},{-142.4,75.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn2.p, B800.p) annotation (Line(
          points={{-114.8,79.8196},{-108,79.8196},{-108,82},{-96,82}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Exc1.vf, Syn2.vf) annotation (Line(
          points={{-150.75,92.3},{-148,92.3},{-148,86.8222},{-142.4,86.8222}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc1.v, Syn2.v) annotation (Line(
          points={{-159,90.5},{-172,90.5},{-172,100},{-112,100},{-112,84.2483},{-114.8,84.2483}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwFault.p, B1000.p) annotation (Line(
          points={{28.3333,-28},{28.3333,-12},{42,-12},{42,1.77636e-015}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(B1200.p, Syn3.p) annotation (Line(
          points={{112,1.77636e-015},{152,1.77636e-015},{152,-33.1955},{135.3,-33.1955}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Syn3.pm, Syn3.pm0) annotation (Line(
          points={{105.4,-38.2},{90,-38.2},{90,-70},{144,-70},{144,-24.831},{135.3,-24.831}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, Exc1.vref) annotation (Line(
          points={{-167.5,75},{-167.5,84.5},{-159,84.5},{-159,93.7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Exc2.vf, Syn3.vf) annotation (Line(
          points={{91.25,-25.7},{98.625,-25.7},{98.625,-25.6479},{105.4,-25.6479}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref1.y, Exc2.vref) annotation (Line(
          points={{64.5,-21},{74.25,-21},{74.25,-24.3},{83,-24.3}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Syn3.v, Exc2.v) annotation (Line(
          points={{135.3,-28.3977},{148,-28.3977},{148,-16},{72,-16},{72,-27.5},{83,-27.5}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end SixthOrder_AVRII;

    package BaseClasses

      partial model BaseNetwork
        OpenIPSL.Electrical.Machines.PSAT.Order2 order2(
          Sn=900,
          V_0=1.050000000000000,
          ra=0,
          M=14,
          D=2,
          xd1=0.3,
          P_0=-99.9999999999999,
          Q_0=41.3913357523525,
          V_b=1000,
          Vn=1000) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-84,-80})));
        OpenIPSL.Electrical.Buses.Bus B100 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=90,
              origin={-84,-60})));
        OpenIPSL.Electrical.Buses.Bus B200 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=90,
              origin={-84,-40})));
        OpenIPSL.Electrical.Buses.Bus B300 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=90,
              origin={-84,-20})));
        OpenIPSL.Electrical.Buses.Bus B400 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=0,
              origin={0,0})));
        OpenIPSL.Electrical.Buses.Bus B500 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=90,
              origin={-84,20})));
        OpenIPSL.Electrical.Buses.Bus B600 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=90,
              origin={-84,40})));
        OpenIPSL.Electrical.Buses.Bus B700 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=180,
              origin={-80,80})));
        OpenIPSL.Electrical.Buses.Bus B800 annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=0,
              origin={-100,80})));
        OpenIPSL.Electrical.Buses.Bus B900 annotation (Placement(transformation(extent={{12,-8},{28,8}})));
        OpenIPSL.Electrical.Buses.Bus B1000 annotation (Placement(transformation(extent={{72,-8},{88,8}})));
        OpenIPSL.Electrical.Buses.Bus B1100 annotation (Placement(transformation(extent={{92,-8},{108,8}})));
        OpenIPSL.Electrical.Buses.Bus B1200 annotation (Placement(transformation(extent={{112,-8},{128,8}})));
        OpenIPSL.Electrical.Buses.Bus B1300 annotation (Placement(transformation(extent={{32,-8},{48,8}})));
        OpenIPSL.Electrical.Buses.Bus B1400 annotation (Placement(transformation(extent={{52,-8},{68,8}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
          R=0,
          G=0,
          B=0,
          X=0.1) annotation (Placement(transformation(
              extent={{-3.5,-2.50002},{3.5,2.50002}},
              rotation=-90,
              origin={-84.5,-50.5})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to1(
          R=0,
          G=0,
          B=0,
          X=0.1) annotation (Placement(transformation(
              extent={{-3,-2},{3,2}},
              rotation=-90,
              origin={-84,-31})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to2(
          R=0,
          G=0,
          B=0,
          X=0.2) annotation (Placement(transformation(extent={{-54,-2},{-48,2}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to3(
          R=0,
          G=0,
          B=0,
          X=0.1) annotation (Placement(transformation(extent={{6,-2},{12,2}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to5(
          R=0,
          G=0,
          B=0,
          X=1.2) annotation (Placement(transformation(extent={{46,18},{52,22}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to6(
          R=0,
          G=0,
          B=0,
          X=0.1) annotation (Placement(transformation(
              extent={{-3,-2},{3,2}},
              rotation=0,
              origin={31,0})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to7(
          R=0,
          G=0,
          B=0,
          X=0.2) annotation (Placement(transformation(extent={{46,-2},{52,2}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to8(
          R=0,
          G=0,
          B=0,
          X=0.2) annotation (Placement(transformation(extent={{66,-2},{72,2}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to9(
          R=0,
          G=0,
          B=0,
          X=0.1) annotation (Placement(transformation(extent={{86,-2},{92,2}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to10(
          R=0,
          G=0,
          B=0,
          X=0.1) annotation (Placement(transformation(extent={{106,-2},{112,2}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to11(
          R=0,
          G=0,
          B=0,
          X=0.4) annotation (Placement(transformation(
              extent={{-3.5,-2.50001},{3.5,2.50003}},
              rotation=90,
              origin={-84.5,31.5})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to12(
          R=0,
          G=0,
          B=0,
          X=0.1) annotation (Placement(transformation(
              extent={{-3.50001,-2.50002},{3.50001,2.50002}},
              rotation=90,
              origin={-83.5,56.5})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to13(
          R=0,
          G=0,
          B=0,
          X=0.2) annotation (Placement(transformation(extent={{-92,78},{-86,82}})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to14(
          R=0,
          G=0,
          B=0,
          X=0.2) annotation (Placement(transformation(
              extent={{-2.99999,-1.99996},{2.99998,2}},
              rotation=180,
              origin={-50,9})));
        OpenIPSL.Electrical.Branches.PwLine pwLine1to15(
          R=0,
          G=0,
          B=0,
          X=1.3) annotation (Placement(transformation(extent={{-50,78},{-44,82}})));
        OpenIPSL.Electrical.Events.PwFault pwFault(
          R=0.15,
          X=0,
          t1=2,
          t2=2.1) annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=-90,
              origin={84,-24})));
        inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-180,100},{-120,120}})));
      equation
        connect(pwLine1to4.n, B100.p) annotation (Line(
            points={{-84.5,-54.5833},{-84,-54.5833},{-84,-60}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to4.p, B200.p) annotation (Line(
            points={{-84.5,-46.4167},{-84,-46.4167},{-84,-40}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to1.p, B300.p) annotation (Line(
            points={{-84,-27.5},{-84,-20}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B500.p, pwLine1to11.p) annotation (Line(
            points={{-84,20},{-84,27.4167},{-84.5,27.4167}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B600.p, pwLine1to11.n) annotation (Line(
            points={{-84,40},{-84,35.5833},{-84.5,35.5833}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B600.p, pwLine1to12.p) annotation (Line(
            points={{-84,40},{-84,52.4167},{-83.5,52.4167}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to13.n, B700.p) annotation (Line(
            points={{-85.5,80},{-80,80}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to13.p, B800.p) annotation (Line(
            points={{-92.5,80},{-100,80}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B400.p, pwLine1to3.p) annotation (Line(
            points={{0,0},{5.5,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to3.n, B900.p) annotation (Line(
            points={{12.5,0},{20,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B1000.p, pwLine1to9.p) annotation (Line(
            points={{80,0},{85.5,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to9.n, B1100.p) annotation (Line(
            points={{92.5,0},{100,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B1100.p, pwLine1to10.p) annotation (Line(
            points={{100,0},{105.5,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to10.n, B1200.p) annotation (Line(
            points={{112.5,0},{120,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to15.n, B1000.p) annotation (Line(
            points={{-43.5,80},{76,80},{76,0},{80,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to15.p, B700.p) annotation (Line(
            points={{-50.5,80},{-80,80}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to6.n, B1300.p) annotation (Line(
            points={{34.5,0},{40,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B1300.p, pwLine1to7.p) annotation (Line(
            points={{40,0},{45.5,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(B1400.p, pwLine1to8.p) annotation (Line(
            points={{60,0},{65.5,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to8.n, B1000.p) annotation (Line(
            points={{72.5,0},{80,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwLine1to7.n, B1400.p) annotation (Line(
            points={{52.5,0},{60,0}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(pwFault.p, pwLine1to9.p) annotation (Line(points={{84,-19.3333},{84,0},{85.5,0}}, color={0,0,255}));
        connect(pwLine1to5.n, B1000.p) annotation (Line(points={{52.5,20},{76,20},{76,0},{80,0}}, color={0,0,255}));
        connect(pwLine1to6.p, B900.p) annotation (Line(points={{27.5,0},{23.75,0},{20,0}}, color={0,0,255}));
        connect(pwLine1to5.p, B900.p) annotation (Line(points={{45.5,20},{24,20},{24,0},{20,0}}, color={0,0,255}));
        connect(pwLine1to12.n, B700.p) annotation (Line(points={{-83.5,60.5833},{-83.5,80},{-80,80}}, color={0,0,255}));
        connect(pwLine1to2.n, B400.p) annotation (Line(points={{-47.5,0},{-47.5,0},{0,0}},color={0,0,255}));
        connect(pwLine1to1.n, B200.p) annotation (Line(points={{-84,-34.5},{-84,-37.25},{-84,-40}}, color={0,0,255}));
        connect(order2.p, B100.p) annotation (Line(points={{-84.0496,-69},{-84.0496,-64.5},{-84,-64.5},{-84,-60}}, color={0,0,255}));
        connect(order2.pm0, order2.pm) annotation (Line(points={{-73,-88},{-70,-88},{-70,-92},{-78,-92},{-78,-90},{-79,-90}}, color={0,0,127}));
        connect(order2.vf0, order2.vf) annotation (Line(points={{-95,-88},{-96,-88},{-96,-92},{-89,-92},{-89,-90}}, color={0,0,127}));
        connect(pwLine1to14.n, B500.p) annotation (Line(points={{-53.5,8.99998},{-84,8.99998},{-84,20}}, color={0,0,255}));
        connect(pwLine1to14.p, B400.p) annotation (Line(points={{-46.5,8.99998},{-4,8.99998},{-4,0},{0,0}}, color={0,0,255}));
        connect(pwLine1to2.p, B300.p) annotation (Line(points={{-54.5,0},{-84,0},{-84,-20}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{180,120}})), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-120},{180,120}})));
      end BaseNetwork;

      partial model BaseOrder3
        extends BaseNetwork;
        OpenIPSL.Electrical.Machines.PSAT.Order3 order3_2(
          Sn=900,
          Vn=1,
          ra=0,
          xd=1.8,
          xd1=0.3,
          M=7,
          V_0=1.05,
          angle_0=0.755059086011694,
          P_0=50.0000000000002,
          Q_0=21.9157659600514,
          D=2,
          Td10=8,
          xq=1.7,
          V_b=1000) annotation (Placement(transformation(extent={{152,-10},{132,10}})));

        OpenIPSL.Electrical.Machines.PSAT.Order3 order3_1(
          Sn=900,
          ra=0,
          xd=1.8,
          xd1=0.3,
          M=21,
          V_0=1.05,
          angle_0=0.820649645221365,
          D=2,
          P_0=49.9999999999999,
          Q_0=19.7946892114272,
          Td10=8,
          xq=1.7,
          V_b=1000,
          Vn=1000) annotation (Placement(transformation(extent={{-130,70},{-110,90}})));
      equation
        connect(order3_1.p, B800.p) annotation (Line(points={{-109,80.0496},{-104.5,80.0496},{-104.5,80},{-100,80}}, color={0,0,255}));
        connect(order3_1.pm, order3_1.pm0) annotation (Line(points={{-130,75},{-132,75},{-132,74},{-132,70},{-132,69},{-128,69}}, color={0,0,127}));
        connect(order3_2.p, B1200.p) annotation (Line(points={{131,0.04964},{125.5,0.04964},{125.5,0},{120,0}}, color={0,0,255}));
        connect(order3_2.pm, order3_2.pm0) annotation (Line(points={{152,-5},{154,-5},{154,-6},{154,-11},{150,-11}}, color={0,0,127}));
      end BaseOrder3;
    end BaseClasses;
  end ThreeArea;

  package DiscreteAVR "contains test systems to validate discrete AVR models"
    model FourthOrder_AVRII_Continuous "5-bus system with 4th-order machine and AVR Type II"
      OpenIPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-80,-12},{-56,12}})));
      OpenIPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(extent={{102,-12},{126,12}})));
      OpenIPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(extent={{20,20},{44,44}})));
      OpenIPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(extent={{-22,-12},{2,12}})));
      OpenIPSL.Electrical.Buses.Bus bus5 annotation (Placement(transformation(extent={{60,20},{84,44}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{4,-10},{24,10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{42,22},{62,42}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{88,-10},{108,10}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn2(
        Sn=991,
        Vn=20000,
        Vbus=20000,
        v0=1.081,
        p0=-0.900000000000001,
        q0=0.239371894974117,
        ra0=0,
        x1d0=0.01,
        M0=6) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={140,0})));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vf0=1.046883400898693,
        vref0=1.198705028536746,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-154,-6},{-134,14}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-167,13})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        ground=1,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{38,-8},{58,12}})));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs(
        Sn=991,
        Vn=20000,
        Vbus=20000,
        v0=1.05,
        anglev0=0.159255652433349,
        p0=0.899999999999999,
        q0=-0.090933105025882,
        ra0=0,
        xd0=2,
        xq0=1.91,
        x1d0=0.245,
        x1q0=0.42,
        T1d0=5,
        T1q0=0.66,
        M0=2.8756*2) annotation (Placement(transformation(extent={{-114,-12},{-88,16}})));
    equation
      connect(bus1.p, pwLine1to4.p) annotation (Line(
          points={{-68,0},{-49.6667,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.n, bus4.p) annotation (Line(
          points={{-26.3333,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus4.p, pwLine1.p) annotation (Line(
          points={{-10,0},{2.33333,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwLine1.n) annotation (Line(
          points={{32,32},{26,32},{26,0},{25.6667,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwLine2.p) annotation (Line(
          points={{32,32},{40.3333,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine2.n, bus5.p) annotation (Line(
          points={{63.6667,32},{72,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus5.p, pwLine3.p) annotation (Line(
          points={{72,32},{86.3333,32},{86.3333,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine3.n, bus2.p) annotation (Line(
          points={{109.667,0},{114,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus2.p, Syn2.p) annotation (Line(
          points={{114,0},{122,0},{122,0.15036},{129,0.15036}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(vref2.y, aVRTypeII.vref) annotation (Line(points={{-161.5,13},{-158,13},{-158,9.4},{-152,9.4}}, color={0,0,127}));
      connect(bus3.p, pwFault.p) annotation (Line(points={{32,32},{36,32},{36,28},{36,2},{36,2},{36.3333,2}}, color={0,0,255}));
      connect(order4_Inputs_Outputs.p, bus1.p) annotation (Line(points={{-86.7,1.7895},{-77.35,1.7895},{-77.35,0},{-68,0}}, color={0,0,255}));
      connect(aVRTypeII.vf, order4_Inputs_Outputs.vf) annotation (Line(points={{-135.5,6.6},{-116.6,6.6},{-116.6,9.95928}}, color={0,0,127}));
      connect(order4_Inputs_Outputs.v, aVRTypeII.v) annotation (Line(points={{-86.7,6.95636},{-80,6.95636},{-80,-20},{-164,-20},{-164,3},{-152,3}}, color={0,0,127}));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm) annotation (Line(points={{-86.7,10.7974},{-76,10.7974},{-76,-14},{-128,-14},{-128,-3.6},{-116.6,-3.6}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Rkfix2"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRII_Continuous;

    model FourthOrder_AVRII_Discrete "5-bus system with 4th-order machine and AVRTypeII_Discrete"

      OpenIPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-56,-12},{-32,12}})));
      OpenIPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(extent={{102,-12},{126,12}})));
      OpenIPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(extent={{20,20},{44,44}})));
      OpenIPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(extent={{-22,-12},{2,12}})));
      OpenIPSL.Electrical.Buses.Bus bus5 annotation (Placement(transformation(extent={{60,20},{84,44}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{4,-10},{24,10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{42,22},{62,42}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{88,-10},{108,10}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn2(
        Sn=991,
        Vn=20000,
        Vbus=20000,
        v0=1.081,
        p0=-0.900000000000001,
        q0=0.239371894974117,
        ra0=0,
        x1d0=0.01,
        M0=6) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={140,0})));
      Electrical.Controls.PSAT.AVR.AVRTypeII_discrete aVRTypeII(
        v0=1.05,
        vf0=1.046883400898693,
        vref0=1.198705028536746,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-142,-6},{-122,14}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-175,31})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        ground=1,
        t1=2,
        t2=2.1) annotation (Placement(transformation(extent={{38,-8},{58,12}})));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs(
        Sn=991,
        Vn=20000,
        Vbus=20000,
        v0=1.05,
        anglev0=0.159255652433349,
        p0=0.899999999999999,
        q0=-0.090933105025882,
        ra0=0,
        xd0=2,
        xq0=1.91,
        x1d0=0.245,
        x1q0=0.42,
        T1d0=5,
        T1q0=0.66,
        M0=2.8756*2) annotation (Placement(transformation(extent={{-92,-12},{-66,16}})));
      Modelica_Synchronous.RealSignals.Sampler.Hold hold1(y_start=1.046883400898693) annotation (Placement(transformation(extent={{-112,4},{-100,16}})));
      Modelica_Synchronous.RealSignals.Sampler.Sample sample1 annotation (Placement(transformation(extent={{-160,26},{-148,38}})));
      Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample2 annotation (Placement(transformation(extent={{-166,-2},{-154,10}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
        useSolver=true,
        period=0.01,
        solverMethod="ImplicitEuler") annotation (Placement(transformation(extent={{-172,-48},{-160,-36}})));
    equation
      connect(bus1.p, pwLine1to4.p) annotation (Line(
          points={{-44,0},{-39.6667,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.n, bus4.p) annotation (Line(
          points={{-16.3333,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus4.p, pwLine1.p) annotation (Line(
          points={{-10,0},{2.33333,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwLine1.n) annotation (Line(
          points={{32,32},{26,32},{26,0},{25.6667,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwLine2.p) annotation (Line(
          points={{32,32},{40.3333,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine2.n, bus5.p) annotation (Line(
          points={{63.6667,32},{72,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus5.p, pwLine3.p) annotation (Line(
          points={{72,32},{86.3333,32},{86.3333,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine3.n, bus2.p) annotation (Line(
          points={{109.667,0},{114,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus2.p, Syn2.p) annotation (Line(
          points={{114,0},{122,0},{122,0.15036},{129,0.15036}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwFault.p) annotation (Line(points={{32,32},{36,32},{36,28},{36,2},{36,2},{36.3333,2}}, color={0,0,255}));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm) annotation (Line(points={{-64.7,10.7974},{-50,10.7974},{-50,-14},{-102,-14},{-102,-3.6},{-94.6,-3.6}}, color={0,0,127}));
      connect(order4_Inputs_Outputs.p, bus1.p) annotation (Line(
          points={{-64.7,1.7895},{-57.35,1.7895},{-57.35,0},{-44,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hold1.y, order4_Inputs_Outputs.vf) annotation (Line(
          points={{-99.4,10},{-102,10},{-102,9.95928},{-94.6,9.95928}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref2.y, sample1.u) annotation (Line(
          points={{-169.5,31},{-162.75,31},{-162.75,32},{-161.2,32}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sample1.y, aVRTypeII.vref) annotation (Line(
          points={{-147.4,32},{-144,32},{-144,9.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(aVRTypeII.vf, hold1.u) annotation (Line(
          points={{-121,4},{-118,4},{-118,10},{-113.2,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sample2.y, aVRTypeII.v) annotation (Line(
          points={{-153.4,4},{-148,4},{-148,2.4},{-144,2.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.v, sample2.u) annotation (Line(
          points={{-64.7,6.95636},{-56,6.95636},{-56,-22},{-176,-22},{-176,4},{-167.2,4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(periodicClock1.y, sample2.clock)
        annotation (Line(
          points={{-159.4,-42},{-160,-42},{-160,-3.2}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          Interval=0.01,
          Tolerance=0.001,
          __Dymola_fixedstepsize=0.01,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRII_Discrete;

    model FourthOrder_AVRIII_Continuous "4th-order machine with AVR Type III"

      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ1(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={93.147,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,-20.6714},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1,
        t1=22,
        t2=22.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,4.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={57.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine4(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,19.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ2(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={97.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1(
        s0=1,
        Tr=0.05,
        vf0=1.0641) annotation (Placement(visible=true, transformation(
            origin={-81.654,42.5917},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs annotation (Placement(transformation(extent={{-45,25},{-20,55}})));
    equation
      connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
          visible=true,
          origin={77.076,17.3286},
          points={{-15.2126,2},{3.0709,2},{3.0709,-2},{9.071,-2}}));
      connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
          visible=true,
          origin={47.8634,11.8286},
          points={{0.0,7.5},{0.0,-7.5}}));
      connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
          visible=true,
          origin={81,-19.5},
          points={{-16.5,-0.5},{3.5,-0.5},{3.5,0.5},{9.5,0.5}}));
      connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
          visible=true,
          origin={61.8634,11.8286},
          points={{0.0,-7.5},{0.0,7.5}}));
      connect(pwLine2.n, pwLine4.p) annotation (Line(
          visible=true,
          origin={37.1134,16.8286},
          points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
      connect(pwLine1.n, pwLine3.p) annotation (Line(
          visible=true,
          origin={39.0909,-12.8357},
          points={{-17.5608,-7.8357},{5.4091,-7.8357},{5.4091,-7.1643},{6.74243,-7.1643}}));
      connect(pwLine1.n, pwLine2.n) annotation (Line(
          visible=true,
          origin={16.8634,4.3286},
          points={{4.66667,-25},{4.66667,-20},{5,-20},{5,-10},{0,-10},{0,10}}));
      connect(pwLine2.p, pwLine1.p) annotation (Line(
          visible=true,
          origin={2.8634,4.3286},
          points={{-4.66667,10},{-4.66667,0},{-5,0},{-5,-10},{0,-10},{0,-25}}));
      connect(order4_Inputs_Outputs.v, AVRtypeIII1.v)
        annotation (Line(
          points={{-18.75,45.3104},{0,45.3104},{0,60},{-100,60},{-100,42.5917},{-91.554,42.5917}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm)
        annotation (Line(
          points={{-18.75,49.4258},{-5,49.4258},{-5,20},{-55,20},{-55,34},{-47.5,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
          points={{-18.75,39.7745},{-10,39.7745},{-10,14.3286},{2.8634,14.3286}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(AVRtypeIII1.vf, order4_Inputs_Outputs.vf)
        annotation (Line(
          points={{-70.654,42.5917},{-55.327,42.5917},{-55.327,48.5278},{-47.5,48.5278}},
          color={0,0,127},
          smooth=Smooth.None));

      annotation (
        Diagram(coordinateSystem(
            extent={{-148.5,-105},{148.5,105}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={5,5}), graphics={Text(
              visible=true,
              origin={45,50},
              fillPattern=FillPattern.Solid,
              extent={{-35.0,-5.8583},{35.0,5.8583}},
              textString="SystemSbase=100 MVA",
              fontName="Arial")}),
        experiment(
          StopTime=20,
          Interval=0.01,
          __Dymola_fixedstepsize=0.01,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRIII_Continuous;

    model FourthOrder_AVRIII_Discrete "4th-order machine with AVR Type III discrete"

      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ1(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={93.147,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,-20.6714},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1,
        t1=22,
        t2=22.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,4.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={57.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine4(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,19.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ2(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={97.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      Electrical.Controls.PSAT.AVR.AVRtypeIII_discrete AVRtypeIII_discrete(vref=1)
        annotation (Placement(visible=true, transformation(
            origin={-96.654,47.5917},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs annotation (Placement(transformation(extent={{-45,25},{-20,55}})));
      Modelica_Synchronous.RealSignals.Sampler.Hold hold1(y_start=1.0641) annotation (Placement(transformation(extent={{-72,44},{-60,56}})));
      Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample2 annotation (Placement(transformation(extent={{-136,43},{-124,55}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
        solverMethod="ImplicitEuler",
        useSolver=true,
        period=0.01) annotation (Placement(transformation(extent={{-142,-18},{-130,-6}})));
    equation
      connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
          visible=true,
          origin={77.076,17.3286},
          points={{-15.2126,2},{3.0709,2},{3.0709,-2},{9.071,-2}}));
      connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
          visible=true,
          origin={47.8634,11.8286},
          points={{0.0,7.5},{0.0,-7.5}}));
      connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
          visible=true,
          origin={81,-19.5},
          points={{-16.5,-0.5},{3.5,-0.5},{3.5,0.5},{9.5,0.5}}));
      connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
          visible=true,
          origin={61.8634,11.8286},
          points={{0.0,-7.5},{0.0,7.5}}));
      connect(pwLine2.n, pwLine4.p) annotation (Line(
          visible=true,
          origin={37.1134,16.8286},
          points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
      connect(pwLine1.n, pwLine3.p) annotation (Line(
          visible=true,
          origin={39.0909,-12.8357},
          points={{-17.5608,-7.8357},{5.4091,-7.8357},{5.4091,-7.1643},{6.74243,-7.1643}}));
      connect(pwLine1.n, pwLine2.n) annotation (Line(
          visible=true,
          origin={16.8634,4.3286},
          points={{4.66667,-25},{4.66667,-20},{5,-20},{5,-10},{0,-10},{0,10}}));
      connect(pwLine2.p, pwLine1.p) annotation (Line(
          visible=true,
          origin={2.8634,4.3286},
          points={{-4.66667,10},{-4.66667,0},{-5,0},{-5,-10},{0,-10},{0,-25}}));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm)
        annotation (Line(
          points={{-18.75,49.4258},{-5,49.4258},{-5,20},{-55,20},{-55,34},{-47.5,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
          points={{-18.75,39.7745},{-10,39.7745},{-10,14.3286},{2.8634,14.3286}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(hold1.y, order4_Inputs_Outputs.vf) annotation (Line(
          points={{-59.4,50},{-55,50},{-55,48.5278},{-47.5,48.5278}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(order4_Inputs_Outputs.v, sample2.u) annotation (Line(
          points={{-18.75,45.3104},{-15,45.3104},{-15,15},{-145,15},{-145,49},{-137.2,49}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(periodicClock1.y, sample2.clock)
        annotation (Line(
          points={{-129.4,-12},{-130,-12},{-130,41.8}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
      connect(sample2.y, AVRtypeIII_discrete.v) annotation (Line(
          points={{-123.4,49},{-114.2,49},{-114.2,47.5917},{-106.554,47.5917}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(AVRtypeIII_discrete.vf, hold1.u) annotation (Line(
          points={{-85.654,47.5917},{-80.327,47.5917},{-80.327,50},{-73.2,50}},
          color={0,0,127},
          smooth=Smooth.None));

      annotation (
        Diagram(coordinateSystem(
            extent={{-148.5,-105},{148.5,105}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={5,5}), graphics={Text(
              visible=true,
              origin={45,50},
              fillPattern=FillPattern.Solid,
              extent={{-35.0,-5.8583},{35.0,5.8583}},
              textString="SystemSbase=100 MVA",
              fontName="Arial")}),
        experiment(
          StopTime=20,
          __Dymola_NumberOfIntervals=1000,
          __Dymola_fixedstepsize=0.0001,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRIII_Discrete;

    model FourthOrder_AVRIII_Discrete2 "4th-order machine with Continuous AVR Type III"

      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ1(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={93.147,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,-20.6714},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1,
        t1=2,
        t2=2.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,4.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={57.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine4(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,19.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ2(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={97.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1(
        vf0=1.046883400898693,
        Tr=0.05,
        s0=1) annotation (Placement(visible=true, transformation(
            origin={-86.654,42.5917},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs annotation (Placement(transformation(extent={{-45,25},{-20,55}})));
      Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample2 annotation (Placement(transformation(extent={{-121,38},{-109,50}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
        useSolver=true,
        period=0.01,
        solverMethod="ImplicitEuler") annotation (Placement(transformation(extent={{-142,2},{-130,14}})));
      Modelica_Synchronous.RealSignals.Sampler.Hold hold1(y_start=1.046883400898693) annotation (Placement(transformation(extent={{-67,39},{-55,51}})));
    equation
      connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
          visible=true,
          origin={77.076,17.3286},
          points={{-15.2126,2},{3.0709,2},{3.0709,-2},{9.071,-2}}));
      connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
          visible=true,
          origin={47.8634,11.8286},
          points={{0.0,7.5},{0.0,-7.5}}));
      connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
          visible=true,
          origin={81,-19.5},
          points={{-16.5,-0.5},{3.5,-0.5},{3.5,0.5},{9.5,0.5}}));
      connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
          visible=true,
          origin={61.8634,11.8286},
          points={{0.0,-7.5},{0.0,7.5}}));
      connect(pwLine2.n, pwLine4.p) annotation (Line(
          visible=true,
          origin={37.1134,16.8286},
          points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
      connect(pwLine1.n, pwLine3.p) annotation (Line(
          visible=true,
          origin={39.0909,-12.8357},
          points={{-17.5608,-7.8357},{5.4091,-7.8357},{5.4091,-7.1643},{6.74243,-7.1643}}));
      connect(pwLine1.n, pwLine2.n) annotation (Line(
          visible=true,
          origin={16.8634,4.3286},
          points={{4.66667,-25},{4.66667,-20},{5,-20},{5,-10},{4.66667,-10},{4.66667,10}}));
      connect(pwLine2.p, pwLine1.p) annotation (Line(
          visible=true,
          origin={2.8634,4.3286},
          points={{-4.66667,10},{-4.66667,0},{-5,0},{-5,-10},{-4.66667,-10},{-4.66667,-25}}));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm)
        annotation (Line(
          points={{-18.75,49.4258},{-5,49.4258},{-5,20},{-55,20},{-55,34},{-47.5,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
          points={{-18.75,39.7745},{-10,39.7745},{-10,14.3286},{2.8634,14.3286}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(hold1.y, order4_Inputs_Outputs.vf) annotation (Line(
          points={{-54.4,45},{-47.5,45},{-47.5,48.5278}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hold1.u, AVRtypeIII1.vf) annotation (Line(
          points={{-68.2,45},{-70,45},{-70,42.5917},{-75.654,42.5917}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sample2.u, order4_Inputs_Outputs.v) annotation (Line(
          points={{-122.2,44},{-125,44},{-125,65},{-10,65},{-10,45.3104},{-18.75,45.3104}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(periodicClock1.y, sample2.clock)
        annotation (Line(
          points={{-129.4,8},{-115,8},{-115,36.8}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
      connect(sample2.y, AVRtypeIII1.v) annotation (Line(
          points={{-108.4,44},{-101.7,44},{-101.7,47.5917},{-98.654,47.5917}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(
            extent={{-148.5,-105},{148.5,105}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={5,5}), graphics={Text(
              visible=true,
              origin={45,50},
              fillPattern=FillPattern.Solid,
              extent={{-35.0,-5.8583},{35.0,5.8583}},
              textString="SystemSbase=100 MVA",
              fontName="Arial")}),
        experiment(
          StopTime=20,
          Interval=0.01,
          __Dymola_fixedstepsize=0.001,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRIII_Discrete2;

    model FourthOrder_No_AVR "4th-order machine with No AVR"

      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ1(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={93.147,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,-20.6714},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1,
        t1=22,
        t2=22.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,4.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={57.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine4(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,19.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ2(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={97.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      Electrical.Machines.PSAT.FourthOrder.Order4 Order4 annotation (Placement(transformation(extent={{-45,25},{-20,55}})));
    equation
      connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
          visible=true,
          origin={77.076,17.3286},
          points={{-15.2126,2},{3.0709,2},{3.0709,-2},{9.071,-2}}));
      connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
          visible=true,
          origin={47.8634,11.8286},
          points={{0.0,7.5},{0.0,-7.5}}));
      connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
          visible=true,
          origin={81,-19.5},
          points={{-16.5,-0.5},{3.5,-0.5},{3.5,0.5},{9.5,0.5}}));
      connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
          visible=true,
          origin={61.8634,11.8286},
          points={{0.0,-7.5},{0.0,7.5}}));
      connect(pwLine2.n, pwLine4.p) annotation (Line(
          visible=true,
          origin={37.1134,16.8286},
          points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
      connect(pwLine1.n, pwLine3.p) annotation (Line(
          visible=true,
          origin={39.0909,-12.8357},
          points={{-17.5608,-7.8357},{5.4091,-7.8357},{5.4091,-7.1643},{6.74243,-7.1643}}));
      connect(pwLine1.n, pwLine2.n) annotation (Line(
          visible=true,
          origin={16.8634,4.3286},
          points={{4.66667,-25},{4.66667,-20},{5,-20},{5,-10},{4.66667,-10},{4.66667,10}}));
      connect(pwLine2.p, pwLine1.p) annotation (Line(
          visible=true,
          origin={2.8634,4.3286},
          points={{-4.66667,10},{-4.66667,0},{-5,0},{-5,-10},{-4.66667,-10},{-4.66667,-25}}));
      connect(Order4.p, pwLine2.p) annotation (Line(
          points={{-18.75,39.7745},{-10,39.7745},{-10,14.3286},{2.8634,14.3286}},
          color={0,0,255},
          smooth=Smooth.None));

      annotation (
        Diagram(coordinateSystem(
            extent={{-148.5,-105},{148.5,105}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={5,5}), graphics={Text(
              visible=true,
              origin={45,50},
              fillPattern=FillPattern.Solid,
              extent={{-35.0,-5.8583},{35.0,5.8583}},
              textString="SystemSbase=100 MVA",
              fontName="Arial")}),
        experiment(
          StopTime=20,
          __Dymola_NumberOfIntervals=1000,
          __Dymola_fixedstepsize=0.01,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_No_AVR;

    model FourthOrder_InlineAVR "Implement a discrete AVR Type III inline text "
      extends FourthOrder_No_AVR;
      parameter Real vref=1 "Initialization";
      parameter Real v0=0.964756 "initial voltage after power flow";
      parameter Real vfmax=2;
      parameter Real vfmin=-2;
      parameter Real K0=100 "regulator gain";
      parameter Real T2=0.1 "regulator pole";
      parameter Real T1=0.45 "Regulator zero";
      parameter Real Te=0.1 "Field circuit time constant";
      parameter Real vr0=K0*T2*(vref - v0) "Initialization";
      parameter Real vf0=(T1/T2)*K0*(vref - v0) + (1 - T1/T2)*(vr0/T2) + vf_0 "Initialization";
      parameter Real vf_0=1.03176;
      discrete Real vd(start=v0);
      discrete Real vr(start=vr0, fixed=true);
      discrete Real vf1;
      discrete Real vf(start=vf0);
      output Real vfc;

    equation
      vd = sample(Order4.v, Clock(0.01));

      vr = K0*(vref - vd) - previous(vr)/T2;
      vf = (K0*(T1/T2)*(vref - vd) + (1 - T1/T2)*(vr/T2) + vf_0 - previous(vf))/Te;

      if vf >= vfmin and vf <= vfmax then
        vf1 = vf;
      elseif vf > vfmax then
        vf1 = vfmax;
      else
        vf1 = vfmin;
      end if;

      vfc = hold(vf);
    end FourthOrder_InlineAVR;

    model FourthOrder_InlineAVRTypeII "Implement a discrete AVR Type II inline text "
      extends FourthOrder_No_AVR;

      //Real vref = 1.198705028536746 "Initialization";
      //parameter Real vref0 = 1.198705028536746 "Initialization";
      //   parameter Real vrmin = 0 "Minimum regulator voltage, p.u";
      //   parameter Real vrmax = 7.57 "Maximum regulator voltage, p.u";
      //   parameter Real Ka = 7.04 "Amplifier gain, p.u/p.u";
      //   parameter Real Ta = 0.4 "Amplifier time constant, s";
      //   parameter Real Kf = 1 "Stabilizer gain, p.u/p.u";
      //   parameter Real Tf = 0.05 "Stabilizer time constant, s";
      //   parameter Real Ke = 1 "Field circuit integral deviation, p.u/p.u";
      //   parameter Real Te = 0.4 "Field circui time constant, s";
      parameter Real Tr=0.05 "Measurement time constant, s";
      //   parameter Real Ae = 0.0006 "1st ceiling coefficient";
      //   parameter Real Be = 0.9 "2nd ceiling coefficient";
      parameter Real v0=0.964756 "Initialization";
      parameter Real vf0=1.03176 "Initialization";
      // parameter Real vm0 = v0 "Initialization";
      //   parameter Real vr10 = Ka * (vref0 - vm0 - vr20 - vf0 * Kf / Tf)
      //     "Initialization";
      //   parameter Real vr20 = -vf0 * Kf / Tf "Initialization";
      //   parameter Real e = Modelica.Constants.e;
      //   Real Se;
      // discrete Real vrefd;
      Real vm(start=v0, fixed=true);
      //   discrete Real vr1(start = vr10, fixed = true);
      //   discrete Real vr2(start = vr20, fixed = true);
      //   discrete Real vr;

      output Real vf(start=vf0);
      discrete Real vd(start=v0);
      //   output Real vfc;
      Clock c=Clock(Clock(0.001), solverMethod="ImplicitEuler");

    equation
      vd = sample(Order4.v, c);
      //
      vm = previous(vm) + (vd - previous(vm))/Tr;

      //   vr2 = -(previous(vf) * Kf / Tf + previous(vr2)) / Tf;
      //   vr1 = (Ka * (vref - vm - vr2 - previous(vf) * Kf / Tf) - previous(vr1)) / Ta;
      //   if vr1 >= vrmin and vr1 <= vrmax then
      //     vr = vr1;
      //   elseif vr1 > vrmax then
      //     vr = vrmax;
      //   else
      //     vr = vrmin;
      //   end if;
      //
      //   Se = Ae * e ^ (Be * abs(previous(vf)));
      //   vf = -(previous(vf) * (Ke + Se) - vr) / Te;
      //
      //   vfc = hold(vf);

      //   vf = Kf*vm;
      //   vfc = hold(vf);

      //////////////////////////////////
      // der(vm) = (vd - vm) / Tr;

      vf = hold(vm);

      annotation (experiment(
          StopTime=20,
          Interval=0.01,
          __Dymola_fixedstepsize=0.01,
          __Dymola_Algorithm="Euler"), __Dymola_experimentSetupOutput);
    end FourthOrder_InlineAVRTypeII;

    model FourthOrder_AVRII_Discretized_Continuous "5-bus system with 4th-order machine and AVR Type II + Sample and Hold"
      OpenIPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-54,-12},{-30,12}})));
      OpenIPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(extent={{102,-12},{126,12}})));
      OpenIPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(extent={{20,20},{44,44}})));
      OpenIPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(extent={{-22,-12},{2,12}})));
      OpenIPSL.Electrical.Buses.Bus bus5 annotation (Placement(transformation(extent={{60,20},{84,44}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1to4(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{4,-10},{24,10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{42,22},{62,42}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        R=0,
        X=0.05,
        G=0,
        B=0) annotation (Placement(transformation(extent={{88,-10},{108,10}})));
      OpenIPSL.Electrical.Machines.PSAT.SecondOrder.Order2 Syn2(
        Sn=991,
        Vn=20000,
        Vbus=20000,
        v0=1.081,
        p0=-0.900000000000001,
        q0=0.239371894974117,
        ra0=0,
        x1d0=0.01,
        M0=6) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={140,0})));
      Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
        v0=1.05,
        vf0=1.046883400898693,
        vref0=1.198705028536746,
        vrmin=0,
        vrmax=7.57,
        Ka=7.04,
        Ta=0.4,
        Kf=1,
        Tf=0.05,
        Ke=1,
        Te=0.4,
        Tr=0.05,
        Ae=0,
        Be=0) annotation (Placement(transformation(extent={{-138,-2},{-118,18}})));
      Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-173,47})));
      OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.15,
        X=0,
        ground=1,
        t1=22,
        t2=22.1) annotation (Placement(transformation(extent={{38,-8},{58,12}})));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs(
        Sn=991,
        Vn=20000,
        Vbus=20000,
        v0=1.05,
        anglev0=0.159255652433349,
        p0=0.899999999999999,
        q0=-0.090933105025882,
        ra0=0,
        xd0=2,
        xq0=1.91,
        x1d0=0.245,
        x1q0=0.42,
        T1d0=5,
        T1q0=0.66,
        M0=2.8756*2) annotation (Placement(transformation(extent={{-88,-12},{-62,16}})));
      Modelica_Synchronous.RealSignals.Sampler.Sample sample1 annotation (Placement(transformation(extent={{-158,8},{-146,20}})));
      Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample2 annotation (Placement(transformation(extent={{-158,-2},{-146,10}})));
      Modelica_Synchronous.RealSignals.Sampler.Hold hold1(y_start=1.046883400898693) annotation (Placement(transformation(extent={{-112,4},{-100,16}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
        period=0.01,
        useSolver=true,
        solverMethod="ImplicitEuler") annotation (Placement(transformation(extent={{-174,-48},{-162,-36}})));
    equation
      connect(bus1.p, pwLine1to4.p) annotation (Line(
          points={{-42,0},{-37.6667,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine1to4.n, bus4.p) annotation (Line(
          points={{-14.3333,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus4.p, pwLine1.p) annotation (Line(
          points={{-10,0},{2.33333,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwLine1.n) annotation (Line(
          points={{32,32},{26,32},{26,0},{25.6667,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwLine2.p) annotation (Line(
          points={{32,32},{40.3333,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine2.n, bus5.p) annotation (Line(
          points={{63.6667,32},{72,32}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus5.p, pwLine3.p) annotation (Line(
          points={{72,32},{86.3333,32},{86.3333,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pwLine3.n, bus2.p) annotation (Line(
          points={{109.667,0},{114,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus2.p, Syn2.p) annotation (Line(
          points={{114,0},{122,0},{122,0.15036},{129,0.15036}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(bus3.p, pwFault.p) annotation (Line(points={{32,32},{36,32},{36,28},{36,2},{36,2},{36.3333,2}}, color={0,0,255}));
      connect(order4_Inputs_Outputs.p, bus1.p) annotation (Line(points={{-60.7,1.7895},{-49.35,1.7895},{-49.35,0},{-42,0}}, color={0,0,255}));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm) annotation (Line(points={{-60.7,10.7974},{-48,10.7974},{-48,-14},{-100,-14},{-100,-3.6},{-90.6,-3.6}}, color={0,0,127}));
      connect(sample1.y, aVRTypeII.vref) annotation (Line(
          points={{-145.4,14},{-140,14},{-140,13.4},{-136,13.4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref2.y, sample1.u) annotation (Line(
          points={{-167.5,47},{-167.5,14},{-159.2,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(hold1.y, order4_Inputs_Outputs.vf) annotation (Line(
          points={{-99.4,10},{-96,10},{-96,9.95928},{-90.6,9.95928}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(aVRTypeII.vf, hold1.u) annotation (Line(
          points={{-119.5,10.6},{-115.75,10.6},{-115.75,10},{-113.2,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sample2.y, aVRTypeII.v) annotation (Line(
          points={{-145.4,4},{-140,4},{-140,7},{-136,7}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sample2.u, order4_Inputs_Outputs.v) annotation (Line(
          points={{-159.2,4},{-172,4},{-172,-24},{-54,-24},{-54,6.95636},{-60.7,6.95636}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(periodicClock1.y, sample2.clock)
        annotation (Line(
          points={{-161.4,-42},{-152,-42},{-152,-3.2}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(extent={{-180,-100},{160,100}}, preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-180,-100},{160,100}})),
        experiment(
          StopTime=20,
          Interval=0.01,
          __Dymola_fixedstepsize=0.01,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRII_Discretized_Continuous;

    model FourthOrder_AVRI_Continuous "4th-order machine with AVR Type I"

      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ1(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={93.147,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,-20.6714},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1,
        t1=22,
        t2=22.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,4.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={57.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine4(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,19.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ2(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={97.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      Electrical.Controls.PSAT.AVR.AVRTypeI AVRtypeIII1(
        Tr=0.05,
        vf0=1.0641,
        vref0=1.0641) annotation (Placement(visible=true, transformation(
            origin={-81.654,42.5917},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs annotation (Placement(transformation(extent={{-45,25},{-20,55}})));
      Modelica.Blocks.Sources.Constant vref(k=1.0641) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-142,53})));
    equation
      connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
          visible=true,
          origin={77.076,17.3286},
          points={{-15.2126,2},{3.0709,2},{3.0709,-2},{9.071,-2}}));
      connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
          visible=true,
          origin={47.8634,11.8286},
          points={{0.0,7.5},{0.0,-7.5}}));
      connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
          visible=true,
          origin={81,-19.5},
          points={{-16.5,-0.5},{3.5,-0.5},{3.5,0.5},{9.5,0.5}}));
      connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
          visible=true,
          origin={61.8634,11.8286},
          points={{0.0,-7.5},{0.0,7.5}}));
      connect(pwLine2.n, pwLine4.p) annotation (Line(
          visible=true,
          origin={37.1134,16.8286},
          points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
      connect(pwLine1.n, pwLine3.p) annotation (Line(
          visible=true,
          origin={39.0909,-12.8357},
          points={{-17.5608,-7.8357},{5.4091,-7.8357},{5.4091,-7.1643},{6.74243,-7.1643}}));
      connect(pwLine1.n, pwLine2.n) annotation (Line(
          visible=true,
          origin={16.8634,4.3286},
          points={{4.66667,-25},{4.66667,-20},{5,-20},{5,-10},{4.66667,-10},{4.66667,10}}));
      connect(pwLine2.p, pwLine1.p) annotation (Line(
          visible=true,
          origin={2.8634,4.3286},
          points={{-4.66667,10},{-4.66667,0},{-5,0},{-5,-10},{-4.66667,-10},{-4.66667,-25}}));
      connect(order4_Inputs_Outputs.v, AVRtypeIII1.v)
        annotation (Line(
          points={{-18.75,45.3104},{0,45.3104},{0,60},{-100,60},{-100,38.9917},{-94.054,38.9917}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm)
        annotation (Line(
          points={{-18.75,49.4258},{-5,49.4258},{-5,20},{-55,20},{-55,34},{-47.5,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
          points={{-18.75,39.7745},{-10,39.7745},{-10,14.3286},{2.8634,14.3286}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(AVRtypeIII1.vf, order4_Inputs_Outputs.vf)
        annotation (Line(
          points={{-70.654,42.7917},{-55.327,42.7917},{-55.327,48.5278},{-47.5,48.5278}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(vref.y, AVRtypeIII1.vref) annotation (Line(
          points={{-136.5,53},{-105.75,53},{-105.75,48.1917},{-93.854,48.1917}},
          color={0,0,127},
          smooth=Smooth.None));

      annotation (
        Diagram(coordinateSystem(
            extent={{-148.5,-105},{148.5,105}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={5,5}), graphics={Text(
              visible=true,
              origin={45,50},
              fillPattern=FillPattern.Solid,
              extent={{-35.0,-5.8583},{35.0,5.8583}},
              textString="SystemSbase=100 MVA",
              fontName="Arial")}),
        experiment(
          StopTime=20,
          Interval=0.01,
          __Dymola_fixedstepsize=0.01,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRI_Continuous;

    model FourthOrder_AVRI_Discretized_Continuous "4th-order machine with AVR Type I, discretized continuous controller"

      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ1(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={93.147,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,-20.6714},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1,
        t1=22,
        t2=22.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,4.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={9.8634,14.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine3(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={57.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Branches.PwLine pwLine4(
        B=0.001/2,
        G=0,
        R=0.01,
        X=0.1) annotation (Placement(visible=true, transformation(
            origin={54.8634,19.3286},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Loads.PwLoadPQ pwLoadPQ2(P=0.08, Q=0.06)
        annotation (Placement(visible=true, transformation(
            origin={97.5,-20},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      Electrical.Controls.PSAT.AVR.AVRTypeI AVRtypeIII1(
        Tr=0.05,
        vf0=1.0641,
        vref0=1.05) annotation (Placement(visible=true, transformation(
            origin={-81.654,42.5917},
            extent={{-10.0,-10.0},{10.0,10.0}},
            rotation=0)));
      OpenIPSL.Electrical.Machines.PSAT.FourthOrder.Order4_Inputs_Outputs order4_Inputs_Outputs annotation (Placement(transformation(extent={{-45,25},{-20,55}})));
      Modelica.Blocks.Sources.Constant vref(k=1.05) annotation (Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-142,53})));
      Modelica_Synchronous.RealSignals.Sampler.SampleClocked sample2 annotation (Placement(transformation(extent={{-115,30},{-105,45}})));
      Modelica_Synchronous.RealSignals.Sampler.Hold hold1(y_start=1.0641) annotation (Placement(transformation(extent={{-70,60},{-55,70}})));
      Modelica_Synchronous.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
        useSolver=true,
        solverMethod="ImplicitEuler",
        period=0.01) annotation (Placement(transformation(extent={{-140,-25},{-125,-10}})));
      Modelica_Synchronous.RealSignals.Sampler.Sample sample1 annotation (Placement(transformation(extent={{-120,45},{-110,55}})));
    equation
      connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
          visible=true,
          origin={77.076,17.3286},
          points={{-15.2126,2},{3.0709,2},{3.0709,-2},{9.071,-2}}));
      connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
          visible=true,
          origin={47.8634,11.8286},
          points={{0.0,7.5},{0.0,-7.5}}));
      connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
          visible=true,
          origin={81,-19.5},
          points={{-16.5,-0.5},{3.5,-0.5},{3.5,0.5},{9.5,0.5}}));
      connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
          visible=true,
          origin={61.8634,11.8286},
          points={{0.0,-7.5},{0.0,7.5}}));
      connect(pwLine2.n, pwLine4.p) annotation (Line(
          visible=true,
          origin={37.1134,16.8286},
          points={{-15.5833,-2.5},{4.75,-2.5},{4.75,2.5},{6.08333,2.5}}));
      connect(pwLine1.n, pwLine3.p) annotation (Line(
          visible=true,
          origin={39.0909,-12.8357},
          points={{-17.5608,-7.8357},{5.4091,-7.8357},{5.4091,-7.1643},{6.74243,-7.1643}}));
      connect(pwLine1.n, pwLine2.n) annotation (Line(
          visible=true,
          origin={16.8634,4.3286},
          points={{4.66667,-25},{4.66667,-20},{5,-20},{5,-10},{4.66667,-10},{4.66667,10}}));
      connect(pwLine2.p, pwLine1.p) annotation (Line(
          visible=true,
          origin={2.8634,4.3286},
          points={{-4.66667,10},{-4.66667,0},{-5,0},{-5,-10},{-4.66667,-10},{-4.66667,-25}}));
      connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm)
        annotation (Line(
          points={{-18.75,49.4258},{-5,49.4258},{-5,20},{-55,20},{-55,34},{-47.5,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
          points={{-18.75,39.7745},{-10,39.7745},{-10,14.3286},{2.8634,14.3286}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(sample1.y, AVRtypeIII1.vref) annotation (Line(
          points={{-109.5,50},{-100,50},{-100,48.1917},{-93.854,48.1917}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(vref.y, sample1.u) annotation (Line(
          points={{-136.5,53},{-128.25,53},{-128.25,50},{-121,50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(AVRtypeIII1.vf, hold1.u) annotation (Line(
          points={{-70.654,42.7917},{-70.654,53.8958},{-71.5,53.8958},{-71.5,65}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(hold1.y, order4_Inputs_Outputs.vf) annotation (Line(
          points={{-54.25,65},{-47.5,65},{-47.5,48.5278}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sample2.y, AVRtypeIII1.v) annotation (Line(
          points={{-104.5,37.5},{-99.75,37.5},{-99.75,38.9917},{-94.054,38.9917}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(order4_Inputs_Outputs.v, sample2.u)
        annotation (Line(
          points={{-18.75,45.3104},{-15,45.3104},{-15,10},{-130,10},{-130,37.5},{-116,37.5}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(periodicClock1.y, sample2.clock)
        annotation (Line(
          points={{-124.25,-17.5},{-110,-17.5},{-110,28.5}},
          color={175,175,175},
          pattern=LinePattern.Dot,
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(
            extent={{-148.5,-105},{148.5,105}},
            preserveAspectRatio=false,
            initialScale=0.1,
            grid={5,5}), graphics={Text(
              visible=true,
              origin={45,50},
              fillPattern=FillPattern.Solid,
              extent={{-35.0,-5.8583},{35.0,5.8583}},
              textString="SystemSbase=100 MVA",
              fontName="Arial")}),
        experiment(
          StopTime=20,
          Interval=0.01,
          __Dymola_fixedstepsize=0.01,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentSetupOutput);
    end FourthOrder_AVRI_Discretized_Continuous;
  end DiscreteAVR;

  model Order4_discrete1 "Try to implement a simple discrete controller"
    extends Examples.Order4test2;
    parameter Real K=1.2 "Gain";
    parameter Real vref=1.0 "Reference voltage";
    discrete Real vd;
    discrete Real u(start=Generator.v0);
    output Real y_control;

  equation
    vd = sample(Generator.v, Clock(0.01));
    u = K*(vref - vd);
    y_control = hold(u);
  end Order4_discrete1;
  annotation (uses(
      Modelica(version="3.2.1"),
      OpenIPSL(version="0.8.1"),
      Modelica_Synchronous(version="0.92"),
      PowerSystems(version="0.6")));
end PSAT_Systems;
