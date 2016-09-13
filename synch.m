% This is not done!

% 3. function aut1aut2 = synch(aut1, aut2)
% Returns the synchronous composition of two automata



function aut1aut2= synch(aut1, aut2)
    
    % ===============================
    % ====== Calculates states ======
    % ===============================
    saut1 = size(aut1.states);
    saut2 = size(aut2.states);
    states = {};
    for i = 1:saut1(2)
        for j = 1:saut2(2)
            states = [states merge_state(aut1.states{i}, aut2.states{j})]
        end
    end
    
    % ===============================
    % ====== calculates alphabet ====
    % ===============================
    % This is done directly in the creation of the automata
    
    
    % ===============================
    % ====== calculates init ========
    % ===============================
    % This is done directly in the creation of the automata
    
    % ========================================
    % ====== calculates marked states ========
    % ====== Assumes 
    % ========================================
    saut1 = size(aut1.marked);
    saut2 = size(aut2.marked);
    marked = {};
    for i = 1:saut1(2)
        for j = 1:saut2(2)
            marked = [marked merge_state(aut1.marked{i}, aut2.marked{j})]
        end
    end
    
    aut1aut2 = create_automaton(...
        states,...   % States
        {aut1.init aut2.init},...         % Initial state
        union(aut1.events,aut2.events),...   % Events (Alphabet)
        {},... % Transitions (source, event, target)
        marked) % Marked states


end
        
        
