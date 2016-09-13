%% Implement three functions
clear all, clf, close all, clc, format compact




P1 = create_automaton(...
        {'q1','q2','q3','q4','q5','q6','q7','q8','q9',},...   % States
        'q1',...         % Initial state
        {'a', 'b', 'c', 'd'},...   % Events (Alphabet)
        {'q1', 'a', 'q2';
         'q8', 'a', 'q9';
         'q2', 'b', 'q7';
         'q1', 'c', 'q6';
         'q5', 'c', 'q6';
         'q6', 'd', 'q7';
         'q2', 'd', 'q3'},... % Transitions (source, event, target)
        {'q7'});   % Marked states   


%P1.init
%P1.states
reach(P1.init, P1.trans)


