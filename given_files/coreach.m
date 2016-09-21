% =========================================================
% ======== This implementation seems to be working 
% ======== with the  implementation of reach.m
% =========================================================
function coreach_states = coreach(start_states, trans, forbidden_states)
% coreach  Returns the coreachable states of a transition set
coreach_states = reach(start_states, fliplr(trans),forbidden_states);