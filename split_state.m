function [state1 state2] = split_state(state)
% Split states takes the synchronized state and splits it into 
% each automata state.
    s=size(state)

    state1 = state(1:round(s(2)/2)-1)
    state2 = state(round(s(2)/2)+1:end)