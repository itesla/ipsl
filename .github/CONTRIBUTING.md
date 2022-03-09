# Contributing to OpenIPSL

Thank you for considering investing your time to contribute to OpenIPSL! :tada::+1:

Here, you will find a set of guidelines for contributing to the OpenIPSL, which is hosted in the [OpenIPSL page](https://github.com/OpenIPSL) on GitHub. Many of the instructions in this document are considered to be suggestions rather than strict rules, so please use your best judgement when reading this document and when contributing to OpenIPSL. In addition, you can find some tips and good practices in [GitHub's Contribution Guideline](https://github.com/github/docs/blob/3c5055fc4eecf3f83560419d94be54458c2f56a1/CONTRIBUTING.md) and in [Atom's Contribution Guideline](https://github.com/atom/atom/blob/master/CONTRIBUTING.md).

Please, use the Table of Contents to find a specific section of this guide quickly.

#### Table of Contents

[Code of Conduct](#code-of-conduct)

[I Just Have a Question](#i-just-have-a-question)

[Getting Started](#getting-started)
  * [Join GitHub](#join-github)
  * [Getting Used to Git](#getting-used-to-git)
  * [Common Workflow for Contributing to OpenIPSL](#common-workflow-for-contributing-to-openipsl)

[How Can I Contribute?](#how-can-i-contribute-?)
  * [Getting Started](#getting-started-by-interacting-begginer)
  * [Reporting New Bugs](#reporting-new-bugs-bug)
  * [Improving Documentation ](#improving-documentation-memo)
  * [Improving Models in the Library](#improving-models-in-the-library-rocket)

[The Contributor License Agreement](#the-contributor-license-agreement)


## Code of conduct

OpenIPSL and all of its contributors are governed by the [OpenIPSL Code of Conduct](CODE_OF_CONDUCT.md). By participating in this community you are expected to read this code and to abide by it. We expect you to keep our community approachable and respectable.

## I Just Have a Question!!!

If you just have a question, there is no need for you to read this entire document. Use our [Discussions Page](https://github.com/OpenIPSL/OpenIPSL/discussions) to start a question. It is better (and faster) to reach out to the developers by asking a question. In addition, discussions can further be filed as an issue, so you can easily start your contribution by starting a discussion.

> **Note:** PLEASE DON'T FILE AN ISSUE TO ASK A QUESTION.

## Getting Started

There are many different resources that can be used for getting started with the different subjects that involve a contribution to OpenIPSL. There are a few things that you, as user, might want to check beforehand. 

### Join GitHub

However you decide to contribute to OpenIPSL you should fist create your GitHub account, if you do not have one already. To create your account, just go to this [website](https://github.com/join), fill out the form, complete the captcha and click on Create Account. After that, you will need some material to get started with your git skills. 

### Getting Used to Git

Git is a version control solution that is used to manage the library and its model packages. The following is a list of things that can help you with getting started with Git.


* Since you already have a GitHub account at this point, you can start by setting up Git. Useful information about that is found [here](https://docs.github.com/en/get-started/quickstart/set-up-git), but you can also use your web search tool to look for other sources of information.

* [Basic information](https://www.freecodecamp.org/news/what-is-git-and-how-to-use-it-c341b049ae61/) and [courses](https://www.coursera.org/learn/introduction-git-github?specialization=google-it-automation&utm_source=gg&utm_medium=sem&utm_campaign=11-GoogleITwithPython-US&utm_content=B2C&campaignid=8986236679&adgroupid=119480419197&device=c&keyword=&matchtype=&network=g&devicemodel=&adpostion=&creativeid=506915205324&hide_mobile_promo&gclid=Cj0KCQiAmpyRBhC-ARIsABs2EArPYPiHJtm3mb-36DSvRCt1Wpfflnigi5fhsoJiwSZnLkKULI0dwVUaArxtEALw_wcB) about Git are available in the internet and we strongly encourage you to look for those materials if you are not used to version control and Git.


The links used in this section are just suggestions and we encourage you to look for more materials related to Git and GitHub.

### Common Workflow for Contributing to OpenIPSL

Once you have created your GitHub account and you familiarized yourself with Git and GitHub, it is time for you to get to know the typical preferred workflow for contributing to the OpenIPSL. This will allow your contribution to be reviewed by the OpenIPSL developers before it is integrated into the library. The following is a list showing the steps that should be taken in order for a contribution workflow to be established.


* **Fork the OpenIPSL.** A fork is a copy of a repository that will be hosted, in this case, in your GitHub account. More information about forks is found [here](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
* **Create a Branch.** The branch will allow you to work with a version of your fork. It also allows for other people to contribute with your work without compromising the main branch of the fork and, especially, the main branch of the OpenIPSL. A branch name usually describes the main purpose of that branch. More information about branches is found [here](https://docs.github.com/en/get-started/quickstart/github-flow).
* **Make Changes to the Branch.** You can work on your branch by creating, deleting and modifying branches. To your changes to take effect, you will need to stage the altered files and to commit them. Please use meaningful messages when commiting your changes. The modifications you perform will be available in your fork's branch once you push your local copy to its remote version. More information about this procedure can be consulted [here](https://docs.github.com/en/get-started/using-git/about-git).
* **Create the Pull Request.** After you are done with your changes, it is possible to submit a Pull Request (PR), which means that you will formally submit changes to be incorporated into OpenIPSL. Information about collaboration through PRs can be found [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests).
* **Address Reviewer's Comments.** The procedure for having your contributions added to the OpenIPSL via PR is an iterative process. This means that you will submit your suggested changes and it is very likely that we will review your code and request for changes to be implemented. This back-and-forth part will lead to discussions and the main benefit from this process is the possibility of making our library better and even more robust. You can apply suggested changes directly through GitHub UI. You can make any other changes in your fork, then commit them to your branch. When you push your branch, the modifications will automatically appear in the open PR.

> **Note**: Please pay attention to the files you stage by doing the `git add`, command for example. When working with Modelica files (especially within Modelica-compliant tools) it is easy to loose control on the files you are adding to the staging area. This might introduce a lot of dummy modifications that do not add to models itself. Therefore, in order for your PR to be clean try to keep track of the files you are changing and try to modify the least amount of files possible for addressing the desired issue. 

Once you address all the comments and sign the applicable CLA, you don't have to worry with anything else. We are going to take care of the rest. :+1:

## How Can I Contribute?

There are many ways you can contribute to a better library. Here we list some ways you can start contributing. 

### Getting Started by Interacting :beginner:

If you are a user, you might want to check the [Discussion Section](https://github.com/OpenIPSL/OpenIPSL/discussions) to find other user's experiences. Maybe you can improve the discussion by relating your own experience. In addition to that you might want to check the [Issue List](https://github.com/OpenIPSL/OpenIPSL/issues). You might be able to help by trying to reproduce the errors that are listed there and reporting your own experiences with the library, for example. This enriches the overall information available for the community to address the issue and can help developers in identifying potential bugs.

### Reporting New Bugs :bug:

If you experience a bug and there is no discussion or open issue about it, please considering starting a new discussion topic or opening a new issue to report it. It is extremely important that you try to gather as much information about the issue as possible. Screenshots, files, plots and commands are useful and help developers to address the issue. The following is a list of possible things to include when opening a new issue:

* Use a clear and descriptive title when opening the issue. This help developers to identify the problem more easily.
* Provide a description of the steps you have taken to reproduce the problem with as many details as you can. Don't just explain what you did, but include the information on how you did it.
* Describe what behavior you observed after following the steps and what was the behavior you were expecting to observe. Also provide the reason why you expected to observe a different outcome.
* Include screenshots, files, plots and commands that you used when you experienced the problem as means to illustrate the issue.
* In addition, please provide the description of the Modelica-compliant software that was used when you experienced the problem. Some issues can be tool-related and this allow us to help their developers to improve their tool.


### Improving Documentation :memo:

The documentation of the OpenIPSL is located within the Modelica package. This documentation is added via annotations in the Modelica models and there are even dedicated files inside the library that are basically composed of annotations.
In addition to that, markdown files are present in many folders of the library, providing description to the many aspects of this library.

Indeed, the main goal of the documentation is to provide information on the development conventions adopted for this project, and provide a guide to the contributors of the project. If you want to contribute to building a better documentation, you can first start by learning about [Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/about-writing-and-formatting-on-github) and about [Modelica Annotations](https://mbe.modelica.university/behavior/equations/annotations/) if you are not familiar with these concepts yet. Please, visit the [Issues List](https://github.com/OpenIPSL/OpenIPSL/issues) since there are Documentation-related issues that can help you better understand what is needed by OpenIPSL.

### Improving Models in the Library :rocket: 

The library has been in development for many years now, and comprises many models for power system simulation. We are, however, always interested in adding new models to the library, or in improving existing models. This type of contribution requires strong documentation on your contribution. 

If you are adding/fixing models that are mentioned in one Issue, please document your contribution in the appropriate issue page and [link your PR to that issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue). This allows the team managing the repository to understand and review the changes suggested by you more quickly. In addition, provide as much information as possible to allow the developers of OpenIPSL to understand the motivation behind the suggested changes.

If the models you are adding/fixing are not mentioned in any issue, you are welcomed to open a new Issue but, if you prefer, you can directly open a PR with a full description of the models you are suggesting OpenIPSL to add. When submitting these new models to the library, please also include the following in the associated issue:

* A short report describing your component model, as well as the validation test.
* The source files that you used to validate your model against a reference tool.
* If the model is entirely new, and there is NO reference model to check against, some measurements could be useful…
* The data files to plot the comparison figures and compute the quantitative validation metrics.
* Reference documents used for creating the model. 
* Clear instructions that will help the OpenIPSL team to appropriately place, maintain and use the new model.

> **Note**: Structural changes to the library should be discussed with the team prior to any submission.


## The Contributor License Agreement

After following this guide in order to submit your contributions to the OpenIPSL, it is time for you to understand what are the details about the intellectual properties related to the library and to the enhancements you are proposing. In order to do so, you should check the [information](legal/README.md) about the Contributor's License Agreement (CLA) and the CLA assistant that is used by the OpenIPSL project to ensure transparency and fairness between contributors and developers.


