function Q_s = safestatesynthesis(Q, events, events_u, trans, Q_m, Q_x) 
% function Q_s = safestatesynthesis(Q, Sigma, Sigma_u, delta, Q_m, Q_x) 
% Man kan ju lika gärna skicka in en automata



% There is a need to divide the transitions into
% controllable and uncontrollable events
% s_events = size(events);
% events_u = {};

% for i = 1:s_events(2)
% 	events{i};
% 	if sum(ismember(events{i},'!')) == 0

% 	else
% 		events_u = [events_u events{i}];
% 	end
% end

events_c = setdiff(events,events_u);
% events_u;

% Divide transitions into controllable and uncontrollable
trans_c = filter_trans_by_events(trans, events_c);
trans_u = filter_trans_by_events(trans, events_u);


% Development safety, prevent inf loop
count = 0;
times = 20;

% k = 0;
disp('X_0 = Q_x')
X_0 = Q_x;

X_k={''};
% ===========================================================
% ===== Kolla sida 100 i lecture notes för att 			=====
% ===== se metod för att ta bort uncontrollable states 	=====
% ===========================================================

while ~isequal(X_k,X_0)
	% Dev safety
	count = count +1;
	% k = k + 1;

	% is this including both controllable and uncontrollable, or only
	% controllable?
	Qp = coreach(events, trans, Q_m, X_0); % Controllable events
	Qpp = coreach(events_u, trans, setdiff(Q,Qp), {}); % uncontrollable events

	X_k = union(X_0, Qpp);
	% X_0 = X_k
 
	% if isequal(X_k,X_0)
	% 	disp('Safe state synthesis is complete')
	% 	break;
	% end


	% update X_0, the value X_k-2 is not needed, so just set X_0 = X_k-1
	% This is only needed if the loop is supposed to keep
	% on going
	X_0 = X_k;


	% Dev safety, prevents inf-looping.
	if count > times
		disp('prevented inf-loop')
		break
	end
end


disp('Safe state synthesis done')

Q_s = setdiff(Q,X_k);