% This is a testbench for constructing the supervisor. Add
% examples found in lecture notes to provide feedback of how
% our supervisor function is performing


% Clear all so there is no interference from older executions
clear all, clf, close all, clc, format compact



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


S_6_4 = supervisor(P,Sp, {'!d'})



% =======================================
% ======        TESTCASE 3          =====
% ====== figure 7.2 lecture notes   =====
% =======================================
disp('================')
disp('Testcase fig 7.2')
disp('================')
P1 = create_automaton(...
        {'p11','p12'},...   % States
        'p11',...                     % Initial state
        {'a','b'},...      % Events (Alphabet)
        {'p11','a','p12';...
        'p12','b','p11'});% ...           % Transitions (source, event, target)
        % {'p4'});
P2 = create_automaton(...
        {'p21','p22'},...   % States
        'p21',...                     % Initial state
        {'c','d','e'},...      % Events (Alphabet)
        {'p21','c','p22';...
        'p22','d','p21';...
        'p22','e','p21'});% ...           % Transitions (source, event, target)
        % {'p4'});                     % Marked states         
Sp1 = create_automaton(...
        {'Sp11','Sp12'},...   % States
        'Sp11',...                     % Initial state
        {'b','c'},...      % Events (Alphabet)
        {'Sp11','b','Sp12';...
        'Sp12','c','Sp11'},...           % Transitions (source, event, target)
        {'Sp11'});                     % Marked states  
Sp2 = create_automaton(...
        {'Sp21','Sp22'},...   % States
        'Sp21',...                     % Initial state
        {'c','d'},...      % Events (Alphabet)
        {'Sp21','c','Sp22';...
        'Sp22','d','Sp21'},...           % Transitions (source, event, target)
        {'Sp21'});                       

P1P2  = synch(P1,P2);
Sp1Sp2  = synch(Sp1,Sp2);

S = supervisor(P1P2,Sp1Sp2,{'b'})




% =======================================
% ====== Uncontrollable supervisor 	=====
% ====== figure 7.4 lecture notes	=====
% =======================================
disp('================')
disp('Testcase fig 7.4')
disp('================')
P = create_automaton(...
        {'1','2','3','4','5'},...   % States
        '1',...         			% Initial state
        {'a','b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';
         '2','b','4';
         '1','c','3';
         '2','!d','5';
         '3','!d','4'});			% Transitions (source, event, target)
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
        {'4.4'},...		% Marked states
        {'2.2'});   	% Forbidden states?

corr_S = create_automaton(...
        {'1.1','2.2.','3.3','4.4'},...   % States
        '1.1',...         % Initial state
        {'a', 'b','c','!d'},...   % Events (Alphabet)
        {'1.1','c','3.3';
         '3.3','!d','4.4'},... % Transitions (source, event, target)
        {'4.4'},...		% Marked states
        {'2.2'});   	% Forbidden states?


S_7_4 = supervisor(P,Sp,{'!d'})



% =======================================
% ====== 		TESTCASE 2            =====
% ====== Uncontrollable supervisor  =====
% ====== figure 7.5 lecture notes	  =====
% =======================================
disp('================')
disp('Testcase fig 7.5')
disp('================')
P = create_automaton(...
        {'1','2','3','4','5','6'},...   % States
        '1',...         			% Initial state
        {'a','b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';...
        '2','b','4';...
        '5','b','4';...
        '1','c','3';...
        '2','!d','5';...
        '5','!d','6';...
        '3','!d','4'},...			% Transitions (source, event, target)
        {'4'});						% Marked states			
Sp = create_automaton(...
        {'1','2','3','4','5'},...   	% States
        '1',...         			% Initial state
        {'a', 'b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';...
         '2','b','4';...
         '5','b','4';...
         '1','c','3';...
         '2','!d','5';...
         '3','!d','4'},... % Transitions (source, event, target)
        {'4'});   % Marked states
corr_S_0 = create_automaton(...
        {'1.1','2.2','3.3','4.4','5.5'},...   % States
        '1.1',...         % Initial state
        {'a', 'b','c','!d'},...   % Events (Alphabet)
        {'1.1','a','2.2';...
         '2.2','b','4.4';...
         '5.5','b','4.4';...
         '1.1','c','3.3';...
         '3.3','!d','4.4';...
         '2.2','!d','5.5'},... % Transitions (source, event, target)
        {'4.4'});%...		 Marked states
       % {'2.2'});   	% Forbidden states?

corr_S = create_automaton(...
        {'1.1','3.3','4.4'},...   % States
        '1.1',...         % Initial state
        {'c','!d'},...   % Events (Alphabet)
        {'1.1','c','3.3';...
         '3.3','!d','4.4'},... % Transitions (source, event, target)
        {'4.4'});		% Marked states
          
% S_0=synch(P,Sp);

% S = safestatesynthesis(S_0.states, S_0.events, S_0.trans, S_0.marked, S_0.forbidden)

S_7_5 = supervisor(P,Sp,{'!d'})










% =======================================
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

                






