within OpenIPSL;
package Functions

  function displayPower
    "A function to generate a dynamic select string of a power variable"
    extends Modelica.Icons.Function;

    input Real pwrVar "Variabe to be converted into a string";
    input String unitStr "Unit string to be appended";
    output String pwrDsp "Resultant display string";

  protected
  String dir = if pwrVar < 0 then "<<" else ">>" "Direction indicator string";
  algorithm

  pwrDsp := dir + String(abs(pwrVar), format=".1f") + unitStr + dir;

  end displayPower;
end Functions;
