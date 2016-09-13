% Creates automata P1 and P2

P1 = create_automaton(...
        {'p11','p12'},...   % States
        'p11',...         % Initial state
        {'a', 'b'},...   % Events (Alphabet)
        {'p11', 'a', 'p12';
         'p12', 'b', 'p11'},... % Transitions (source, event, target)
        {'p11','p12'});   % Marked states   
fig(P1, 'P1');

P2 = create_automaton(...
        {'p21','p22'},...   % States
        'p21',...         % Initial state
        {'c', 'd', 'e'},...   % Events (Alphabet)
        {'p21', 'c', 'p22';
         'p22', 'd', 'p21';
         'p22', 'e', 'p21'},... % Transitions (source, event, target)
        {'p21','p22'});   % Marked states
fig(P2, 'P2');
