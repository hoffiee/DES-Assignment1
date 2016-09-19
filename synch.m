% This is not done!

% 3. function aut1aut2 = synch(aut1, aut2)
% Returns the synchronous composition of two automata

function aut1aut2 = synch(aut1, aut2)
    
    % ===============================
    % ====== Calculates states ======
    % ===============================
    saut1 = size(aut1.states);
    saut2 = size(aut2.states);
    states = {};
    for i = 1:saut1(2)
        for j = 1:saut2(2)
            states = [states merge_state(aut1.states{i}, aut2.states{j})];
        end
    end
    
    % ===============================
    % ====== calculates alphabet ==== - Seems to be working as intended
    % ===============================
    % This is an case thing, 

    % Check if its enough with isequal, if not it is needed to implement
    % setdiff on two cases and the result need to be empty 
    if isequal(aut1.events,aut2.events)
        disp('equal languages')
        events=intersect(aut1.events,aut2.events);
    else
        disp('not equal languages')
        events=union(aut1.events,aut2.events);
    end
    
    % ====================================
    % ====== Calculates transitions ======
    % ====================================
    

    % Formal method
    % case 1: if events element of L(aut1) intersect L(aut2)
    % case 2: if events element of L(aut1) setdiff L(aut2)
    % case 3: if events element of L(aut2) setdiff L(aut1)

    % if ismember(A,intersect(aut1.events,aut2.events))


    % TIP, loop through common and uncommon events
    %common events 

    % Används detta?
    common = intersect(aut1.events,aut2.events);
    uncommon = setdiff(aut1.events, aut2.events);

    % Make self loops so that aut1 and aut2 becomes aut1' aut2'
    
    not_in_aut1 = setdiff(aut2.events, aut1.events);
    aut1 = add_self_loops(aut1,not_in_aut1);
    
    not_in_aut2 = setdiff(aut1.events, aut2.events);
    aut2 = add_self_loops(aut2,not_in_aut2);




    % Börja med common
    saut = size(states);
    for i = 1:saut(2)
        % c_state=states{i}
        % s=size(c_state)
        % c_state(1:round(s(2)/2)-1)
        % c_state(round(s(2)/2)+1:end)

        [s1 s2] = split_state(states{i});
    end

    % Check common events


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
            marked = [marked merge_state(aut1.marked{i}, aut2.marked{j})];
        end
    end
    


    % ===================================
    % ====== Create new automata ========
    % ===================================
    aut1aut2 = create_automaton(...
        states,...   % States
        merge_state(aut1.init, aut2.init),...         % Initial state
        events,...   % Events (Alphabet)
        {},... % Transitions (source, event, target)
        marked); % Marked states

end
        
        
