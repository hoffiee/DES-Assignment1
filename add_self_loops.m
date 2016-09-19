function new_aut = add_self_loops(aut, missing_alphabet)
    
    % If there are no events that isnt included in 
    % aut1, then do nothing, else add self loops

    

    if isempty(missing_alphabet) == 0
        nr_of_states = size(aut.states);
        for i = 1:nr_of_states(2)
        	s_alphabet = size(missing_alphabet);
            for j = 1:s_alphabet(2)
                aut.trans=[aut.trans; {aut.states{i}, missing_alphabet{j} ,aut.states{i}}];
            end
        end   	
    end 
    new_aut = aut;
end