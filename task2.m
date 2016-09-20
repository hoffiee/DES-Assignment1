%==================================================
%
% This is the file containing the solutions and 
% calculations for task 2.
%
% Author: Rickard & Per
%==================================================



% Defining automatas

P1 = create_automaton(...
        {'11','12'},...   % States
        '11',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'11', 'a', '12';
         '12', 'b', '11'},... % Transitions (source, event, target)
        {'11','12'});   % Marked states   
%fig(P1, 'P1');

P2 = create_automaton(...
        {'21','22'},...   % States
        '21',...         % Initial state
        {'c', 'd', 'e'},...   % Events (Alphabet)
        {'21', 'c', '22';
         '22', 'd', '21';
         '22', 'e', '21'},... % Transitions (source, event, target)
        {'21','22'});   % Marked states
%fig(P2, 'P2');


Sp1 = create_automaton(...
        {'31','32'},...   % States
        '31',...         % Initial state
        {'b', 'c'},...   % Events (Alphabet)
        {'31', 'b', '32';
         '32', 'c', '31'});... % Transitions (source, event, target)
        %);   % Marked states
%fig(P2, 'P2');

Sp2 = create_automaton(...
        {'41','42'},...   % States
        '41',...         % Initial state
        {'c', 'd'},...   % Events (Alphabet)
        {'41', 'c', '42';
         '42', 'd', '41'});... % Transitions (source, event, target)
        %{});   % Marked states
%fig(P2, 'P2');

% ====================
% ===== b) ===========
% ====================
P1P2=synch(P1,P2)
Sp1Sp2=synch(Sp1,Sp2)

S=synch(P1P2,Sp1Sp2)


% ====================
% ===== c) ===========
% ====================
reachable = reach(S.init, S.trans, S.forbidden)
coreachable = coreach(S.marked, S.trans, S.forbidden)

% ====================
% ===== d) ===========
% ====================

