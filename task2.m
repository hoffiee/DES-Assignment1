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

Sp1 = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'b', 'c'},...   % Events (Alphabet)
        {'1', 'b', '2';
         '2', 'c', '1'},... % Transitions (source, event, target)
        {'1'});

P2 = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'c', 'd', 'e'},...   % Events (Alphabet)
        {'1', 'c', '2';
         '2', 'd', '1';
         '2', 'e', '1'},... % Transitions (source, event, target)
        {'1','2'});   % Marked states

Sp2 = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'c', 'd'},...   % Events (Alphabet)
        {'1', 'c', '2'; %'2', 'c', '2'; '1','e', '1';
         '2', 'd', '1'},... % Transitions (source, event, target)
        {'1'});

% ====================
% ===== b) ===========
% ====================
P1Sp1=synch(P1,Sp1);
P2Sp2=synch(P2,Sp2);
S=synch(P1Sp1,P2Sp2)

% ====================
% ===== c) ===========
% ====================

reachable = reach(S.init, S.trans, S.forbidden)
coreachable = coreach(S.marked, S.trans, S.forbidden)

% ====================
% ===== d) ===========
% ====================
Sp2_modified = create_automaton(...
        {'1','2'},...   % States
        '1',...         % Initial state
        {'c', 'd'},...   % Events (Alphabet)
        {'1', 'c', '2';
         '2', 'c', '2'; % Self loop in state 2 at event c
         '1', 'e', '1'; % Self loop in state 1 at event e
         '2', 'd', '1'},... % Transitions (source, event, target)
        {'1'});


P2Sp2_modified=synch(P2,Sp2_modified);
S_modified=synch(P1Sp1,P2Sp2_modified)
