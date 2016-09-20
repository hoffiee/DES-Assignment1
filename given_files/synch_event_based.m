% This is not done!
%
% 3. function aut1aut2 = synch(aut1, aut2)
% Returns the synchronous composition of two automata

function aut1aut2 = synch(aut1, aut2)
    
 
    states={};


    % Set alphabet to equal if it is needed. Also fixes self loops.
    if isequal(aut1.events,aut2.events)
        % disp('equal languages')
        events=intersect(aut1.events,aut2.events);
    else
        % disp('not equal languages')
        events=union(aut1.events,aut2.events); % Dont think this contributes, but its nice to mention it

        % Create self-loops for both automatas.
        not_in_aut1 = setdiff(aut2.events, aut1.events);
        aut1 = add_self_loops(aut1,not_in_aut1);
    
        not_in_aut2 = setdiff(aut1.events, aut2.events);
        aut2 = add_self_loops(aut2,not_in_aut2);
    end



    init = merge_state(aut1.init, aut2.init);
    trans={};
    synched_states= {init};
    current_state = {init};
    % new_states={};
    while 1




        temp_states = current_state;

        
        nr_of_states = size(current_state);




        if isempty(current_state)
            break; 
        end
  
    end

    % ===================================================
    % ====== calculates marked states ===================
    % ====== ##TODO lägga in den i trans algoritmen =====
    % ===================================================
    saut1 = size(aut1.marked);
    saut2 = size(aut2.marked);
    marked = {};
    for i = 1:saut1(2)
        for j = 1:saut2(2)
            marked = [marked merge_state(aut1.marked{i}, aut2.marked{j})];
        end
    end



    % ===================================
    % ====== Create new automata ========
    % ===================================
    aut1aut2 = create_automaton(...
        unique(synched_states),...   % States
        merge_state(aut1.init, aut2.init),...         % Initial state
        unique(events),...   % Events (Alphabet)
        trans,... % Transitions (source, event, target)
        marked);%intersect(marked,synched_states)); % Marked states

end