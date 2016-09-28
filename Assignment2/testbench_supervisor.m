% This is a testbench for constructing the supervisor. Add
% examples found in lecture notes to provide feedback of how
% our supervisor function is performing


% Clear all so there is no interference from older executions
Clear all, clf, close all, clc, format compact


% Trying to reuse code from testbench in assignment 1
% =======================================
% ====== 		TESTCASE 1 			=====
% ====== Uncontrollable supervisor 	=====
% ====== figure 7.4 lecture notes	=====
% =======================================
disp('Testcase 1')
P = create_automaton(...
        {'1','2','3','4','5'},...   % States
        '1',...         			% Initial state
        {'a','b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';
         '2','b','5';
         '1','c','4';
         '2','!d','3';
         '4','!d','5'});			% Transitions (source, event, target)
Sp = create_automaton(...
        {'1','2','3','4'},...   	% States
        '1',...         			% Initial state
        {'a', 'b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';
         '2','b','4';
         '1','c','3';
         '3','!d','4'},... % Transitions (source, event, target)
        {'4'});   % Marked states
corr_S_0 = create_automaton(...
        {'1.1','2.2','3.3','4.4'},...   % States
        '1.1',...         % Initial state
        {'a', 'b','c','!d'},...   % Events (Alphabet)
        {'1.1','a','2.2';
         '2.2','b','4.4';
         '1.1','c','3.3';
         '3.3','!d','4.4'},... % Transitions (source, event, target)
        {'4.4'}...		% Marked states
        {'2.2'});   	% Forbidden states?

corr_S = create_automaton(...
        {'1.1','2.2.','3.3','4.4'},...   % States
        '1.1',...         % Initial state
        {'a', 'b','c','!d'},...   % Events (Alphabet)
        {'1.1','c','3.3';
         '3.3','!d','4.4'},... % Transitions (source, event, target)
        {'4.4'}...		% Marked states
        {'2.2'});   	% Forbidden states?


count = 10;
tic
for i = 1:count;
S0=synch(P,Sp);
end
time = toc;
disp(time/count)
compare_automata(S0,corr_S0)



% =======================================
% ====== 		TESTCASE 2 			=====
% ====== Uncontrollable supervisor 	=====
% ====== figure 7.5 lecture notes	=====
% =======================================
disp('Testcase 1')
P = create_automaton(...
        {'1','2','3','4','5','6'},...   % States
        '1',...         			% Initial state
        {'a','b','c','!d'},...   	% Events (Alphabet)
        {'1','a','1';
        '2','b','4';
        '5','b','4';
        '1','c','3';
        '2','!d','5';
        '5','!d','6';
        '3','!d','4'}...				% Transitions (source, event, target)
        {'4'}); 						% Marked states			
Sp = create_automaton(...
        {'1','2','3','4','5'},...   	% States
        '1',...         			% Initial state
        {'a', 'b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';
         '2','b','4';
         '1','c','3';
         '3','!d','4'},... % Transitions (source, event, target)
        {'4'});   % Marked states
corr_S_0 = create_automaton(...
        {'1.1','2.2','3.3','4.4'},...   % States
        '1.1',...         % Initial state
        {'a', 'b','c','!d'},...   % Events (Alphabet)
        {'1.1','a','2.2';
         '2.2','b','4.4';
         '1.1','c','3.3';
         '3.3','!d','4.4'},... % Transitions (source, event, target)
        {'4.4'}...		% Marked states
        {'2.2'});   	% Forbidden states?

corr_S = create_automaton(...
        {'1.1','3.3','4.4'},...   % States
        '1.1',...         % Initial state
        {'a', 'b','c','!d'},...   % Events (Alphabet)
        {'1.1','c','3.3';
         '3.3','!d','4.4'},... % Transitions (source, event, target)
        {'4.4'};		% Marked states
          


