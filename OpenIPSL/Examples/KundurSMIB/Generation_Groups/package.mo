within OpenIPSL.Examples.KundurSMIB;
package Generation_Groups "Package with models for the different generation units tested in this example"
 extends Modelica.Icons.ExamplesPackage;

annotation (Documentation(info="<html>
<p>This package contains three genration units:</p> 
<ul>
<li><strong>Generator</strong>: generation unit connected to bus 1 composed only of a machine. Present in system SMIB.</li>
<li><strong>Generator_AVR</strong>: generation unit connected to bus 1 composed of a machine and an exciter. Present in system SMIB_AVR.</li>
<li><strong>Generator_AVR_PSS</strong>:  generation unit connected to bus 1 composed of a machine, an exciter and a stabilizer. Present in system SMIB_AVR_PSS.</li>
</ul>
<p> </p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>SMIB PSAT, d_kundur2.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Ahsan Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"https://github.com/ALSETLab\">ALSETLab</a></p></td>
</tr>
</table>
</html>"));
end Generation_Groups;
