	% =======================================
	% ===== clean_trans gör samma sak	=====
	% =======================================
	% Q_uc

	% S_0.states = setdiff(S_0.states, Q_uc)

	% trans_to_remove = filter_trans_by_source(S_0.trans, Q_uc);
	% trans_to_remove = [trans_to_remove; filter_trans_by_target(S_0.trans, Q_uc)]

	% % S_0.trans = setdiff(S_0.trans, trans_to_remove)

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
