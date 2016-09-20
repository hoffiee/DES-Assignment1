% This is not done!
%
% * \forbidden states
% * FUNGERAR INTE NÄR MAN KÖR FLERA SYNCHS I RAD!!
% * Behöver modifieras inför det. Tror att det går att
% köra via events istället för att utgå från states
% * Kolla så inte unique förstör fler saker.

% 3. function aut1aut2 = synch(aut1, aut2)
% Returns the synchronous composition of two automata

function aut1aut2 = synch(aut1, aut2)
    
    % % ===============================
    % % ====== Calculates states ======
    % % ===============================
    % saut1 = size(aut1.states);
    % saut2 = size(aut2.states);
    % states = {};
    % for i = 1:saut1(2)
    %     for j = 1:saut2(2)
    %         states = [states merge_state(aut1.states{i}, aut2.states{j})];
    %     end
    % end

    % Hurrdurr för att kunna köra.
    states={};


    % ===============================
    % ====== calculates alphabet ==== - Seems to be working as intended
    % ===============================
    % This is an case thing, 

    % Check if its enough with isequal, if not it is needed to implement
    % setdiff on two cases and the result need to be empty 
    
    % =================================
    % ====== Initial calculations =====
    % =================================


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


    %======================================================
    %===== KODEN FRÅN REACH ===============================
    %===== Assumed to be working, verification needed =====
    %======================================================

    % new_states = setdiff(start_states, forbidden_states); - skit i forbidden just nu
    init = merge_state(aut1.init, aut2.init);
    trans={};
    synched_states= {init};
    current_state = {init};
    % new_states={};
    

    % ==============================================
    % ===== SAFETY DURING DEVELOPMENT - REMOVE =====
    % ==============================================
    count = 1;
    % ==============================================
    % ===== SAFETY DURING DEVELOPMENT - REMOVE =====
    % ==============================================


    while 1


        % ==============================================
        % ===== SAFETY DURING DEVELOPMENT - REMOVE =====
        % ==============================================
        count = count +1;
        % ==============================================
        % ===== SAFETY DURING DEVELOPMENT - REMOVE =====
        % ==============================================



        % This is used to compare if no new transitions 
        % or states was found during last iteration
        temp_states = current_state;

        % This is not used?
        % synched_states = current_state

        % Calculates how many states that needs to
        % be checked, same principle as in reach.m
        nr_of_states = size(current_state);



        % Sets new_states to empty so that it wont
        % get any problems with iterations from before
        new_states={};


        % This is the 1st loop, it handles the amount of
        % states that is going to be checked
        for i = 1:nr_of_states(2)

            % Splits the synched state into substates aut1 and aut2
            [s1 s2] = split_state(current_state{i});

            % Filter out which events that occur in substates aut1 and aut2
            events_in_s1 = filter_trans_by_source(aut1.trans, s1);
            events_in_s2 = filter_trans_by_source(aut2.trans, s2);

            % Checks which events that is supposed to 
            common_events = intersect(events_in_s1(:,2), events_in_s2(:,2));

            s_common_events = size(common_events);

            % Hanterar antalet gemensamma events
            for j = 1: s_common_events(1)
                new_states_aut1 = filter_trans_by_events(events_in_s1,common_events(j));
                new_states_aut2 = filter_trans_by_events(events_in_s2,common_events(j));

                
                % Loop som hanterar nya states i aut1                
                s_new_states_aut1 = size(new_states_aut1);
                for k = 1:s_new_states_aut1(1)
                    % Loop som hanterar nya states i aut2
                    s_new_states_aut2 = size(new_states_aut2);
                    for l = 1:s_new_states_aut2(1)
                        trans = add_tran(trans, current_state{i}, common_events{j}, merge_state(new_states_aut1{1,3},new_states_aut2{1,3}));
                        new_states = unique([new_states merge_state(new_states_aut1{1,3},new_states_aut2{1,3})]);
                    end

                end
                
            end

        end


        current_state = unique(setdiff(new_states, synched_states));
        synched_states = unique([synched_states, new_states]);
        if isempty(current_state)
            break; 
        end
        % disp(['iteration: ' int2str(count)]);
        


        % ==============================================
        % ===== SAFETY DURING DEVELOPMENT - REMOVE =====
        % ==============================================
        if count == 10
            break;
        end
        % ==============================================
        % ===== SAFETY DURING DEVELOPMENT - REMOVE =====
        % ==============================================

          
        % % disp('Common_events for both automatas')
        % common_events = intersect(events_in_s1(:,2), events_in_s2(:,2))
        % % disp('size common events')
        % s_common_events = size(common_events)


        % Filter through all transitions by source. 
        % found_trans_1 = filter_trans_by_source(aut.1, new_states);
        
        % Only find new states, this is to minimize the calculations
        % needed for bigger automatas, setdiff was needed to prevent inf loop
        % at for example automata A from example with synched automatas from lecture
        % new_states = setdiff(setdiff(unique([found_trans(:,3)']),start_states),forbidden_states);

        % Combines old states with the new
        % start_states = unique([start_states new_states]);
        
        % If start_states is equal to temp_states that was set
        % in the beginning of the iteration, then there was
        % no transitions which gave new states, which means that
        % all reachable states are found.
        

        % Alternative: Check if new_states is empty, then
        % abort! this might require fewer calculations and is therefore
        % quicker
        % if 1%isempty(new_states)
        %     break;
        % end

        % There was no notable difference during the example
        % this could be due to the example being a small
        % automata.
    end


    %     if current_state == last_state
    %         disp('Found them all')
    %             break;
    %     end

    %     last_state = current_state;
    %     current_state = filter_trans_by_events(trans, s_common_events)
    % end

    % ===============================
    % ====== calculates init ========
    % ===============================
    % This is done directly in the creation of the automata
    
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