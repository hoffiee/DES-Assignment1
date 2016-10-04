function S = supervisor(P,Sp,Sigma_u)
% P = given plant
% Sp = specification
% Sigma_u = set of uncontrollable events 
%
% Use the given to generate a nonblocking 
% and controllable supervisor S
%

% It is assumed that Sigma_Sp is a subset of Sigma_P where
% Sigma_P and Sigma_Sp are the event sets of the plant P 
% and the specification Sp. Supervisor is generated by 
% implementing Algorithm 2 and Algorithm 3 in the lecture
% notes.


	S_0 = synch(P, Sp)
	S_0_check = S_0
	S_0.trans

	S_temp = S_0;
	count = 0;
	while 1
		count = count + 1;

		S_0 = uncontrollable(S_0,P,Sp,Sigma_u)
		if compare_automata(S_0,S_temp)
			break;
		end

		S_temp = S_0;
		if count > 10
			
			disp('prevented inf loop')
			disp('prevented inf loop')		

			break;
		end
	end


	Q_ex = coreach(Sigma_u, S_0.trans, S_0.forbidden, {})
	S_0.states = setdiff(S_0.states, Q_ex)


	S_temp = S_0;
	count = 0;
	while 1
		count = count + 1;

		 S_0.states = safestatesynthesis(S_0.states, S_0.events, Sigma_u, S_0.trans, S_0.marked, S_0.forbidden);
		if compare_automata(S_0,S_temp)
			disp('No more safestatesynthesis is needed')
			break;
		end


		S_temp = S_0;
		if count > 10
			
			disp('prevented inf loop')
			disp('prevented inf loop')
			

			break;
		end
	end
   
	


    S = clean_trans(S_0);


end