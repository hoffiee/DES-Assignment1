% SYNCH_EVENT_BASED
%
% - Seems to be working better than our STATE_BASED algorithm,
% it is performing slower and taking overall longer time to execute
%
% 3. function aut1aut2 = synch(aut1, aut2)
% Returns the synchronous composition of two automata

function aut1aut2 = synch(aut1, aut2)
    
    % Calculates initial state
    init = merge_state(aut1.init, aut2.init);
    synched_states={init};
    trans={};

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

    % Loop to handle each event
    nr_of_events = size(events);

    for e = 1:nr_of_events(2)
        
        current_trans_aut1 = filter_trans_by_events(aut1.trans, events(e));
        nr_in_aut1 = size(filter_trans_by_events(aut1.trans, events(e)));
        nr_in_aut2 = size(filter_trans_by_events(aut2.trans, events(e)));
        

        % This handles all events in aut 1 that is the same as events(e)
        for e_aut1 = 1:nr_in_aut1(1)

            current_trans_aut2 = filter_trans_by_events(aut2.trans, events(e));
            
            % This handles all events in aut 1 that is the same as events(e)
            for e_aut2 = 1:nr_in_aut2(1)
                    
                new_state = merge_state(current_trans_aut1{e_aut1,1}, current_trans_aut2{e_aut2,1});
                target_state = merge_state(current_trans_aut1{e_aut1,3}, current_trans_aut2{e_aut2,3});

                synched_states = unique([synched_states, new_state, target_state]);

                trans = add_tran(trans, new_state, events{e}, target_state);

            end
        end    
    end

    % ===================================================
    % ====== calculates marked states ===================
    % ===================================================
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
            forbidden = [forbidden merge_state(aut1.forbidden(i), aut2.forbidden(j))];
        end
    end

    % Final additions
    % Remove states that isn't rechable
    synched_states = reach(init, trans, {});
    % Only include transitions for which the source is within synched_states
    trans = filter_trans_by_source(trans, synched_states);
    % Remove marked states that isn't reachable
    marked = intersect(synched_states, marked);

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