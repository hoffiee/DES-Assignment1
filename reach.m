% 1. function reach_states = reach(start_states, trans, forbidden_states)
% Returns the forward reachable states of a transition set

% ========================================================
% ======== This function seems to be working with the 
% ======== example that was given at lecture 12/9
% ======== TODO - Comment and structure code
% ======== TODO - Test if unique is unnecessary in start_states = uniq...
% ========================================================

function reach_states = reach(start_states, trans, forbidden_states)

    % During our first iteration, we want our new_states
    % to be equal the start states
    new_states = setdiff(start_states, forbidden_states);

    % We want to do this until all reachable is found, therefore
    % this loop is breaked with a if case after all calculations
    while 1

        % Find the transitions that we can do from our current states 
        found_trans = filter_trans_by_source(trans, new_states);
        
        % Take all unique targets that was found, remove the states that we already
        % had to lower the number of calculations. Then remove forbidden states
        new_states = setdiff(setdiff(unique([found_trans(:,3)']),start_states),forbidden_states);

        % Add the new states to the ones we already had. Unique may be
        % unnecessary in this step.
        start_states = unique([start_states new_states]);
        
        % Check if new_states is empty, then no new states was found
        % and therefore it is assumed that we have found all available
        % states
        if isempty(new_states)
        	break;
        end
    end
    reach_states = start_states;
end