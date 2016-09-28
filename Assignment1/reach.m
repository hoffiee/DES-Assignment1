function reach_states = reach(start_states, trans, forbidden_states)

    % Start looking at the initial states, remove state if it is
    % forbidden
    new_states = setdiff(start_states, forbidden_states);

    % We want to do this until all reachable are found, therefore
    % this loop is breaked with an if case after all calculations
    while 1

        % Find the transitions that we reach from our current states 
        found_trans = filter_trans_by_source(trans, new_states);
        
        % Take all unique targets that was found, remove the states that we already
        % had, then remove forbidden states
        new_states = setdiff(setdiff(unique([found_trans(:,3)']),start_states),forbidden_states);

        % Add the new states to the ones we already had. Unique is used to sort 
        start_states = unique([start_states new_states]);
        
        % Check if new_states is empty, then no new states was found
        % and therefore it is assumed that we have found all reachable
        % states
        if isempty(new_states)
        	break;
        end
    end
    reach_states = start_states;
end