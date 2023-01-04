within OpenIPSL.PowerPlantDataSets;
package Anderson "Typical System Data taken from Appendix D of the book \"Power System Control and Stability\" by Paul M. Anderson and A. Fouad."
  extends Modelica.Icons.VariantsPackage;

  annotation (Documentation(info="<html>
<p>Records with typical data for different types of generation plants. The data covers most parameters for generating group components, including the synchronous generator, exciter, turbine-governor system, and power system stabilizer.</p>
<p>Listed below is a cross reference between trademarks/manufacturers and IEEE excitation system model types:</p>
<ul>
<li>General Electric Amplidyne (NA101, NA108, NA143, NA143A) : <strong>DC1A</strong></li>
<li>Allis Chalmers Corp. Regulex (REGULUX) : <strong>DC1A</strong></li>
<li>Westinghouse-Magastat (WMA): <strong>DC1A</strong> or <strong>DC3A</strong></li>
<li>ASEA and Brown Boveri &amp; Cie (BBC) : <strong>DC1A</strong></li>
<li>General Electric GFA 4 : <strong>DC3A</strong></li>
<li>Westinghouse BJ30 : <strong>DC3A</strong></li>
<li>Westinghouse High Initial Response Brushless excitation system (BRLS) : <strong>AC2A</strong></li>
<li>Westinghouse Type WTA Brushless excitation system : <strong>AC2A</strong></li>
<li>General Electric SCR : <strong>ST1A</strong></li>
<li>General Electric SCT-PPT (SCPT) : <strong>ST2A</strong></li>
</ul>
<p>Sources:</p>
<ul>
<li>Anderson, P. M., &amp; Fouad, A. A. (2008).&nbsp;<em>Power system control and stability</em>. John Wiley &amp; Sons. Pages: 566-580.</li>
<li>IEEE (2005), <em>IEEE Recommended Practice for Excitation System Models for Power System Stability Studies</em>. New York, NY 10016-5997, USA.</li>
</ul>
</html>"));
end Anderson;
