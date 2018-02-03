function [gstop, isterminal,direction]=collision(t,z,DIM)

M = DIM(1);  m = DIM(2); c = DIM(3);   
I = DIM(4);  g = DIM(5); l = DIM(6);   
w = DIM(7);  r = DIM(8); d = DIM(9);   
gam = DIM(10);   

q1 = z(1); q2 = z(3); 
q3 = z(5); q4 = z(7); 

gstop = -l*cos(q1+q2)+d*cos(q1)+l*cos(-q3+q1+q2)-d*cos(q1+q2-q3-q4);
if (q3>-0.05) %no collision detection for foot scuffing
    isterminal = 0;
else
    isterminal=1; %Ode should terminate is conveyed by 1, if you put 0 it goes till the final time u specify
end
direction=-1; % The t_final can be approached by any direction is indicated by this