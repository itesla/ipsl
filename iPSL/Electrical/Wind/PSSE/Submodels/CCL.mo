within iPSL.Electrical.Wind.PSSE.Submodels;


model CCL
  parameter Real Qmax;
  parameter Boolean pqflag;
  parameter Real ImaxTD "Converter current limit";
  parameter Real Iphl "Hard active current limit";
  parameter Real Iqhl "Hard reactive current limit";
  Modelica.Blocks.Interfaces.RealOutput IQmin annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,96}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,110})));
  Modelica.Blocks.Interfaces.RealInput IpCMD annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=180,
        origin={134,-20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-100})));
  Modelica.Blocks.Interfaces.RealInput IqCMD
    annotation (Placement(transformation(extent={{-146,-30},{-120,-4}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,100})));
  Modelica.Blocks.Interfaces.RealOutput IQmax annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,96}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));
  Modelica.Blocks.Interfaces.RealOutput IPmax annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,-84}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-110})));
  Modelica.Blocks.Math.Min min1 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-52,-38})));
  Modelica.Blocks.Sources.Constant const1(k=Iphl) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={-9,-19})));
  Modelica.Blocks.Sources.Constant const2(k=Iqhl) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-19,23})));
  Modelica.Blocks.Math.Min min2 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-54,8})));
  Modelica.Blocks.Math.Min min3 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={44,-38})));
  Modelica.Blocks.Math.Min min4 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={44,6})));
  Modelica.Blocks.Math.Min min5 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-4,8})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-83,51})));
  Modelica.Blocks.Math.Gain gain1(k=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={75,47})));
  Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,78}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,0})));
protected
  Modelica.Blocks.Interfaces.RealInput Iqmax annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,40}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-101,5})));
protected
  Modelica.Blocks.Interfaces.RealOutput IQmin1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={44,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,42})));
  Modelica.Blocks.Interfaces.RealOutput IQmax1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={74,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,42})));
  Modelica.Blocks.Interfaces.RealOutput IQmin2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-82,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,42})));
  Modelica.Blocks.Interfaces.RealOutput IQmax2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,42})));
  Modelica.Blocks.Interfaces.RealOutput IPmax1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={44,-68}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Blocks.Interfaces.RealOutput IPmax2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-52,-68}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Blocks.Interfaces.RealInput Available_remain1 "sqrt(ImaxTD^2 - IpCMD^2)" annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=180,
        origin={76,-18}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={55,-35})));
  Modelica.Blocks.Interfaces.RealInput Available_remain2 "sqrt(ImaxTD^2 - IqCMD^2)" annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-90,-20}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={55,-35})));
equation
  Available_remain1 = sqrt(ImaxTD^2 - IpCMD^2);
  Available_remain2 = sqrt(ImaxTD^2 - IqCMD^2);
  Iqmax = (Qmax - 1.6)*(Vt - 1) + Qmax;
  if pqflag then
    IQmin = IQmin1;
    IQmax = IQmax1;
    IPmax = IPmax1;
  else
    IQmin = IQmin2;
    IQmax = IQmax2;
    IPmax = IPmax2;
  end if;
  connect(const1.y, min1.u2) annotation (Line(
      points={{-9,-26.7},{-9,-30},{-48.4,-30},{-48.4,-30.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, min3.u1) annotation (Line(
      points={{-9,-26.7},{-9,-30},{40.4,-30},{40.4,-30.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, min5.u1) annotation (Line(
      points={{-11.3,23},{-7.6,23},{-7.6,15.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min5.y, min4.u2) annotation (Line(
      points={{-4,1.4},{-4,-4},{40.4,-4},{40.4,-1.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min2.u1, min5.y) annotation (Line(
      points={{-50.4,0.8},{-50.4,-4},{-4,-4},{-4,1.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min2.y, IQmax2) annotation (Line(
      points={{-54,14.6},{-52,14.6},{-52,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min1.y, IPmax2) annotation (Line(
      points={{-52,-44.6},{-52,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min3.y, IPmax1) annotation (Line(
      points={{44,-44.6},{44,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min4.y, IQmin1) annotation (Line(
      points={{44,12.6},{44,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, min2.y) annotation (Line(
      points={{-83,45},{-83,14.6},{-54,14.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, IQmin2) annotation (Line(
      points={{-83,56.5},{-83,65.25},{-82,65.25},{-82,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.y, IQmax1) annotation (Line(
      points={{75,52.5},{75,61.25},{74,61.25},{74,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.u, min4.y) annotation (Line(
      points={{75,41},{75,12.6},{44,12.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Iqmax, min5.u2) annotation (Line(
      points={{0,40},{0,15.2},{-0.4,15.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min4.u1, Available_remain1) annotation (Line(
      points={{47.6,-1.2},{47.6,-18},{76,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min3.u2, Available_remain1) annotation (Line(
      points={{47.6,-30.8},{47.6,-18},{76,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Available_remain2, min2.u2) annotation (Line(
      points={{-90,-20},{-57.6,-20},{-57.6,0.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min1.u1, Available_remain2) annotation (Line(
      points={{-55.6,-30.8},{-55.6,-20},{-90,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-76,58},{82,18}},
          lineColor={244,125,35},
          textString="Converter Current Limit
"),Text(  extent={{-86,6},{-46,-6}},
          lineColor={28,108,200},
          textString="VTERM"),Text(
          extent={{-70,96},{-30,84}},
          lineColor={28,108,200},
          textString="I_Qmin"),Text(
          extent={{-18,96},{22,84}},
          lineColor={28,108,200},
          textString="I_Qmax"),Text(
          extent={{32,88},{72,76}},
          lineColor={28,108,200},
          textString="I_Qcmd"),Text(
          extent={{26,-76},{66,-88}},
          lineColor={28,108,200},
          textString="I_Pcmd"),Text(
          extent={{-72,-76},{-32,-88}},
          lineColor={28,108,200},
          textString="I_Pmax")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-112,96},{-34,-86}},
          lineColor={255,0,0},
          pattern=LinePattern.Dot,
          lineThickness=0.5),Text(
          extent={{-52,90},{-40,80}},
          lineColor={255,0,0},
          pattern=LinePattern.Dot,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),Text(
          extent={{64,-38},{120,-62}},
          lineColor={0,0,255},
          textString="sqrt(ImaxTD^2 - IpCMD^2)"),Text(
          extent={{-112,-42},{-58,-58}},
          lineColor={0,0,255},
          textString="sqrt(ImaxTD^2 - IqCMD^2)")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end CCL;
