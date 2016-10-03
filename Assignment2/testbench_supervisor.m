% This is a testbench for constructing the supervisor. Add
% examples found in lecture notes to provide feedback of how
% our supervisor function is performing


% Clear all so there is no interference from older executions
clear all, clf, close all, clc, format compact


% Trying to reuse code from testbench in assignment 1
% =======================================
% ====== 		TESTCASE 1 			=====
% ====== Uncontrollable supervisor 	=====
% ====== figure 7.4 lecture notes	=====
% =======================================
% disp('Testcase 1')
% P = create_automaton(...
%         {'1','2','3','4','5'},...   % States
%         '1',...         			% Initial state
%         {'a','b','c','!d'},...   	% Events (Alphabet)
%         {'1','a','2';
%          '2','b','5';
%          '1','c','4';
%          '2','!d','3';
%          '4','!d','5'});			% Transitions (source, event, target)
% Sp = create_automaton(...
%         {'1','2','3','4'},...   	% States
%         '1',...         			% Initial state
%         {'a', 'b','c','!d'},...   	% Events (Alphabet)
%         {'1','a','2';
%          '2','b','4';
%          '1','c','3';
%          '3','!d','4'},... % Transitions (source, event, target)
%         {'4'});   % Marked states
% corr_S_0 = create_automaton(...
%         {'1.1','2.2','3.3','4.4'},...   % States
%         '1.1',...         % Initial state
%         {'a', 'b','c','!d'},...   % Events (Alphabet)
%         {'1.1','a','2.2';
%          '2.2','b','4.4';
%          '1.1','c','3.3';
%          '3.3','!d','4.4'},... % Transitions (source, event, target)
%         {'4.4'}...		% Marked states
%         {'2.2'});   	% Forbidden states?

% corr_S = create_automaton(...
%         {'1.1','2.2.','3.3','4.4'},...   % States
%         '1.1',...         % Initial state
%         {'a', 'b','c','!d'},...   % Events (Alphabet)
%         {'1.1','c','3.3';
%          '3.3','!d','4.4'},... % Transitions (source, event, target)
%         {'4.4'}...		% Marked states
%         {'2.2'});   	% Forbidden states?


% count = 10;
% tic
% for i = 1:count;
% S0=synch(P,Sp);
% end
% time = toc;
% disp(time/count)
% compare_automata(S0,corr_S0)



% % =======================================
% % ====== 		TESTCASE 2 			=====
% % ====== Uncontrollable supervisor 	=====
% % ====== figure 7.5 lecture notes	=====
% % =======================================
% disp('Testcase 2')
% P = create_automaton(...
%         {'1','2','3','4','5','6'},...   % States
%         '1',...         			% Initial state
%         {'a','b','c','!d'},...   	% Events (Alphabet)
%         {'1','a','2';...
%         '2','b','4';...
%         '5','b','4';...
%         '1','c','3';...
%         '2','!d','5';...
%         '5','!d','6';...
%         '3','!d','4'},...			% Transitions (source, event, target)
%         {'4'});						% Marked states			
% Sp = create_automaton(...
%         {'1','2','3','4','5'},...   	% States
%         '1',...         			% Initial state
%         {'a', 'b','c','!d'},...   	% Events (Alphabet)
%         {'1','a','2';...
%          '2','b','4';...
%          '5','b','4';...
%          '1','c','3';...
%          '2','!d','5';...
%          '3','!d','4'},... % Transitions (source, event, target)
%         {'4'});   % Marked states
% corr_S_0 = create_automaton(...
%         {'1.1','2.2','3.3','4.4','5.5'},...   % States
%         '1.1',...         % Initial state
%         {'a', 'b','c','!d'},...   % Events (Alphabet)
%         {'1.1','a','2.2';...
%          '2.2','b','4.4';...
%          '5.5','b','4.4';...
%          '1.1','c','3.3';...
%          '3.3','!d','4.4';...
%          '2.2','!d','5.5'},... % Transitions (source, event, target)
%         {'4.4'});%...		 Marked states
%        % {'2.2'});   	% Forbidden states?

% corr_S = create_automaton(...
%         {'1.1','3.3','4.4'},...   % States
%         '1.1',...         % Initial state
%         {'c','!d'},...   % Events (Alphabet)
%         {'1.1','c','3.3';...
%          '3.3','!d','4.4'},... % Transitions (source, event, target)
%         {'4.4'});		% Marked states
          
% S_0=synch(P,Sp);


% if compare_automata(S_0,corr_S_0)
% 	disp('S_0 and corr_S_0 is equal')
% else
% 	disp('S_0 and corr_S_0 is not equal')
% end

% S = safestatesynthesis(S_0.states, S_0.events, S_0.trans, S_0.marked, S_0.forbidden)


% =======================================
% ======        TESTCASE 2          =====
% ====== Uncontrollable states      =====
% ====== figure 6.4 lecture notes   =====
% =======================================
disp('================')
disp('Testcase fig 6.4')
disp('================')
P = create_automaton(...
        {'p1','p2','p3','p4','p5'},...   % States
        'p1',...                     % Initial state
        {'a','b','c','!d'},...      % Events (Alphabet)
        {'p1','a','p2';...
        'p2','b','p4';...
        'p1','c','p3';...
        'p2','!d','p5';...
        'p3','!d','p4'});%...           % Transitions (source, event, target)
        % {'4'});                     % Marked states         
Sp = create_automaton(...
        {'Sp1','Sp2','Sp3','Sp4'},...       % States
        'Sp1',...                     % Initial state
        {'a', 'b','c','!d'},...     % Events (Alphabet)
        {'Sp1','a','Sp2';...
         'Sp2','b','Sp4';...
         'Sp1','c','Sp3';...
         'Sp3','!d','Sp4'},... % Transitions (source, event, target)
        {'Sp4'});   % Marked states


supervisor(P,Sp, {'!d'})




% =======================================
% ======        TESTCASE 2          =====
% ====== figure 7.7 lecture notes   =====
% =======================================
disp('================')
disp('Testcase fig 7.7')
disp('================')
P = create_automaton(...
        {'p1','p2','p3','p4','p5','p6','p7','p8'},...   % States
        'p1',...                     % Initial state
        {'a','b','c','!d'},...      % Events (Alphabet)
        {'p1','a','p2';...
        'p5','a','p6';...
        'p2','b','p4';...
        'p6','b','p4';...
        'p1','c','p3';...
        'p2','!d','p5';...
        'p6','!d','p7';...
        'p7','!d','p8';...
        'p3','!d','p4'},...           % Transitions (source, event, target)
        {'p4'});                     % Marked states         
Sp = create_automaton(...
        {'Sp1','Sp2','Sp3','Sp4','Sp5','Sp6','Sp7'},...       % States
        'Sp1',...                     % Initial state
        {'a', 'b','c','!d'},...     % Events (Alphabet)
        {'Sp1','a','Sp2';...
         'Sp5','a','Sp6';...
         'Sp2','b','Sp4';...
         'Sp6','b','Sp4';...
         'Sp1','c','Sp3';...
         'Sp2','!d','Sp5';...
         'Sp3','!d','Sp4';...
         'Sp6','!d','Sp7'},... % Transitions (source, event, target)
        {'Sp4'});   % Marked states



S=supervisor(P,Sp, {'!d'})
% S.states = safestatesynthesis(S.states, S.events, S.marked, S.forbidden)

                








