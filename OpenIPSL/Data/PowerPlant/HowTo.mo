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
as the <a href=\"modelica://OpenIPSL.Examples.IEEE14.Generation_Groups\"><code>IEEE14</code></a> and 
<a href=\"modelica://OpenIPSL.Examples.N44.Base_Case.Generators\"><code>N44</code></a> examples demonstrate.
For these last two cases, there is a generator group model for each generator connected to the network.
</p>
<p>
To be able to make use of the parameterized records containing the dynamic response related
parameters of machines and their controls from this package, you must:
</p>
<ul>
<li>Go to the <em>generation group model</em> where you intend to use the records.</li>
<li>Drag and drop an instance of the <code>OpenIPSL.Data.PowerPlant.GUDynamics</code> record
    on the diagram layer of the model.</li>
<li>Propagate the record to the upper-level model (i.e. to the <em>network model</em> where the
    <em>generation group model</em> is instantiated).</li>
<li>Go to the <em>network model</em> (i.e. the upper-level model) and double click on the
    generator component.</li>
<li>Expand the drop-down list of the propagated <code>GUnitDynamics</code> parameter and
    and <em>choose the set of parameters that best suits your needs</em>. Notice that the
    available parameters can be inspected later by first clicking on the button to the right
    of the drop-down list, and then on the button of the corresponding generator group
    component (e.g., machine, excitation system).</li>
<li>Go back to the <em>generation group model</em> and double-click each machine and machine
    control component, one at the time. Make sure you insert all required references to
    match the parameters with their corresponding values from the
    <code>GUDynamics</code> record. For example, after double-clicking on the machine
    component, its inertia parameter H can be assigned by reference using the expression
    <code>gUDynamics.guDynamics.machine.H</code>. The reference can be (a) typed,
    (b) copied and pasted or, (c) explored using the
    <em>Insert Component Reference</em> functionality.</li>
</ul>
<p>A couple of <strong>examples</strong> have been created to illustrate the entire procedure.</p>
</html>"));
end HowTo;
