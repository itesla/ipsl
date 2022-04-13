within OpenIPSL.Examples.Tutorial.Example_1;
package Network "Set of steps illustrating how to assemble a network model using the OpenIPSL."
 extends Modelica.Icons.Package;

annotation (Documentation(info="<html>
<p>The task of modeling the network should be done after the modeling of the generation units. If you have not done it yet, follow the instructions on package Generator.</p> 
<p>The modeling procedure of the three-bus system is divided into five steps:</p>
<ul>
<li><strong>Step 1</strong>: bus models are dragged into the diagram, together with the generation unit model and the system data in <code>SysData</code>.</li>
<li><strong>Step 2</strong>: branch models, such as power lines and transformers, are placed in the diagram.</li>
<li><strong>Step 3</strong>: infinite bus model is instantiated in the network model.</li>
<li><strong>Step 4</strong>: fault model is placed in the diagram.</li>
<li><strong>Step 5</strong>: connections between models are performed.</li>
</ul>
<p> More information about each step is displayed in the graphics/diagram layer of the model. Note that you also need to input the parameter values.</p>
</html>"));
end Network;
