function coreach_states = coreach(Sigma, trans, start_states, forbidden_states)
% coreach utilizes the same algorithm as reach.m, though it sends the marked
% states as start_states, and it searches from target instead of source.
coreach_states = reach(Sigma, fliplr(trans), start_states, forbidden_states);