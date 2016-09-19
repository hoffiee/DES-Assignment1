% =======================================================
%
% This file acts as a testbench and test multiple cases
% against a user defined answer
%
% =======================================================

% Clean upp the workspace
clear all, clf, close all, clc, format compact


disp('Testcase 1')
A_test_1 = create_automaton(...
        {'a1','a2'},...   % States
        'a1',...         % Initial state
        {'a', 'b', 'c'},...   % Events (Alphabet)
        {'a1', 'a', 'a2';
         'a2', 'b', 'a1';
         'a2', 'c', 'a1'})%,... % Transitions (source, event, target)
        % {})   % Marked states  

B_test_1 = create_automaton(...
        {'b1','b2'},...   % States
        'b1',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'b1', 'a', 'b2';
         'b2', 'b', 'b1'},... % Transitions (source, event, target)
        {'b1'})   % Marked states

corr_AB_test_1 = create_automaton(...
        {'a1.b1','a2.b2','a1.b2'},...   % States
        'a1.b1',...         % Initial state
        {'a', 'b','c'},...   % Events (Alphabet)
        {'a1.b1', 'a', 'a2.b2';
         'a2.b2', 'b', 'a1.b1';
         'a2.b2','c','a1.b2'},... % Transitions (source, event, target)
        {'a1.b1'})   % Marked states



tic
AB_test_1=synch(A,B)
if isequal(AB_test_1,corr_AB_test_1)
	disp('test 1 passed')
end
toc