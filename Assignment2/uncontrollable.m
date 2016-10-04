% This function detects uncontrollable states and 
% adds them to forbidden states
function S = uncontrollable(S_0, P, Sp, Sigma_u)


	% disp('remove blocking states')
	% S_0.forbidden = [S_0.forbidden Q_uc]
	% S_0.states = coreach(S_0.marked, S_0.trans, S_0.forbidden)

	Q_uc = {};

	s_events = size(S_0.events);
	events_u = {};


	% % This creates the events_u and searches all events
	% % for events that are uncontrollable
	% for i = 1:s_events(2)
	%     S_0.events{i};
	%     if sum(ismember(S_0.events{i},'!')) == 0

	%     else
	%         events_u = [events_u S_0.events{i}];
	%     end
	% end


	events_c = setdiff(S_0.events, Sigma_u);
	% events_u;

	% Divide transitions into controllable and uncontrollable
	trans_c = filter_trans_by_events(S_0.trans, events_c);
	trans_u = filter_trans_by_events(S_0.trans, Sigma_u);

	% disp('Sigma_u, Sp.events')
	first_term = intersect(Sigma_u, Sp.events);
	% disp('P.trans, Sigma_u')
	second_term = filter_trans_by_events(P.trans, Sigma_u);
	% disp('Sp.trans, Sigma_u')
	third_term = filter_trans_by_events(Sp.trans,Sigma_u);

	states_u = filter_trans_by_events(S_0.trans, Sigma_u);
	states_u(:,1);

	% PROBLEM: If the state names is the same or includes
	% parts that is the same, example p3 and Sp3, p3 will be found twice
	% if 'p3.Sp3' is used
	s_state = size(S_0.states);
	s_i_p = size(second_term(:,1));
	s_i_sp = size(third_term(:,1));

	for i = 1:s_state(2)
		
		nr_of_second = 0;
		nr_of_third = 0;
		for i_p = 1:s_i_p(1)
			if ~isempty(strfind(S_0.states{i}, [second_term{i_p,1} '.']))
				nr_of_second = nr_of_second + 1;
			end
		end

		
		for i_sp = 1:s_i_sp(1)
			if ~isempty(strfind(S_0.states{i}, ['.' third_term{i_sp,1}]))
				nr_of_third = nr_of_third + 1;
			end
		end

		% debugging
		% disp(['states: ' S_0.states{i} ',  nr_of_second: ' num2str(nr_of_second) ', nr_of_third: ' num2str(nr_of_third)])

		if (nr_of_second > 0) && (nr_of_third == 0)
			Q_uc = [Q_uc S_0.states{i}];
		end
	end

	% disp(['Forbidden: ' S_0.forbidden ' Q_uc: ' Q_uc])
	

    S_0.forbidden = union(S_0.forbidden, Q_uc);

    disp('All uncontrollable set')

    S = S_0;

end