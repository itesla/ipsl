within OpenIPSL.UsersGuide.ReleaseNotes;
class v150 "Version 1.5.0 (2017-11-22)"
  extends Modelica.Icons.ReleaseNotes;
  annotation (Documentation(info="<html>
<h4>What&apos;s Changed</h4>
<ul>
<li>Update tutorial package by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/86\">#86</a></li>
<li>Fix Bus Display variables by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/87\">#87</a></li>
<li>Adds the units MW and Mvar to the dynamic bus display. by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/90\">#90</a></li>
<li>Implement the new power flow display and lots of other clean ups by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/91\">#91</a></li>
<li>Fixes <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/96\">#96</a> Move displayFunction into existing Function package. by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/98\">#98</a></li>
<li>Fix Bus that contained double parameters by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/99\">#99</a></li>
<li>Fixing the spelling of the standard &quot;checkbox&quot; annotation by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/100\">#100</a></li>
<li>Reverting the fix of the checkbox by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/101\">#101</a></li>
<li>Adding resynchronisation models by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/103\">#103</a></li>
<li>Updates of PwPin references by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/106\">#106</a></li>
<li>Clean up of base load icon by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/108\">#108</a></li>
<li>Add default prefixes definition for SystemBase by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/109\">#109</a></li>
<li>Fixing the PSAT machine connector annotations by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/110\">#110</a></li>
<li>Mods to Documentation Info by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/113\">#113</a></li>
<li>Improve the PSSE loads by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/115\">#115</a></li>
<li>Changes applied to the IEEET1 model to fix the translation error by <a href=\"https://github.com/maguilerac\">@maguilerac</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/117\">#117</a></li>
<li>Updated tutorial documentation. I have divided the slide set in two, &hellip; by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/120\">#120</a></li>
<li>OMNotebook and Dymola Functions for Analysis by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/121\">#121</a></li>
<li>Adding Martin&apos;s fix to tutorial by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/122\">#122</a></li>
<li>Fix typos by <a href=\"https://github.com/tbeu\">@tbeu</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/123\">#123</a></li>
<li>Adding the Mostar model to Application Examples by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/124\">#124</a></li>
<li>Small fixes to Examples and to the PwVoltage sensor. by <a href=\"https://github.com/janlav\">@janlav</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/126\">#126</a></li>
<li>Cleaning Library of old Copyright Statements by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/128\">#128</a></li>
<li><a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/127\">#127</a> Changes to pull request by <a href=\"https://github.com/tbeu\">@tbeu</a> and the commit <span style=\"font-family: monospace;\"><a href=\"https://github.com/OpenIPSL/OpenIPSL/commit/179ea4d83f20fead767ab7d5b576d805a26b71b0\">179ea4d</a></span>&hellip; by <a href=\"https://github.com/janlav\">@janlav</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/129\">#129</a></li>
<li>Fix to issue <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/114\">#114</a> by <a href=\"https://github.com/janlav\">@janlav</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/130\">#130</a></li>
<li>Modifying Copyright for Luigi by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/131\">#131</a></li>
<li>Update README.md by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/132\">#132</a></li>
<li>Update for release related to tutorial of NA-MUG in Stanford. by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/135\">#135</a></li>
<li><a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/118\">#118</a> revision to the PSAT OEL by <a href=\"https://github.com/janlav\">@janlav</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/133\">#133</a></li>
<li>WT4G1 Initial Condition breaks Simulation by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/134\">#134</a></li>
<li>Fixing formatting of Readme file by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/137\">#137</a></li>
<li>First PR for Monotri by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/139\">#139</a></li>
<li>Adding examples from OpenIPSL used by RaPID by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/125\">#125</a></li>
<li>Moving the experiment information for PSSE tests by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/140\">#140</a></li>
<li>Adding load variation with noise injection by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/141\">#141</a></li>
<li>Add Soft PMU model by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/142\">#142</a></li>
<li>Fixing PSAT Machines, AVR I &amp; II, and making everything compile. by <a href=\"https://github.com/janlav\">@janlav</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/143\">#143</a></li>
<li>Fixes PSAT machines handling of bases and PSAT OEL by <a href=\"https://github.com/janlav\">@janlav</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/149\">#149</a></li>
<li>Remove duplicate files by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/151\">#151</a></li>
<li>Fixes to PSAT AVR, Generators, Loads and OELs. by <a href=\"https://github.com/janlav\">@janlav</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/152\">#152</a></li>
<li>Add docker file by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/154\">#154</a></li>
<li>Add MonoTri Library by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/146\">#146</a></li>
</ul>

<h5>New Contributors</h5>
<ul>
<li><a href=\"https://github.com/maguilerac\">@maguilerac</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/117\">#117</a></li>
<li><a href=\"https://github.com/janlav\">@janlav</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/126\">#126</a></li>
</ul>
<h4>Full Changelog</h4>
<p><a href=\"https://github.com/OpenIPSL/OpenIPSL/compare/v1.0.0...v1.5.0\"><code>v1.0.0...v1.5.0</code></a></p>
</html>"));
end v150;
