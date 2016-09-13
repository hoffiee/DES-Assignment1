%% Implement three functions
clear all, clf, close all, clc, format compact




P1 = create_automaton(...
        {'p11','p12'},...   % States
        'p11',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'p11', 'a', 'p12';
         'p12', 'b', 'p11'},... % Transitions (source, event, target)
        {'p11','p12'});   % Marked states   

P1


