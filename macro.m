% Sam Abernethy Feb 1
% https://arxiv.org/pdf/0704.0686.pdf
% out vs in is an interesting distinction!
% https://arxiv.org/pdf/0704.1867.pdf fitting power laws

clear all; clc; close all;
[germanynodes, irelandnodes, nodes] = readindata();

[germean, iremean, gerstrength, irestrength] = averagedegreeandstrength(germanynodes, irelandnodes)

%plotacdf(germanynodes, 'Germany')
%plotacdf(irelandnodes, 'Ireland')
%scatterdegree(germanynodes, 'Germany')
%scatterdegree(irelandnodes, 'Ireland')
probabilityvsvariable(germanynodes, 2, 20, 'Germany')
probabilityvsvariable(irelandnodes, 2, 20, 'Ireland')
%comparenodedegree(germanynodes, irelandnodes)
%comparenodestrength(germanynodes, irelandnodes)
