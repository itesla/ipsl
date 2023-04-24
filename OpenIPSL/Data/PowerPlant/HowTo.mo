within OpenIPSL.Data.PowerPlant;
model HowTo "How-To"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Data Sets Usage Guide</h4>
<p>
The following short guide is intended to provide a brief description on the use
of the <strong>parameter data sets for generation units</strong> contained in this package.
</p>
<p>
The <a href=\"modelica://OpenIPSL.Examples.Tutorial.Example_1\"><code>Example 1</code></a>
of the <a href=\"modelica://OpenIPSL.Examples.Tutorial\">OpenIPSL Library Tutorial</a>
explains the process required to create a simple network model along with a
<strong>generation group</strong> sub-model.
Although it is not necessary to create a model only for the generation group,
it is highly recommended as it promotes modularity and flexibility.
It should be noted that the network model can grow in size and complexity,
as the <strong>IEEE14</strong> and <strong>N44</strong> examples demonstrate.
For these last two cases, there is a generator group model for each generator connected to the network.
</p>
<p>
To be able to make use of the parameterized records in this package,
simply <em>drag and drop</em> an instance of the <code>GUDynamics</code> record
onto the interest generation group model.
</p>
<p>
Then, propagate the record to the upper level and double click on the generator component.
Go to the dropdown list of the propagated <code>GUnitDynamics</code>
and <em>choose the set of parameters that best suits your needs</em>.
The available parameters can be inspected later by first clicking on the
button to the right of the drop-down list, and then on the button of the
corresponding generator set component (e.g., machine, excitation system).
</p>
<p>The last step is to double-click on each of the model components and
insert references to match the parameters with their corresponding values from the
<code>GUDynamics</code> record.
For example, after double-clicking on the machine component, its inertia parameter H
can be assigned by reference using the expression <code>gUDynamics.guDynamics.machine.H</code>.
The reference can be typed, copied and pasted or can be explored using the
<em>Insert Component Reference</em> functionality.
</p>
<p>A couple of <strong>examples</strong> have been created to illustrate the entire procedure.</p>
</html>"));
end HowTo;
