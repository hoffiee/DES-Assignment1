% This function detects uncontrollable states and 
% adds them to forbidden states
function S = uncontrollable(S_0, P, Sp, Sigma_u)

	% Clears the uncontrollable states
	Q_uc = {};


	% Get all uncontrollable transitions for plant P
	P_trans_uc = filter_trans_by_events(P.trans, Sigma_u);

	% Get all uncontrollable transitions for S
	S_trans_uc = filter_trans_by_events(Sp.trans,Sigma_u);


	% get the number of states
	s_state = size(S_0.states);

	% Get the number of uncontrollable trans for P
	s_i_p = size(P_trans_uc(:,1));

	% Get the number of uncontrollable trans for Sp
	s_i_s = size(S_trans_uc(:,1));

	% Loop through all states
	for i = 1:s_state(2)
		
		% reset counters 
		nr_of_unc_trans_p = 0;
		nr_of_unc_trans_s = 0;

		% Loop through all possible states
		for i_p = 1:s_i_p(1)
			% See if P state exists in P unctrollable transitions
			if ~isempty(strfind(S_0.states{i}, [P_trans_uc{i_p,1} '.']))
				% If it exists, increase the counter
				nr_of_unc_trans_p = nr_of_unc_trans_p + 1;
			end
		end

		for i_s = 1:s_i_s(1)
			% See if S state exists in S uncontrollable transitions
			if ~isempty(strfind(S_0.states{i}, ['.' S_trans_uc{i_s,1}]))
				% if so, increase the counter
				nr_of_unc_trans_s = nr_of_unc_trans_s + 1;
			end
		end
		% If any p uncontrollable transitions were found and no unc trans in S was found, then the 
		% state is uncontrollable.
		if (nr_of_unc_trans_p > 0) && (nr_of_unc_trans_s == 0)
			% Add the current state to the uncontrollable states
			Q_uc = [Q_uc S_0.states{i}];
		end
	end

	% Adds it all to the automatas forbidden states.
    S_0.forbidden = union(S_0.forbidden, Q_uc);

    S = S_0;

end