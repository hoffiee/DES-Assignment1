function Q_s = safestatesynthesis(Q, events, trans, Q_m, Q_x) 
% function Q_s = safestatesynthesis(Q, Sigma, Sigma_u, delta, Q_m, Q_x) 
% Man kan ju lika gärna skicka in en automata

k = 0;
X_0 = Q_x;

% There is a need to divide the transitions into
% controllable and uncontrollable events
s_events = size(events);
events_u = {};

for i = 1:s_events(2)
	events{i};
	if sum(ismember(events{i},'!')) == 0

	else
		events_u = [events_u events{i}];
	end
end

events_c = setdiff(events,events_u)
events_u
% Development safety, prevent inf loop
count = 0;
times = 10;

% Dela upp transitions i controllable / uncontrollable.


while 1 
	% Dev safety
	count = count +1;
	k = k + 1;

	Qp = coreach(Q_m, trans, X_0) % Controllable events
	Qpp = coreach(setdiff(Q,Qp), trans, {}) % uncontrollable events

	X_k = union(X_0, Qpp)
	X_0 = X_k

 
	if isequal(X_k,X_0)
		disp('Both are equal')
		break;
	end

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

Q_s = setdiff(Q,X_k)