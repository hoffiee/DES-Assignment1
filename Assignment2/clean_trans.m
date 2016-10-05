% This function will clear transitions that leads 
% to states that is no longer in use.
% If the trans got both a source and target state that is in
% the set of Q, the transition is valid.


function S = clean_trans(S_0)

	s_trans = size(S_0.trans);
	s_states = size(S_0.states);
	trans = {};
    for i = 1:s_trans(1)
		source_exists = false;
		target_exists = false;

        for j = 1:s_states(2)        	
        	if ~isempty(intersect(S_0.states,S_0.trans(i,1)))
        		source_exists = true;
        	end
			if ~isempty(intersect(S_0.states,S_0.trans(i,3)))
				target_exists = true;
			end
        end

		if source_exists && target_exists
			trans = [trans; S_0.trans(i,:)];
		end

    end

    S_0.trans = trans;
 	S = S_0;
 	
end