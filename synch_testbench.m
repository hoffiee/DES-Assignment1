% =======================================================
%
% This file acts as a testbench and test multiple cases
% against a user defined answer
%
% =======================================================

% Clean upp the workspace and set format compact
clear all, clf, close all, clc, format compact


% ================================
% ========== TESTCASE 1 ==========
% ================================
disp('Testcase 1')
A_test_1 = create_automaton(...
        {'a1','a2'},...   % States
        'a1',...         % Initial state
        {'a', 'b', 'c'},...   % Events (Alphabet)
        {'a1', 'a', 'a2';
         'a2', 'b', 'a1';
         'a2', 'c', 'a1'});%,... % Transitions (source, event, target)
        % {})   % Marked states  
B_test_1 = create_automaton(...
        {'b1','b2'},...   % States
        'b1',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'b1', 'a', 'b2';
         'b2', 'b', 'b1'},... % Transitions (source, event, target)
        {'b1'});   % Marked states
corr_AB_test_1 = create_automaton(...
        {'a1.b1','a1.b2','a2.b2'},...   % States
        'a1.b1',...         % Initial state
        {'a', 'b','c'},...   % Events (Alphabet)
        {'a1.b1', 'a', 'a2.b2';
         'a2.b2', 'b', 'a1.b1';
         'a2.b2','c','a1.b2'},... % Transitions (source, event, target)
        {'a1.b1'});   % Marked states
tic
AB_test_1=synch(A_test_1,B_test_1);
time = toc;
if isequal(AB_test_1,corr_AB_test_1)
	disp('test 1 passed with elapsed time: ')
	disp(time)
else
	disp('test 1 failed with elapsed time: ')
	disp(time)
	A_test_1
	B_test_1
	AB_test_1
	corr_AB_test_1
end



% ================================
% ========== TESTCASE 2 ==========
% ================================
clear all % Clear everything from previous test
disp('Testcase 2')
P = create_automaton(...
        {'p1','p2','p3','p4','p5','p6','p7','p8','p9'},...   % States
        'p1',...         % Initial state
        {'a', 'b', 'c','d'},...   % Events (Alphabet)
        {'p1', 'a', 'p2';
         'p8', 'a', 'p9';
         'p2','b','p7';
         'p1','c','p6';
         'p5','c','p6';
         'p6','d','p7';
         'p2','d','p3'});%,... % Transitions (source, event, target)
        {'p7'})   % Marked states  
B_test_1 = create_automaton(...
        {'b1','b2'},...   % States
        'b1',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'b1', 'a', 'b2';
         'b2', 'b', 'b1'},... % Transitions (source, event, target)
        {'b1'});   % Marked states
corr_AB_test_1 = create_automaton(...
        {'a1.b1','a1.b2','a2.b2'},...   % States
        'a1.b1',...         % Initial state
        {'a', 'b','c'},...   % Events (Alphabet)
        {'a1.b1', 'a', 'a2.b2';
         'a2.b2', 'b', 'a1.b1';
         'a2.b2','c','a1.b2'},... % Transitions (source, event, target)
        {'a1.b1'});   % Marked states
tic
AB_test_1=synch(A_test_1,B_test_1);
time = toc;
if isequal(AB_test_1,corr_AB_test_1)
	disp('test 1 passed with elapsed time: ')
	disp(time)
else
	disp('test 1 failed with elapsed time: ')
	disp(time)
	A_test_1
	B_test_1
	AB_test_1
	corr_AB_test_1
end