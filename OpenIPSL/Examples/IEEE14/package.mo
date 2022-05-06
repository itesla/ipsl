within OpenIPSL.Examples;
package IEEE14 "IEEE 14-bus 5-machine test system package"
  extends Modelica.Icons.ExamplesPackage;

annotation (
  Documentation(info="<html>
<p>This package contains a 14-bus 5-machine test system, representing a simple equivalent approximation for the American Electric Power System as of February of 1962. </p>
<p>In general, this system has low base voltages and an overabundance of voltage control capabilities, being ideal for testing such features. </p>
<p>The user might find a single test system in this package, but they are encouraged to duplicate the model and test fault events in different buses, together with different possible clearing times.</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigi.vanfretti@gmail.com\">luigi.vanfretti@gmail.com</a></p></td>
</tr>
</table>
</html>"));
end IEEE14;
