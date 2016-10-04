% had to build a new Reachability, it seems that my old one
% cant be limited to selected events...


function Qr = reachability(Sigma, trans, Q_init, Q_x) 
k = 0;
Q_0 = setdiff(Q_0,Q_x);





while 1

	filter_trans_by_events(trans, Sigma)
	filter_trans_by_source(trans, Q_0)


	new_states = 
	Q_k = setdiff(union(Q_0, new_states), Q_x)
end

Qk :=Qk−1 ∪{q+|∃q∈Qk−1 ∧∃σ∈Σ∧δ(q,σ)=q+} \ Qx
until Qk = Qk−1 return Qk