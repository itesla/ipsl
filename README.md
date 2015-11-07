# **iPSL**: iTesla Power System Library:
The iTesla Power System Library is a [Modelica](https://www.modelica.org) library developed as part of the [iTesla project](http://www.itesla-project.eu/). The library contains a set of power system component models for phasor time domain simulations.

## Power Flow Solvers / Software:
There is no power flow solver associated to the library. When building a use case, initialization of all variables must be performed with a power flow software. The users are free to choose their power flow software of choice.

Please note that during the development of the library, the power flow software used corresponds to that of the reference model, for example, for models coming from [PSAT](http://faraday1.ucd.ie/psat.html), we created the same power system model in PSAT and in Modelica using our library. The power flow solution from PSAT then was introduced into the corresponding "power flow solution parameters" corresponding to each model.

Within the iTesla Toolbox (i.e. the whole platform), there are different power flow tools implemented and also an "Automatic Translator" that takes a file with the parameters of a model (as defined by a domain specific tool) and populates the power flow parameters of the models. Therefore, there was no need to develop a power flow solver.

## Running Time-Domain Simulations:
There is no Modelica-compliant tool provided to run the time domain simulations. Users of the iPSL are free to choose their tool of choice.

Please note that the development of iPSL has been carried out using [OpenModelica](https://www.openmodelica.org/) and [Dymola](http://www.3ds.com/products-services/catia/products/dymola), therefore, it might be possible to face issues when using other [Modelica tools](https://modelica.org/tools) that we have not fully tested.

## Documentation (Application Guide, Test Networks, etc.)
Currently, we are developing an 'application guide' with examples how to use the library and documentation on many of the test networks developed by different project partners, however, because the iTesla project is still on-going, we are not sure when this material will be ready.
You can follow the following issues to know about our progress: [Application Guide](https://github.com/itesla/ipsl/issues/3) and [Test Networks](https://github.com/itesla/ipsl/issues/4).

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

## Citing iPSL in Publications
If you use iPSL in your work or research, all we ask you in exchange is that you cite the following papers, according to your use. You are also welcome to submit your contributions as stated above.

- M. Zhang, M. Baudette, J. Lavenius, S. Løvlund, and L. Vanfretti, “Modelica Implementation and Software-to-Software Validation of Power System Component Models Commonly used by Nordic TSOs for Dynamic Simulations,” In Proceedings of the 56th Conference on Simulation and Modelling (SIMS 56), 7-9 October 2015, Linköking, Sweden. Paper available [here](https://www.openmodelica.org/events/sims-2015).
- M. Sabate, G. Leon, M. Halat, J.B. Heyberger, F.J. Gomez and L. Vanfretti, “Aspects of Power System Modeling, Initialization and Simulation using the Modelica Language,” IEEE PowerTech 2015. Download paper [here](http://www.itesla-project.eu/system/resources/BAhbBlsHOgZmSSJIMjAxNS8wNy8wOC8wOV81OV81Nl83N18wNGFfUGFwZXJfUG93ZXJfc3lzdGVtX21vZGVsaW5nX01vZGVsaWNhLnBkZgY6BkVU/04a_Paper_Power_system_modeling_Modelica.pdf)
- M.A. Adib Murad, F.J. Gomez, and L. Vanfretti, “Equation-Based Modeling of FACTS using Modelica,” IEEE PowerTech 2015. Access paper [here](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=7232500).
- M.A. Adib Murad, F.J. Gomez, and L. Vanfretti, “Equation-Based Modeling and Simulation of Three-Winding, and Regulating Transformers using Modelica,” IEEE PowerTech 2015. Access paper [here](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=7232503).
- L. Vanfretti, T. Bogodorova, and M. Baudette, “Power System Model Identification Exploiting the Modelica Language and FMI Technologies,” 2014 IEEE International Conference on Intelligent Energy and Power Systems, June 2-6, 2014, Kyiv, Ukraine. Download paper [here](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=6874164).
- L. Vanfretti, T. Bogodorova, and M. Baudette, “A Modelica Power System Component Library for Model Validation and Parameter Identification,” 10th International Modelica Conference 2014, Lund, Sweden, Mar. 10 – 12, 2014. Download paper [here](http://www.ep.liu.se/ecp_article/index.en.aspx?issue=96;article=126).
- T. Bogodorova, M. Sabate, G. León, L. Vanfretti, M. Halat, J.B. Heyberger, and P. Panciatici, “A Modelica Power System Library for Phasor Time-Domain Simulation,” IEEE ISGT Europe 2013, Oct. 6 – 9, 2013, Lyngby, Denmark. Download paper [here](http://kth.diva-portal.org/smash/record.jsf?pid=diva2%3A695594&dswid=-2413).
- L. Vanfretti, W. Li, T. Bogodorova, and P.Panciatici “Unambiguous Power System Modeling and Simulation using Modelica Tools”, IEEE PES General Meeting 2013. Download paper [here](http://kth.diva-portal.org/smash/record.jsf?pid=diva2%3A695601&dswid=4147).


## Copyright assignment:
Each contributor should send an email to info@itesla-ipsl.org with the following sentence: I hereby assign copyright of my contributions to the iPSL, to be licensed under the same terms as the rest of the iPSL. 

## License Information:
<The iPSL is a Modelica library for power system simulation using phasor time domain convention>

Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)
RTE: http://www.rte-france.com/ 
AIA: http://www.aia.es/en/energy/
KTH: https://www.kth.se/en
DTU: http://www.dtu.dk/english 

The authors can be contacted by email: info@itesla-ipsl.org

This package is part of the iTesla Power System Library ("iPSL").

The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or(at your option) any later version.

The iPSL is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with iPSL.  If not, see <http://www.gnu.org/licenses/>.
