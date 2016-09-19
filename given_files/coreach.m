% ========================================================================
% ======== This function seems to be working with multiple marked states
% ======== with example given at lecture 12/9, This does not work properly
% ======== with some examples of marked states, for example q9
% ========================================================================

function coreach_states = coreach(start_states, trans, forbidden_states)
% coreach  Returns the coreachable (backward reachable) states of a transition set
coreach_states = reach(start_states, fliplr(trans),forbidden_states);