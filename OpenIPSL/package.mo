package OpenIPSL "Open-Instance Power System Library"
  import SI = Modelica.SIunits;
  import C = Modelica.Constants;

annotation (
  Protection(access = Access.packageDuplicate),
  uses(Complex(version="3.2.3"), Modelica(version="3.2.3")),
  version="2.0.0-dev",
  conversion(
     from(version={"0.8","0.8.1","1.0.0","1.5.0"}, script="modelica://OpenIPSL/Resources/Scripts/ConvertOpenIPSL_from_1.5.0_to_2.0.0.mos")),
  Icon(graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://OpenIPSL/Resources/Images/OpenIPSL_Logo.png")}),
  Documentation(info="<html>
<p>
The <b>OpenIPSL</b> or Open-Instance Power System Library is a <a href=\"https://www.Modelica.org\">Modelica</a> library, fork of of the  
<a https://github.com/itesla/ipsl\">iTesla Power System Library</a> developed and maintained by the <a https://alsetlab.github.io/\">AlsetLab</a> research group, 
collaborators and friends (contributions are welcome!).
The library contains a set of power system component models and test power system networks adopting the phasor modeling approach.
<a href=\"https://build.openmodelica.org/Documentation/OpenModelica.Scripting.simulate.html\">Time domain simulations</a> can be carried out using a Modelica-compliant tool, 
which may also allow to do other computations on the model, such as <a href=\"https://build.openmodelica.org/Documentation/OpenModelica.Scripting.linearize.html\">linearization</a> 
for eigen-analysis and other purposes.
<p>
If you are looking for an introduction to the library, have especially a look at:
</p>
<ul>
<li><a href=\"modelica://OpenIPSL.UsersGuide\">User's Guide</a>
  and all its dependencies for general information about the library.</li>
<li><a href=\"modelica://OpenIPSL.UsersGuide.ReleaseNotes\">Release Notes</a>
 for a summary of changes in new versions of the OpenIPSL.</li>
<li> <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">Contact</a>
  for a brief list of contributors and developers of the library.</li>
<li><b>Examples</b> package for demonstration on how certain components should be used.</li>
</ul>
</html>"));
end OpenIPSL;
