% 1. function reach_states = reach(start_states, trans)
% Returns the forward reachable states of a transition set


% ========================================================
% ======== This function seems to be working with the 
% ======== example that was given at lecture 12/9
% ========================================================

function reach_states = reach(start_states, trans)

% Sorts the states that is reachable from through all transitions
reachable_states = filter_trans_by_source(trans, trans(:,3));

% Filters out transitions that is reachable from the init/marked states
states_start = filter_trans_by_source(trans, start_states);

% Removes doubles, Adds all into an 1xX array and adds the initial state.
reach_states=unique([states_start(:,1)' states_start(:,3)'  reachable_states(:,1)' reachable_states(:,3)']);




