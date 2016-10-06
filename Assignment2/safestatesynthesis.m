function Q_s = safestatesynthesis(Q, events, events_u, trans, Q_m, Q_x) 
% This is based on algorithm 3 given in lecture notes.


k = 0;
X_0 = Q_x;
X_k={''};

% Keep on going untill X_k is equal to X_0
while 1 %~isequal(X_k,X_0)

	% increase the counter
	k = k + 1;

	% Display the current iteration
	disp(['itteration k = ' num2str(k)])

	Qp = coreach(events, trans, Q_m, X_0) % Controllable events
	Qpp = coreach(events_u, trans, setdiff(Q,Qp), {}) % uncontrollable events

	% Display both Qp and Qpp
	disp(['Qp = ' Qp])
	disp(['Qpp = ' Qpp])
	
	% Combine X_0 and Qpp to X_k
	X_k = union(X_0, Qpp);
	
	if isequal(X_0, X_k)
		break;
	end
	
	X_0 = X_k;
end

Q_s = setdiff(Q,X_k);