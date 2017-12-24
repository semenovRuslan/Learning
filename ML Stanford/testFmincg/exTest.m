clc;
clear all;
close all;
options = optimset('MaxIter', 50);
init = 1:.1:50;
init = init';
newFunc = @(p) costFunc(p);
tic
[nn_params, cost] = fmincg(newFunc, init, options);
toc 