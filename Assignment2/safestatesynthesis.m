function Q_s = safestatesynthesis(Q, events, events_u, trans, Q_m, Q_x) 

k = 0;

X_0 = Q_x;

X_k={''};

while ~isequal(X_k,X_0)
	k = k + 1;
	disp(['itteration k = ' num2str(k)])

	% is this including both controllable and uncontrollable, or only
	% controllable?
	Qp = coreach(events, trans, Q_m, X_0) % Controllable events
	Qpp = coreach(events_u, trans, setdiff(Q,Qp), {}) % uncontrollable events

	disp(['Qp = ' Qp])
	disp(['Qpp = ' Qpp])
	
	X_k = union(X_0, Qpp);
	
	X_0 = X_k;

end

Q_s = setdiff(Q,X_k);