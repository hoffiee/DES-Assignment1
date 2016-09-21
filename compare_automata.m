function output = compare_automata(aut1, aut2)
% filter_trans_by_source  Returns transitions with given source states
    
	output = 1;

	% check states
	if isempty([setdiff(aut1.states,aut2.states) setdiff(aut2.states,aut1.states)])
		% disp('States is equal')
	else
		aut1.states
		aut2.states
		output = 0;
	end

	% check init
	if isequal(aut1.init, aut2.init)
		% disp('equal init state')
	else
		aut1.init
		aut2.init
		output = 0;
	end

	% check events
	if isempty([setdiff(aut1.events, aut2.events) setdiff(aut2.events, aut1.events)])
		% disp('they share the same events')
	else
		aut1.events
		aut2.events
		output = 0;
	end

	% check trans
	if isempty([setdiff(aut1.trans, aut2.trans) setdiff(aut2.trans, aut1.trans)])
		% disp('they share the same transitions')
	else
		disp('trans is not equal')
		disp('aut1.trans')
		aut1.trans
		disp('aut1.trans')
		aut2.trans
		output = 0;
	end

	% check marked
	% [setdiff(aut1.marked, aut2.marked) setdiff(aut2.marked, aut1.marked)]
	if isempty([setdiff(aut1.marked, aut2.marked) setdiff(aut2.marked, aut1.marked)])
		% disp('they share the same events')
	else
		disp('Marked states is not equal')
		disp('aut1.marked')
		aut1.marked
		disp('aut2.marked')
		aut2.marked
		output = 0;
	end

	% check forbidden
	if isempty([setdiff(aut1.forbidden, aut2.forbidden) setdiff(aut2.forbidden, aut1.forbidden)])
		% disp('they share the same forbidden states')
	else
		disp('forbidden states is not equal')
		disp('aut1.forbidden')
		aut1.forbidden
		disp('aut2.forbidden')
		aut2.forbidden
		output = 0;
	end


