function coreach_states = coreach(start_states, trans, forbidden_states)
% coreach utilizes the same algorithm as reach.m, though it sends the marked
% states as start_states, and it searches from target instead of source.
coreach_states = reach(start_states, fliplr(trans),forbidden_states);