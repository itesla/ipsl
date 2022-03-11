# CLA Instructions

Please read this document before officially submitting a Pull Request. It contains important information regarding some legal steps you will be expected to complete before your work is integrated into OpenIPSL. <br/> 

## 1. What is the CLA?

The Contributor's License Agreement (CLA) defines the terms related to all intellectual property that has contributed to a project, i.e., to the OpenIPSL in this case. The CLA is used to establish the legal obligations and rights which governs the relationship between a part that submits a contribution and a part that receives such contribution. <br/> 

The OpenIPSL has two classes of CLA. The [entity CLA](cla-entity.md) is made for contributors that act on the behalf of legal entities that cannot be considered to be a physical/natural person. Companies, for example, that are considering contributing to the OpenIPSL are able to do so by reading and signing the entity CLA. On the other hand, if an individual person wants to add their contributions to the library, they can do so by reading and signing the [individual CLA](cla-individual.md). <br/> 

## 2. What is the workflow designed for the CLA Assistant?

This repository has an automatic [CLA assistant](https://github.com/contributor-assistant/github-action) that only allows contributions to be added to the main library once their authors have agreed with the applicable license terms. The CLA Assistant allows the relationship between you, the contributor, and the OpenIPSL to be transparent and fair. <br/>

The CLA Assistant works in the following way: when you create a Pull Request (PR), the CLA assistant action workflow will be triggered. The workflow will create a comment on the recently opened PR, asking contributors who have not signed the CLA to sign it and it will block the merging of the PR. After all contributors have signed the CLA, then the PR status will pass with `success`. <br/> 


## 3. How can I sign the CLA?

Contributors can sign the CLA within the PR by copying the statement **"I have read the CLA Document and I hereby sign the CLA"** and pasting it in the PR as a comment. This means that you agree with all terms that are described in the individual/entity CLA, whichever applies to your case as a contributor. <br/> 

The GIF below demonstrates a PR being created, the workflow being triggered and how the contributor should sign the CLA. <br/> 

### Demo for steps 2 and 3:

![signature-process](https://github.com/cla-assistant/github-action/blob/master/images/signature-process.gif?raw=true)
