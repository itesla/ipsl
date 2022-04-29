within OpenIPSL.Examples;
package IEEE9 "IEEE (WSCC) 9-bus 3-machine test system package"
 extends Modelica.Icons.ExamplesPackage;

annotation (Documentation(info="<html>
<p>This package contains a 9-bus 3-machine test system, representing a simple equivalent approximation for the Western System Coordinating Council (WSCC). </p>
<p>The system presented here is ideal to test how a STATic COMpensator (STATCOM) can improve the system's overall transient stability, by controlling voltage magnitude on particular buses. The package contains two test systems:</p> 
<ul>
<li><strong>IEEE_9_Buses</strong>: WSCC base test system, producing base results.</li>
<li><strong>IEEE_9_Buses_Statcom</strong>:WSCC test system with the addition of a STATCOM for improving transient stability.</li>
</ul>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigi.vanfretti@gmail.com\">luigi.vanfretti@gmail.com</a></p></td>
</tr>
</table>
</html>"));
end IEEE9;
