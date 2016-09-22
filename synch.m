% SYNCH_EVENT_BASED
%
% Seems to be working better than our STATE_BASED algorithm,
% but it is performing slower and taking overall longer time to execute
%
function aut1aut2 = synch(aut1, aut2)
    
    % Calculates initial state, add it to synched_states
    init = merge_state(aut1.init, aut2.init);
    synched_states={init};
    % create an empty set of transitions
    trans={};

    % Set alphabet to equal if it is needed. Also adds self loops.
    if isequal(aut1.events,aut2.events) % This assumes that both events is sorted in order
        % if the alphabets is equal, there is no need to do anything
    else % If the alphabet isn't equal.
        % Create the new language, if the case where the alphabets is equal
        % but not in the same order, this won't do anything special, and therefore
        % the following setdiff will result in empty sets, which causes the self loop
        % to do nothing.
        events=union(aut1.events,aut2.events);

        % Create self-loops for both automatas.
        % Get the events from aut2 that isnt included in aut 1
        not_in_aut1 = setdiff(aut2.events, aut1.events);
        aut1 = add_self_loops(aut1,not_in_aut1);
        % Get the events from aut1 that isnt included in aut 2
        not_in_aut2 = setdiff(aut1.events, aut2.events);
        aut2 = add_self_loops(aut2,not_in_aut2);
    end

    % Loop to handle each event
    nr_of_events = size(events);
    for e = 1:nr_of_events(2)
        
        % Get the transitions for the current event for aut1
        current_trans_aut1 = filter_trans_by_events(aut1.trans, events(e));
        % check how many states there is for each automata, which later is used to 
        % form the loops creating the new states.
        nr_in_aut1 = size(filter_trans_by_events(aut1.trans, events(e)));
        nr_in_aut2 = size(filter_trans_by_events(aut2.trans, events(e)));
        
        
        for e_aut1 = 1:nr_in_aut1(1)

            % Get the transitions for the current event for aut2
            current_trans_aut2 = filter_trans_by_events(aut2.trans, events(e));
            
            for e_aut2 = 1:nr_in_aut2(1)

                % new state is found by merging the state from the i transition 'qX','event','qY' and j transition for aut2
                new_state = merge_state(current_trans_aut1{e_aut1,1}, current_trans_aut2{e_aut2,1});
                % Same principle as new_state but instead focusing on target states
                target_state = merge_state(current_trans_aut1{e_aut1,3}, current_trans_aut2{e_aut2,3});
                % Adds the created states to synched_states
                synched_states = unique([synched_states, new_state, target_state]);
                % Add the new transition to the current transition set.
                trans = add_tran(trans, new_state, events{e}, target_state);
            end
        end    
    end

    % ====================================================
    % ====== calculates marked states           ==========
    % ====== This is achieved by combining      ==========
    % ====== marked states from aut1 and aut2  ==========
    % ====================================================
    saut1 = size(aut1.marked);
    saut2 = size(aut2.marked);
    marked = {}; 
    for i = 1:saut1(2)
        for j = 1:saut2(2)
            marked = [marked merge_state(aut1.marked{i}, aut2.marked{j})];
        end
    end

    % ==================================================
    % ===== Calculates forbidden states ================
    % ==================================================
    nr_forbidden_aut1 = size(aut1.forbidden);
    nr_forbidden_aut2 = size(aut2.forbidden);
    forbidden = {};
    for i = 1:nr_forbidden_aut1(2)
        for j = 1:nr_forbidden_aut2(2)
            forbidden = [forbidden merge_state(aut1.forbidden{i}, aut2.forbidden{j})];
        end
    end


    % DETTA SKA INTE MED I RAPPORTKODEN
    % DETTA RENSAR VÅR AUTOMATA
    synched_states = reach(init, trans, {});
    % Only include transitions for which the source is within synched_states
    trans = filter_trans_by_source(trans, synched_states);
    % Remove marked states that isn't reachable
    marked = intersect(synched_states, marked);


    % This removes duplicate transitions
    s_trans = size(trans);
    removed = 0;
    i = 1; j = 1;
    while i <= s_trans(1)
        j = 1;
        while j <= s_trans(1)
            if isequal(trans(i,:),trans(j,:)) && (i==j) == 0
                s_trans(1) = s_trans(1) - 1;
                trans(i,:) = [];
            end 
            j = j + 1;
        end
            i = i + 1;
    end
    

    % ===================================
    % ====== Create new automata ========
    % ===================================
    aut1aut2 = create_automaton(...
        synched_states,...   % States
        init,...         % Initial state
        events,...   % Events (Alphabet)
        trans,... % Transitions (source, event, target)
        marked,...
        forbidden);
end