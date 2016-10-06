function S = supervisor(P,Sp,Sigma_u)
% P = given plant
% Sp = specification
% Sigma_u = set of uncontrollable events 
%
	% First synchronize the plant with the specification
	S_0 = synch(P, Sp);

	% Find uncontrollable 
	S_0 = uncontrollable(S_0,P,Sp,Sigma_u);

	% Find extended uncontrollable and adds them to forbidden
	% Q_ex = coreach(Sigma_u, S_0.trans, S_0.forbidden, {});
	% S_0.forbidden = unique([S_0.forbidden Q_ex]);

	% Safe state synthesis 
	S_0.states = safestatesynthesis(S_0.states, S_0.events, Sigma_u, S_0.trans, S_0.marked, S_0.forbidden);		

	% This removes transitions that isn't used at all or that 
	% leads to or from an non existing state
    S = clean_trans(S_0);

end