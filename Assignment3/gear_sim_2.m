clear all, clf, close all, clc, format compact



% Given constants
h = 0.02; 		% Sampling period
r_1 = 90; 		% 90km/h during first half
r_2 = 0; 		% 0km/h during second half
T = [1 2 3 4];
a = [exp(-h./T)]; 	% Different time constants 
t_tot = 30;		% total simulation time, 30s
t = 0:h:t_tot;	% vector with time


r = rectpulse([r_1 r_2], t_tot/h/2); 	% Number of samples per element in [r_1, ...] vector
										
v = 0; 		% initial speed
cs = 1; 	% Set current state to initial state


% for i = 1:t_tot / h
	
% 	if cs == 1 && v(i) >= 30 		% If in state 1, only transition if v exceeds 30km/h
% 		cs = 2
% 	elseif (cs == 2 && v(i) >= 50 
% 		cs = 3
% 	elseif cs == 2 && v(i) <= 10
% 		cs = 1
% 	elseif cs == 3 && v(i) >= 70
% 		cs = 4
% 	elseif cs == 3 && v(i) <= 30
% 		cs = 2
% 	elseif cs == 4 && v(i) <= 50
% 		cs = 3
% 	end
		
% 	v(i+1) = a(cs)*v(i)+(1-a(cs))*r(i);
% 	q(i+1) = cs;

% end


for i = 1:t_tot / h
	
	% If in q2, and speed is below 10km/h, trans into q1
	if cs == 2 && v(i) <= 10									
		cs = 1;

	% If in q1 and speed exceeds 30 OR in q3 and speed is below 30, trans into q2
	elseif (cs == 1 && v(i) >= 30) || (cs == 3 && v(i) <= 30)	
		cs = 2;
	
	% if in q2 and speed exceeds 50 OR in q4 and speed is below 50, trans into q3
	elseif (cs == 2 && v(i) >= 50) || (cs == 4 && v(i) <= 50) 	
		cs = 3;

	% if in q3 and speed exceeds 70, trans into q4
	elseif cs == 3 && v(i) >= 70								
		cs = 4;
	end
	% If none of the cases is true it will stay in the current state


	% Calculate the next value for the given state
	v(i+1) = a(cs)*v(i)+(1-a(cs))*r(i);

	% set the current state as gear level
	q(i) = cs;
end

% Add one last element to the gear indicator so the size of both vectors is equal
q(end+1) = cs;


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



