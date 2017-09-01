within ThreePhase.Branches.Lines;
model Line_3Ph "Modeled as a PI element"

  outer OpenIPSL.Electrical.SystemBase SysData;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));
  OpenIPSL.Interfaces.PwPin Bin
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  OpenIPSL.Interfaces.PwPin Cin
    annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{120,80},{140,100}})));
  OpenIPSL.Interfaces.PwPin Bout
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  OpenIPSL.Interfaces.PwPin Cout
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));

  parameter Real S = SysData.S_b "Nominal Power (MVA)" annotation (Dialog(group="Power flow data"));
  parameter Real f = SysData.fn "System Frequency" annotation (Dialog(group="Power flow data"));
  parameter Real Gseraa = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bseraa = -10 "in p.u."
                                       annotation (Dialog(group="Power flow data"));
  parameter Real Gserab = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bserab = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Gserac = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bserac = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Gserbb = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bserbb = -10 "in p.u."
                                       annotation (Dialog(group="Power flow data"));
  parameter Real Gserbc = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bserbc = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Gsercc = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bsercc = -10 "in p.u."
                                       annotation (Dialog(group="Power flow data"));
  parameter Real Bshtaa = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bshtab = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bshtac = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bshtbb = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bshtbc = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bshtcc = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));

  //Writing the Y_ser matrix for the pi model
protected
  parameter Real Gaaser = Gseraa;
  parameter Real Baaser = Bseraa;
  parameter Real Gabser = Gserab;
  parameter Real Babser = Bserab;
  parameter Real Gacser = Gserac;
  parameter Real Bacser = Bserac;
  parameter Real Gbaser = Gserab;
  parameter Real Bbaser = Bserab;
  parameter Real Gbbser = Gserbb;
  parameter Real Bbbser = Bserbb;
  parameter Real Gbcser = Gserbc;
  parameter Real Bbcser = Bserbc;
  parameter Real Gcaser = Gserac;
  parameter Real Bcaser = Bserac;
  parameter Real Gcbser = Gserbc;
  parameter Real Bcbser = Bserbc;
  parameter Real Gccser = Gsercc;
  parameter Real Bccser = Bsercc;

  //Writing the Y_sht matrix for the pi model
  parameter Real Gaasht = 0;
  parameter Real Baasht = Bshtaa;
  parameter Real Gabsht = 0;
  parameter Real Babsht = Bshtab;
  parameter Real Gacsht = 0;
  parameter Real Bacsht = Bshtac;
  parameter Real Gbasht = 0;
  parameter Real Bbasht = Bshtab;
  parameter Real Gbbsht = 0;
  parameter Real Bbbsht = Bshtbb;
  parameter Real Gbcsht = 0;
  parameter Real Bbcsht = Bshtbc;
  parameter Real Gcasht = 0;
  parameter Real Bcasht = Bshtac;
  parameter Real Gcbsht = 0;
  parameter Real Bcbsht = Bshtbc;
  parameter Real Gccsht = 0;
  parameter Real Bccsht = Bshtcc;

  //Writing a matrix to simplify calculations
  parameter Real Gaa = Gaasht+Gaaser;
  parameter Real Baa = Baasht+Baaser;
  parameter Real Gab = Gabsht+Gabser;
  parameter Real Bab = Babsht+Babser;
  parameter Real Gac = Gacsht+Gacser;
  parameter Real Bac = Bacsht+Bacser;
  parameter Real Gba = Gbasht+Gbaser;
  parameter Real Bba = Bbasht+Bbaser;
  parameter Real Gbb = Gbbsht+Gbbser;
  parameter Real Bbb = Bbbsht+Bbbser;
  parameter Real Gbc = Gbcsht+Gbcser;
  parameter Real Bbc = Bbcsht+Bbcser;
  parameter Real Gca = Gcasht+Gcaser;
  parameter Real Bca = Bcasht+Bcaser;
  parameter Real Gcb = Gcbsht+Gcbser;
  parameter Real Bcb = Bcbsht+Bcbser;
  parameter Real Gcc = Gccsht+Gccser;
  parameter Real Bcc = Bccsht+Bccser;

