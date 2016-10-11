clear all, clf, close all, clc, format compact


% given constants
h = 0.02; 			% Sampling period
r_1 = 90; 			% 90km/h during first half
r_2 = 0; 			% 0km/h during second half
T = [1 2 3 4];		% Create T_i vector
a = [exp(-h./T)]; 	% time constants vector
t_tot = 30;			% total simulation time, 30s
t = 0:h:t_tot;		% vector with total time

% Number of samples per element in [r_1, ...] vector
r = rectpulse([r_1 r_2], t_tot/h/2); 	
										
v = 0; 		% initial speed
current_state = 1; 	% Set current state to initial state

% Loop through the total number of samples
for i = 1:t_tot / h
	
	% If in q2, and speed is below 10km/h, trans into q1
	if current_state == 2 && v(i) <= 10									
		current_state = 1;

	% If in q1 and speed exceeds 30 OR in q3 and speed is below 30, trans into q2
	elseif (current_state == 1 && v(i) >= 30) || (current_state == 3 && v(i) <= 30)	
		current_state = 2;
	
	% if in q2 and speed exceeds 50 OR in q4 and speed is below 50, trans into q3
	elseif (current_state == 2 && v(i) >= 50) || (current_state == 4 && v(i) <= 50) 	
		current_state = 3;

	% if in q3 and speed exceeds 70, trans into q4
	elseif current_state == 3 && v(i) >= 70								
		current_state = 4;
	end
	% If none of the cases is true it will stay in the current state


	% Calculate the next value for the given state
	v(i+1) = a(current_state)*v(i)+(1-a(current_state))*r(i);

	% set the current state as gear level
	q(i) = current_state;
end

% Add one last element to the gear indicator so the size of both vectors is equal
q(end+1) = current_state;


figure(1)
plot(t,v)
axis([t(1) t(end) 0 95])
hold on
xlabel('time [s]')
ylabel('velocity [km/h]')
print -depsc velocity

figure(2)
plot(t,q)
axis([t(1) t(end) 0 4.5])
xlabel('time [s]')
ylabel('gear level')
print -depsc gear



