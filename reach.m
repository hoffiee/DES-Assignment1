% 1. function reach_states = reach(start_states, trans, forbidden_states)
% Returns the forward reachable states of a transition set

% ========================================================
% ======== This function seems to be working with the 
% ======== example that was given at lecture 12/9
% ======== TODO - Comment and structure code
% ========================================================

function reach_states = reach(start_states, trans, forbidden_states)

    % During our first iteration, we want our new_states
    % to be equal the start states
    new_states = setdiff(start_states, forbidden_states);
    while 1

        % Filter through all transitions by source. 
        found_trans = filter_trans_by_source(trans, new_states);
        
        % Only find new states, this is to minimize the calculations
        % needed for bigger automatas, setdiff was needed to prevent inf loop
        % at for example automata A from example with synched automatas from lecture
        new_states = setdiff(setdiff(unique([found_trans(:,3)']),start_states),forbidden_states);

        % Combines old states with the new
        start_states = unique([start_states new_states]);
        
        % Check if new_states is empty, then
        % abort! this might require fewer calculations and is therefore
        % quicker
        if isempty(new_states)
        	break;
        end

    end
    
    reach_states = start_states;
end