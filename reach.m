% 1. function reach_states = reach(start_states, trans)
% Returns the forward reachable states of a transition set


% ========================================================
% ======== This function seems to be working with the 
% ======== example that was given at lecture 12/9
% ======== TODO - Kommentera
% ========================================================

function reach_states = reach(start_states, trans)

while 1
    temp_states=start_states;
    found_trans = filter_trans_by_source(trans, start_states);
    start_states = unique([found_trans(:,1)' found_trans(:,3)']);
    
    
    % 
    if isequal(start_states,temp_states)
        break; 
    end
end

reach_states = start_states;
