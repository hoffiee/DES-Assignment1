function Q_k = reach(Sigma, delta, Q_0, Q_x)

k = 0;
Q_0 = setdiff(Q_0,Q_x)
while 1

	k = k+1;


	if isequal(Q_k = Q_0)
		break
	end

end


end
% Algorithm 1. Reachability(Σ, δ, Q0, Qx)
% letk:=0,
% Q0 :=Q0 \Qx 
% repeat
% k := k + 1
% Qk :=Qk−1 ∪{q+|∃q∈Qk−1 ∧∃σ∈Σ∧δ(q,σ)=q+} \ Qx
% until Qk = Qk−1



