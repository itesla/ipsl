within iPSL.Electrical.Solar.KTH;
function Inputselectorfunction
  input Real vd;
  input Real id;
  input Real dv;
  input Real di;
  output Real k;
  parameter Real Epsilon=0.01;
algorithm
  if dv == 0 then
    if di == 0 then
      k := 0;
    elseif di > 0 then
      k := 1;
    elseif di < 0 then
      k := -1;
    end if;
  else
    if abs(di/dv + id/vd) < Epsilon then
      k := 0;
    else
      if di/dv + id/vd > 0 then
        k := 1;
      else
        k := -1;
      end if;
    end if;
  end if;
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})), Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        initialScale=0.1,
        grid={5,5})));
end Inputselectorfunction;

