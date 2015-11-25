within iPSL.NonElectrical;
model ImFunction "Piecewise function. It takes into account the case when the function
   is monotonally decreasing. Developed by AIA.
          2014/03/10"
  function findValue
    input Real v[:];
    input Real val;
    input Boolean inv;
    output Real y;
  protected
    Real w[size(v, 1)];
    Boolean found = false;
    Real aux;
    Integer index;
  algorithm
    index := size(v, 1);
    w := v;
    //    if inv then
    //      while (index >= 2) loop
    //                aux:=w[index];
    //        w[index]:=w[index - 1];
    //        w[index - 1]:=aux;
    //        index:=index - 2;
    //      end while;
    //    else
    //   end if;
    while index >= 2 loop
      if inv then
        w[index] := v[index - 1];
        w[index - 1] := v[index];
      else
        w[index] := v[index];
        w[index - 1] := v[index - 1];
      end if;
      index := index - 2;
    end while;
    index := size(w, 1) - 1;
    if w[size(w, 1) - 1] > w[1] then
      if val >= w[size(w, 1) - 1] then
        index := size(w, 1) - 1;
      elseif val < w[1] then
        index := 3;
      else
        while index >= 3 and found == false loop
          if val >= w[index - 2] and val < w[index] then
            found := true;
          else
            index := index - 2;
          end if;
        end while;
      end if;
    else
      if val >= w[3] then
        index := 3;
      elseif val < w[size(w, 1) - 1] then
        index := size(w, 1) - 1;
      else
        while index >= 3 and found == false loop
          if val >= w[index] and val < w[index - 2] then
            found := true;
          else
            index := index - 2;
          end if;
        end while;
      end if;
    end if;
    y := (val - w[index - 2]) * (w[index + 1] - w[index - 1]) / (w[index] - w[index - 2]) + w[index - 1];
  end findValue;

  Modelica.Blocks.Interfaces.RealInput  p1 annotation(Placement(transformation(extent = {{-61, -10}, {-41, 10}}), iconTransformation(extent = {{-61, -10}, {-41, 10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation(Placement(transformation(extent = {{39, -10}, {59, 10}}), iconTransformation(extent = {{39, -10}, {59, 10}})));
  parameter Real[:] v;
equation
  n1 = findValue(v, p1, false);
  annotation(Diagram(graphics), Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Text(extent = {{-16, 18}, {24, -14}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "y = f(x)")}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end ImFunction;
