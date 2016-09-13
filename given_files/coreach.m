% ========================================================================
% ======== This function is working the the example given by lecture    
% ======== 12/9. Though it is noticed that it does not seem to work     
% ======== when multiple marked states are given or changed at all..   
% ========================================================================

function coreach_states = coreach(start_states, trans)
% coreach  Returns the coreachable (backward reachable) states of a transition set
coreach_states = reach(start_states, fliplr(trans));


% % Sorts the states that is reachable from through all transitions
% coreachable_states=filter_trans_by_target(trans, trans(:,3));
% 
% % Removes doubles, Adds all into an 1xX array and adds the initial state.
% coreach_states=unique([start_states reachable_states(:,1)' reachable_states(:,3)']);
