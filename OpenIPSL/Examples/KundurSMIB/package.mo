within OpenIPSL.Examples;
package KundurSMIB "Single-machine infinite bus model used in the Example 13.2 of the Kundur's book"
  extends Modelica.Icons.ExamplesPackage;

annotation (
  uses(OpenIPSL(version="1.5.0"), Modelica(version="3.2.2")),
  version="1",
  Documentation(info="<html>
<p>This example shows how a Single-Machine-Infinite-Bus (SMIB) system can be used to assess the impacts of an Automatic Voltage Regulator (AVR) and of a Power System Stabilizer (PSS) in transient stability studies.</p> 
<p>Three test systems are assembled to test three different configurations in generation units:</p>
<ul>
<li><strong>Configuration 1</strong>: only a machine composing a generation unit.</li>
<li><strong>Configuration 2</strong>: a machine and an AVR.</li>
<li><strong>Configuration 3</strong>: a machine, the AVR and the PSS.</li>
</ul>
<p>To test and compare the results, the same disturbance is applied to the three systems.</p>
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
<td><p><a href=\"mailto:luigi.vanfretti@gmail.com\">luigi.vanfretti@gmail.com</a></p></td>
</tr>
</table>
</html>"));
end KundurSMIB;
