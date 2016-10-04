% This function will clear transitions that leads 
%to states that is no longer in use
function S = clean_trans(S_0)




	% S_0.states = setdiff(S_0.states, Q_uc)

	% trans_to_remove = filter_trans_by_source(S_0.trans, Q_uc);
	% trans_to_remove = [trans_to_remove; filter_trans_by_target(S_0.trans, Q_uc)]

	% S_0.trans = setdiff(S_0.trans, trans_to_remove)


	% If transition source is not in S_0.states, remove it

	i = 1;
	s_trans = size(S_0.trans)
	s_states = size(S_0.states)
	trans = {}
    for i = 1:s_trans(1)
		source_exists = false;
		target_exists = false;

        for j = 1:s_states(2)
        	% disp(['source: ' S_0.states(i) 'S_0.trans: ' S_0.trans(i,:)])
            
        	% S_0.trans(i,:)
        	S_0.trans(i,:)
        	% filter_trans_by_source(S_0.trans, S_0.states(j))
        	disp(['Searching for source: ' S_0.trans(i,1)])
        	~isempty(intersect(S_0.states,S_0.trans(i,1)))
        	if ~isempty(intersect(S_0.states,S_0.trans(i,1)))
        		source_exists = true;
        	end
        	disp(['searching for target: ' S_0.trans(i,3)])
        	~isempty(intersect(S_0.states,S_0.trans(i,3)))
			if ~isempty(intersect(S_0.states,S_0.trans(i,3)))
				target_exists = true;
			end

        	% if ~isempty(filter_trans_by_source(S_0.trans(i,:), S_0.states(j)))
        	% 	disp(['found source: ' S_0.states(j)])
        	% 	source_exists = true
        	% 	break;
        	% end
        	% filter_trans_by_target(S_0.trans, S_0.states(j))
         %    if ~isempty(filter_trans_by_target(S_0.trans(i,:), S_0.states(j)))
        	% 	disp(['found target: ' S_0.states(j)])
        	% 	target_exists = true
        	% 	break;
        	% end 
        end

  %       if source_exists && target_exists
  %       	s_trans(1) = s_trans(1) - 1;
  %           S_0.trans(i,:) = [];
		% else
		% 	i = i + 1;
		% end

		if source_exists && target_exists
			disp(['added: ' S_0.trans(i,:)])
			trans = [trans; S_0.trans(i,:)]
		end


		% i = i +1;
    end

    S_0.trans = trans;


	% S_0.trans

	% s_trans = size(S_0.trans)
	% s_trans_remove = size(trans_to_remove)
 %    % removed = 0;
 %    i = 1;
 %    while i <= s_trans(1)
 %    	remove = false;
 %        for j = 1:s_trans_remove(1)
 %        	disp(['rem trans: ' trans_to_remove(j,:) 'S_0.trans: ' S_0.trans(i,:)])
 %            if isequal(S_0.trans(i,:),trans_to_remove(j,:)) 
 %                remove = true
 %                break;
 %            end 
 %        end

 %        if remove
 %        	s_trans(1) = s_trans(1) - 1;
 %            S_0.trans(i,:) = [];
	% 	else
	% 		i = i + 1;
	% 	end

 %    end

 	S = S_0;

	end