equation
  // Equations according to pi model
  Ain.ir = Gaa*Ain.vr-Baa*Ain.vi + Gab*Bin.vr-Bab*Bin.vi + Gac*Cin.vr-Bac*Cin.vi - Gaaser*Aout.vr+Baaser*Aout.vi - Gabser*Bout.vr+Babser*Bout.vi - Gacser*Cout.vr+Bacser*Cout.vi;
  Ain.ii = Gaa*Ain.vi+Baa*Ain.vr + Gab*Bin.vi+Bab*Bin.vr + Gac*Cin.vi+Bac*Cin.vr - Gaaser*Aout.vi-Baaser*Aout.vr - Gabser*Bout.vi-Babser*Bout.vr - Gacser*Cout.vi-Bacser*Cout.vr;
  Bin.ir = Gba*Ain.vr-Bba*Ain.vi + Gbb*Bin.vr-Bbb*Bin.vi + Gbc*Cin.vr-Bbc*Cin.vi - Gbaser*Aout.vr+Bbaser*Aout.vi - Gbbser*Bout.vr+Bbbser*Bout.vi - Gbcser*Cout.vr+Bbcser*Cout.vi;
  Bin.ii = Gba*Ain.vi+Bba*Ain.vr + Gbb*Bin.vi+Bbb*Bin.vr + Gbc*Cin.vi+Bbc*Cin.vr - Gbaser*Aout.vi-Bbaser*Aout.vr - Gbbser*Bout.vi-Bbbser*Bout.vr - Gbcser*Cout.vi-Bbcser*Cout.vr;
  Cin.ir = Gca*Ain.vr-Bca*Ain.vi + Gcb*Bin.vr-Bcb*Bin.vi + Gcc*Cin.vr-Bcc*Cin.vi - Gcaser*Aout.vr+Bcaser*Aout.vi - Gcbser*Bout.vr+Bcbser*Bout.vi - Gccser*Cout.vr+Bccser*Cout.vi;
  Cin.ii = Gca*Ain.vi+Bca*Ain.vr + Gcb*Bin.vi+Bcb*Bin.vr + Gcc*Cin.vi+Bcc*Cin.vr - Gcaser*Aout.vi-Bcaser*Aout.vr - Gcbser*Bout.vi-Bcbser*Bout.vr - Gccser*Cout.vi-Bccser*Cout.vr;
  Aout.ir = Gaa*Aout.vr-Baa*Aout.vi + Gab*Bout.vr-Bab*Bout.vi + Gac*Cout.vr-Bac*Cout.vi - Gaaser*Ain.vr+Baaser*Ain.vi - Gabser*Bin.vr+Babser*Bin.vi - Gacser*Cin.vr+Bacser*Cin.vi;
  Aout.ii = Gaa*Aout.vi+Baa*Aout.vr + Gab*Bout.vi+Bab*Bout.vr + Gac*Cout.vi+Bac*Cout.vr - Gaaser*Ain.vi-Baaser*Ain.vr - Gabser*Bin.vi-Babser*Bin.vr - Gacser*Cin.vi-Bacser*Cin.vr;
  Bout.ir = Gba*Aout.vr-Bba*Aout.vi + Gbb*Bout.vr-Bbb*Bout.vi + Gbc*Cout.vr-Bbc*Cout.vi - Gbaser*Ain.vr+Bbaser*Ain.vi - Gbbser*Bin.vr+Bbbser*Bin.vi - Gbcser*Cin.vr+Bbcser*Cin.vi;
  Bout.ii = Gba*Aout.vi+Bba*Aout.vr + Gbb*Bout.vi+Bbb*Bout.vr + Gbc*Cout.vi+Bbc*Cout.vr - Gbaser*Ain.vi-Bbaser*Ain.vr - Gbbser*Bin.vi-Bbbser*Bin.vr - Gbcser*Cin.vi-Bbcser*Cin.vr;
  Cout.ir = Gca*Aout.vr-Bca*Aout.vi + Gcb*Bout.vr-Bcb*Bout.vi + Gcc*Cout.vr-Bcc*Cout.vi - Gcaser*Ain.vr+Bcaser*Ain.vi - Gcbser*Bin.vr+Bcbser*Bin.vi - Gccser*Cin.vr+Bccser*Cin.vi;
  Cout.ii = Gca*Aout.vi+Bca*Aout.vr + Gcb*Bout.vi+Bcb*Bout.vr + Gcc*Cout.vi+Bcc*Cout.vr - Gcaser*Ain.vi-Bcaser*Ain.vr - Gcbser*Bin.vi-Bcbser*Bin.vr - Gccser*Cin.vi-Bccser*Cin.vr;
  
  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Rectangle(
          extent={{-140,-100},{140,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Line(points = {{-90,0}, {-30, 0}}, color = {0, 0, 255}),
          Line(points = {{-30,0}, {-30, 20}, {30, 20}, {30, -20}, {-30, -20}, {-30, 0}}, color = {0, 0, 255}),
          Line(points = {{90,0}, {30, 0}}, color = {0, 0, 255}),
          Line(points = {{-60,0}, {-60, -20}}, color = {0, 0, 255}),
          Line(points = {{-80,-20},{-40,-20},{-40,-55},{-80,-55},{-80,-20}}, color = {0, 0, 255}),
          Line(points = {{60,0}, {60, -20}}, color = {0, 0, 255}), 
          Line(points = {{80,-20},{40,-20},{40,-55},{80,-55},{80,-20}}, color = {0, 0, 255}),
          Line(points = {{-60,-55}, {-60, -70}}, color = {0, 0, 255}), 
          Line(points = {{-45,-70}, {-75, -70}}, color = {0, 0, 255}),
          Line(points = {{-50,-72.5}, {-70, -72.5}}, color = {0, 0, 255}),
          Line(points = {{-55,-75}, {-65, -75}}, color = {0, 0, 255}),                     
          Line(points = {{60,-55}, {60, -70}}, color = {0, 0, 255}),
          Line(points = {{45,-70}, {75, -70}}, color = {0, 0, 255}),
          Line(points = {{50,-72.5}, {70, -72.5}}, color = {0, 0, 255}),
          Line(points = {{55,-75}, {65, -75}}, color = {0, 0, 255}),          
          Line(points = {{-90,0}, {-130, 0}}, color = {0, 0, 255}),
          Line(points = {{-90,0}, {-110, 90},{-130,90}}, color = {0, 0, 255}),
          Line(points = {{-90,0}, {-110, -90},{-130,-90}}, color = {0, 0, 255}),         
          Line(points = {{90,0}, {130, 0}}, color = {0, 0, 255}),
          Line(points = {{90,0}, {110, 90},{130,90}}, color = {0, 0, 255}),
          Line(points = {{90,0}, {110, -90},{130,-90}}, color = {0, 0, 255}),
          Text(lineColor = {28, 108, 200}, extent = {{-29, -18}, {20,18}}, textString = "G +jB  "), 
          Text(lineColor = {28, 108, 200}, extent = {{-15, 5}, {-5,13}}, textString = "ser"),
          Text(lineColor = {28, 108, 200}, extent = {{19, 5}, {29,13}}, textString = "ser"),
          Text(lineColor = {28, 108, 200}, extent = {{-75, -28}, {-55,-47}}, textString = "jB"), 
          Text(lineColor = {28, 108, 200}, extent = {{-56, -25}, {-46,-33}}, textString = "sht"),
          Text(lineColor = {28, 108, 200}, extent = {{65, -28}, {45, -47}}, textString = "jB"), 
          Text(lineColor = {28, 108, 200}, extent = {{64, -25}, {74, -33}}, textString = "sht"), 
          Text(lineColor = {28, 108, 200}, extent = {{-65, 55}, {65, 85}}, textString = "PI MODEL")                  
          }),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1)),
    uses(Modelica(version="3.2.1")),
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
end Line_3Ph;