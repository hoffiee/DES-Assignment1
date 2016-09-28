% This script is used to test the functionality of synch.m
% It will be tested with two automatas given at lecture 5, 12/9.
clear all, clf, close all, clc, format compact

A = create_automaton(...
        {'a1','a2'},...   % States
        'a1',...         % Initial state
        {'a', 'b', 'c'},...   % Events (Alphabet)
        {'a1', 'a', 'a2';
         'a2', 'b', 'a1';
         'a2', 'c', 'a1'});%,... % Transitions (source, event, target)
        % {})   % Marked states  

B = create_automaton(...
        {'b1','b2'},...   % States
        'b1',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'b1', 'a', 'b2';
         'b2', 'b', 'b1'},... % Transitions (source, event, target)
        {'b1'});   % Marked states


tic
        AB=synch_event_based(A,B)   
toc

% tic
%         AB=synch(A,B);
% toc
