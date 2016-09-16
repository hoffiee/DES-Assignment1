% This script is used to test the functionality of synch.m
% It will be tested with two automatas given at lecture 5, 12/9.
clear all, clf, close all, clc, format compact

A = create_automaton(...
        {'qa1','qa2'},...   % States
        'qa1',...         % Initial state
        {'a', 'b', 'c'},...   % Events (Alphabet)
        {'qa1', 'a', 'qa2';
         'qa2', 'b', 'qa1';
         'qa2', 'c', 'qa1'},... % Transitions (source, event, target)
        {'qa1','qa2'});   % Marked states  

B = create_automaton(...
        {'qb1','qb2'},...   % States
        'qb1',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'qb1', 'a', 'qb2';
         'qb2', 'b', 'qb1'},... % Transitions (source, event, target)
        {'qb1'});   % Marked states

synch(A,B)




% sA=size(A.states);
% sB=size(B.states);
% aut1aut2 = {};
% for i = 1:sA(2)
%     for j = 1:sB(2)
%         aut1aut2 = [aut1aut2 merge_state(A.states{i},B.states{j})];
%     end
% end
% 
% aut1aut2
% 

     