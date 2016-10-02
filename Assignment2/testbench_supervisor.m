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



% =======================================
% ====== 		TESTCASE 2 			=====
% ====== Uncontrollable supervisor 	=====
% ====== figure 7.5 lecture notes	=====
% =======================================
disp('Testcase 2')
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
          
S_0=synch(P,Sp);


if compare_automata(S_0,corr_S_0)
	disp('S_0 and corr_S_0 is equal')
else
	disp('S_0 and corr_S_0 is not equal')
end

S = safestatesynthesis(S_0.states, S_0.events, S_0.trans, S_0.marked, S_0.forbidden)


% ===========================================
% ===== Test for uncontrollable states  =====
% ===== 7.4,
% ===========================================

% =======================================
% ======        TESTCASE 2          =====
% ====== Uncontrollable supervisor  =====
% ====== figure 7.4 lecture notes   =====
% =======================================
disp('Testcase fig 7.4')
P = create_automaton(...
        {'1','2','3','4','5'},...   % States
        '1',...                     % Initial state
        {'a','b','c','!d'},...      % Events (Alphabet)
        {'1','a','2';...
        '2','b','4';...
        '1','c','3';...
        '2','!d','5';...
        '3','!d','4'});%...           % Transitions (source, event, target)
        % {'4'});                     % Marked states         
Sp = create_automaton(...
        {'1','2','3','4'},...       % States
        '1',...                     % Initial state
        {'a', 'b','c','!d'},...     % Events (Alphabet)
        {'1','a','2';...
         '2','b','4';...
         '1','c','3';...
         '3','!d','4'},... % Transitions (source, event, target)
        {'4'});   % Marked states


S_0 = synch(P, Sp)

Q_uc = {};

s_events = size(S_0.events);
events_u = {};

for i = 1:s_events(2)
    S_0.events{i};
    if sum(ismember(S_0.events{i},'!')) == 0

    else
        events_u = [events_u S_0.events{i}];
    end
end

events_c = setdiff(S_0.events,events_u);
events_u;

% Divide transitions into controllable and uncontrollable
trans_c = filter_trans_by_events(S_0.trans, events_c);
trans_u = filter_trans_by_events(S_0.trans, events_u);


first_term = intersect(events_u, S_0.events)
second_term = 

%⟨p,q⟩∈QP||S|∃σ ∈Σ ∩ΣS ∧δP(p,σ )∈QP ∧δS(q,σ )notdefined
                








