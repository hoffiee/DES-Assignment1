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
        unique({'a1.b1', 'a', 'a2.b2';
         'a2.b2', 'b', 'a1.b1';
         'a2.b2','c','a1.b2'}),... % Transitions (source, event, target)
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
A_test_2 = create_automaton(...
        {'a1','a2','a3','a4'},...   % States
        'a1',...         % Initial state
        {'a', 'b', 'c'},...   % Events (Alphabet)
        {'a2', 'a', 'a2';
         'a4', 'a', 'a1';
         'a1', 'b', 'a2';
         'a2', 'b', 'a3';
         'a4', 'b', 'a3';
         'a1', 'c', 'a2';
         'a2', 'c', 'a1';
         'a3', 'c', 'a2';
         'a4', 'c', 'a3'},...%,... % Transitions (source, event, target)
        {'a1'});   % Marked states  
B_test_2 = create_automaton(...
        {'b1','b2','b3','b4'},...   % States
        'b1',...         % Initial state
        {'a', 'b','c'},...   % Events (Alphabet)
        {'b1', 'a', 'b2';
         'b2', 'a', 'b2';
         'b3', 'a', 'b2';
         'b1', 'b', 'b3';
         'b2', 'b', 'b2';
         'b1', 'c', 'b3';
         'b2', 'c', 'b3';
         'b3', 'c', 'b4';
         'b4', 'c', 'b3'},... % Transitions (source, event, target)
        {'b1'});   % Marked states
corr_AB_test_2 = create_automaton(...
        {'a1.b1','a1.b3','a1.b4','a2.b2','a2.b3','a2.b4','a3.b2'},...   % States
        'a1.b1',...         % Initial state
        {'a', 'b','c'},...   % Events (Alphabet)
        unique({'a1.b1','b','a2.b3';
         'a1.b1','c','a2.b3';
         'a1.b3','c','a2.b4';
         'a1.b4','c','a2.b3';
         'a2.b2','a','a2.b2';
		 'a2.b2','c','a1.b3';
		 'a2.b2','b','a3.b2';
         'a2.b3','c','a1.b4';
         'a2.b3','a','a2.b2';
         'a3.b2','c','a2.b3';
		 'a2.b4','c','a1.b3'}),... % Transitions (source, event, target)
        {'a1.b1'});   % Marked states
tic
AB_test_2=synch(A_test_2,B_test_2);
time = toc;
if isequal(AB_test_2,corr_AB_test_2)
	disp('test 2 passed with elapsed time: ')
	disp(time)
else
	disp('test 2 failed with elapsed time: ')
	disp(time)
	A_test_2
	B_test_2
	AB_test_2
	corr_AB_test_2
end


% ================================
% ========== TESTCASE 3 ==========
% ================================
clear all % Clear everything from previous test
disp('Testcase 3')
A_test_3 = create_automaton(...
        {'a1','a2','a3','a4'},...   % States
        'a1',...         % Initial state
        {'a', 'b', 'c'},...   % Events (Alphabet)
        {'a2', 'a', 'a2';
         'a4', 'a', 'a1';
         'a1', 'b', 'a2';
         'a2', 'b', 'a3';
         'a4', 'b', 'a3';
         'a1', 'c', 'a2';
         'a2', 'c', 'a1';
         'a3', 'c', 'a2';
         'a4', 'c', 'a3'},...%,... % Transitions (source, event, target)
        {'a1'});   % Marked states  
B_test_3 = create_automaton(...
        {'b1','b2','b3','b4'},...   % States
        'b1',...         % Initial state
        {'a', 'b','c'},...   % Events (Alphabet)
        {'b1', 'a', 'b2';
         'b2', 'a', 'b2';
         'b3', 'a', 'b2';
         'b1', 'b', 'b3';
         'b2', 'b', 'b2';
         'b1', 'c', 'b3';
         'b2', 'c', 'b3';
         'b3', 'c', 'b4';
         'b4', 'c', 'b3'},... % Transitions (source, event, target)
        {'b1'});   % Marked states
corr_AB_test_3 = create_automaton(...
        {'a1.b1','a1.b3','a1.b4','a2.b2','a2.b3','a2.b4','a3.b2'},...   % States
        'a1.b1',...         % Initial state
        {'a', 'b','c'},...   % Events (Alphabet)
        unique({'a1.b1','b','a2.b3';
         'a1.b1','c','a2.b3';
         'a1.b3','c','a2.b4';
         'a1.b4','c','a2.b3';
         'a2.b2','a','a2.b2';
		 'a2.b2','c','a1.b3';
		 'a2.b2','b','a3.b2';
         'a2.b3','c','a1.b4';
         'a2.b3','a','a2.b2';
         'a3.b2','c','a2.b3';
		 'a2.b4','c','a1.b3'}),... % Transitions (source, event, target)
        {'a1.b1'});   % Marked states
tic
AB_test_3=synch(A_test_3,B_test_3);
time = toc;
if isequal(AB_test_3,corr_AB_test_3)
	disp('test 3 passed with elapsed time: ')
	disp(time)
else
	disp('test 3 failed with elapsed time: ')
	disp(time)
	A_test_3
	B_test_3
	AB_test_3
	corr_AB_test_3
end