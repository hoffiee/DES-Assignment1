% H?r i implementerar vi synch

% 3. function aut1aut2 = synch(aut1, aut2)
% Returns the synchronous composition of two automata

function aut1aut2= synch(aut1, aut2)
    aut1aut2.states = cross(aut1.states,aut2.states)
