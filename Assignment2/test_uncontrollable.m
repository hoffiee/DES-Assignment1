clear all, clf, close all, clc, format compact





% Figure 6.4 lecture notes.
disp('Testcase 1')
P = create_automaton(...
        {'1','2','3','4','5'},...   % States
        '1',...         			% Initial state
        {'a','b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';...
        '2','b','4';...
        '1','c','3';...
        '2','!d','5';...
        '3','!d','4'});			% Transitions (source, event, target)
        						% Marked states			
S = create_automaton(...
        {'1','2','3','4'},...   	% States
        '1',...         			% Initial state
        {'a', 'b','c','!d'},...   	% Events (Alphabet)
        {'1','a','2';...
         '2','b','4';...
         '1','c','3';...
         '3','!d','4'},... % Transitions (source, event, target)
        {'4'});   % Marked states
corr_PS = create_automaton(...
        {'1.1','2.2','3.3','4.4'},...   % States
        '1.1',...         % Initial state
        {'a', 'b','c','!d'},...   % Events (Alphabet)
        {'1.1','a','2.2';...
         '2.2','b','4.4';...
         '1.1','c','3.3';...
         '4.4','!d','4.4'},... % Transitions (source, event, target)
        {'4.4'});%,...		 Marked states
        % {'4.4'});   	% Forbidden states?



PS = synch(P,S)


compare_automata(PS,corr_PS)