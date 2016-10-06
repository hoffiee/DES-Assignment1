% Clear all so there is no interference from older executions
clear all, clf, close all, clc, format compact


P = create_automaton(...
	{'A5','B4','A3','B3','A2','B2','A1','B1','A0','B0'},...	% States
	'A5',...												% Initial state
	{'a1','b1','a2','b2'},...								% Events
	{'A5','a1','B4';...										% Transitions
	'A3','a1','B2';...
	'A2','a1','B1';...
	'A1','a1','A0';...
	'A5','a2','B3';...
	'A3','a2','B1';...
	'A2','a2','A0';...
	'B4','b1','A3';...
	'B3','b1','A2';...
	'B2','b1','A1';...
	'B1','b1','B0';...
	'B4','b2','A2';...
	'B3','b2','A1';...
	'B2','b2','B0'})

Sp = create_automaton(...
	{'A5','B4','A3','B3','A2','B2','A1','B1','A0','B0'},...	% States
	'A5',...												% Initial state
	{'a1','b1','a2','b2'},...								% Events
	{'A5','a1','B4';...										% Transitions
	'A3','a1','B2';...
	'A2','a1','B1';...
	'A1','a1','A0';...
	'A5','a2','B3';...
	'A3','a2','B1';...
	'A2','a2','A0';...
	'B4','b1','A3';...
	'B3','b1','A2';...
	'B2','b1','A1';...
	'B1','b1','B0';...
	'B4','b2','A2';...
	'B3','b2','A1';...
	'B2','b2','B0'},...
	{'B0'},... 												% Marked
	{'A0'}) 												% Forbidden 

S = supervisor(P, Sp, {'b1', 'b2'})
