clc
clear
%% Test script for class test
resultsClassTest = run(MatrixInvClassTest)
percentPassed = 100 * nnz([resultsClassTest.Passed]) / numel(resultsClassTest);
disp([num2str(percentPassed), '% Passed.']);