# **iPSL**: iTesla Power System Library:
The iTesla Power System Library is a [Modelica](https://www.modelica.org) library developed as part of the [iTesla project](http://www.itesla-project.eu/). The library contains a set of power system component models for phasor time domain simulations.

## Solvers:
There is no power flow solver associated to the library. When building a use case, initialization of all variables must be performed with a power flow solver. The users are free to choose their power flow solver.

There is no Modelica-based solver provided to run the time domain simulations. Users of the iPSL are free to choose their solver. 


## Contributing:
Contributions to the library are welcome and can be submitted in the form of pull requests to this repository. Contributions can be of different nature, such as addition of a new component model, re-organisation of the structure of the library, change in the development practices, etc.

As a general practice, any modification related to the structure of the library, the naming conventions, the 'NonElectrical' package should first be suggested in a new issue in the internal issue tracker of the repository. This will allow the team managing the repository to review the suggested changes, and discuss the motivation behind.

Addition of a new component model, can be made directly in the form of a pull request to the repository. To facilitate the integration of the model in the library, it is highly recommended to follow the development best practices [Link coming soon](). In order to show that the model has been validated against a reference, please use the following flag in your model:

```modelica
parameter isValidated = True annotation (Dialog(group="Validation"));
```
A validation report should also be submitted by email to info@itesla-ipsl.org. A template is available at [Link to Tin's package]. Is should contain:
- A short report describing your component model, as well as the validation test.
- The data files to plot the comparison figures and compute the MSE.

## Copyright assignment:
Each contributor should send an email to info@itesla-ipsl.org with the following sentence: I hereby assign copyright of my contributions to the iPSL, to be licensed under the same terms as the rest of the iPSL. 

## License Information:
<The iPSL is a Modelica library for power system simulation using phasor time domain convention>

Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)
RTE: http://www.rte-france.com/, 
AIA: http://www.aia.es/en/energy/, 
KTH: [SmarTS Lab research group](https://www.kth.se/en/ees/omskolan/organisation/avdelningar/eps/research/smarttslab/smarts-lab-1.369280),
DTU: http://www.dtu.dk/english 

The authors can be contacted by email: info@itesla-ipsl.org

This package is part of the iTesla Power System Library ("iPSL").

The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or(at your option) any later version.

The iPSL is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with iPSL.  If not, see <http://www.gnu.org/licenses/>.
