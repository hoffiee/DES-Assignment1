%==================================================
%
% This is the file containing the solutions and 
% calculations for task 2.
%
% Author: Rickard & Per
%==================================================
clear all, clf, close all, clc, format compact

P1 = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'1', 'a', '2';
         '2', 'b', '1'},... % Transitions (source, event, target)
        {'1','2'});   % Marked states   

P2 = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'c', 'd', 'e'},...   % Events (Alphabet)
        {'1', 'c', '2';
         '2', 'd', '1';
         '2', 'e', '1'},... % Transitions (source, event, target)
        {'1','2'});   % Marked states

Sp1 = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'b', 'c'},...   % Events (Alphabet)
        {'1', 'b', '2';
         '2', 'c', '1'},... % Transitions (source, event, target)
        {'1','2'});

Sp2 = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'c', 'd'},...   % Events (Alphabet)
        {'1', 'c', '2';
         '2', 'd', '1'},... % Transitions (source, event, target)
        {'1','2'});

% ====================
% ===== b) ===========
% ====================
P1P2=synch(P1,P2);
Sp1Sp2=synch(Sp1,Sp2);
S=synch(P1P2,Sp1Sp2)

% P1P2=synch_state_based(P1,P2);
% Sp1Sp2=synch_state_based(Sp1,Sp2);
% S2=synch_state_based(P1P2,Sp1Sp2)
% compare_automata(S, S2)


% ====================
% ===== c) ===========
% ====================

reachable = reach(S.init, S.trans, S.forbidden)
coreachable = coreach(S.marked, S.trans, S.forbidden)

% ====================
% ===== d) ===========
% ====================

