within iPSL.Electrical.Banks;
model PwCapacitorBankWithModification "Capacitor Bank with Bank modification at time t1.
              2014/03/10"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{0,60},{20,80}}), iconTransformation(extent={{0,60},{20,80}})));
  parameter Real nsteps "number of steps";
  parameter Real Go "active losses (pu) in each element";
  parameter Real Bo "reactive power (pu) in each element";
  parameter Real t1 "time for Bank Modification";
  parameter Real nmod "number of step to switch on/off (+/-)";
  Real G;
  Real B;
  Real nt;
equation
  if time > t1 then
    nt = nsteps + nmod;
  else
    nt = nsteps;
  end if;
  G = nt*Go;
  B = nt*Bo;
  p.vr = (p.ir*G + p.ii*B)/(G*G + B*B);
  p.vi = ((-p.ir*B) + p.ii*G)/(G*G + B*B);
  annotation (Icon(graphics={Rectangle(extent={{-40,60},{60,-40}}, lineColor={0,0,255}),Line(
          points={{10,50},{10,34}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,22},{36,22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,34},{36,34}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{10,22},{10,6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,-6},{36,-6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-14,6},{36,6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{10,-6},{10,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-16,-22},{40,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-18,-30},{-10,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,-30},{-2,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-2,-30},{6,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{6,-30},{14,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{14,-30},{22,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{22,-30},{30,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{30,-30},{38,-22}},
          color={0,0,255},
          smooth=Smooth.None)}), Documentation(revisions="<!--DISCLAIMER-->
<html>
<p>Copyright 2015 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<p>​- ​RTE: http://www.rte-france.com/</p>
<p>- SmarTS Lab, research group at KTH: https://www.kth.se/en</p>
<p>​- ​AIA: http://www.aia.es/en/energy/</p>
<p>​- ​DTU: http://www.dtu.dk/english</p>
<p>The authors can be contacted by email: info@itesla-ipsl.org </p>
<p>​</p>
<p>​​This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.</p>
</html>"));
end PwCapacitorBankWithModification;
