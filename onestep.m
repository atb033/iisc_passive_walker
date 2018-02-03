function [z,t]=onestep(z0,GL_DIM,steps)

M = GL_DIM(1);  m = GL_DIM(2); c = GL_DIM(3);   
I = GL_DIM(4);  g = GL_DIM(5); l = GL_DIM(6);   
w = GL_DIM(7);  r = GL_DIM(8); d = GL_DIM(9);   
gam = GL_DIM(10);

flag = 1;
if nargin<2
    error('need more inputs to onestep');
elseif nargin<3
    flag = 0; %send only last state
    steps = 1;
end

t0 = 0; 
dt = 5;
t_ode = t0;
z_ode = z0;

for i=1:steps
    options=odeset('abstol',2.25*1e-14,'reltol',2.25*1e-14,'events',@collision);
    tspan = linspace(t0,t0+dt,100);
    [t_temp, z_temp, tfinal] = ode113(@dynamics,tspan,z0,options,GL_DIM);

    zplus=Jumpmap(t_temp(end),z_temp(end,:),GL_DIM);
    
    z0 = zplus;
    t0 = t_temp(end);
    
    %%% dont include the first point
    t_ode = [t_ode; t_temp(2:end); t0];
    z_ode = [z_ode; z_temp(2:end,:); z0];
    
end

z = [zplus(1:2) pi 0 zplus(5:6) pi 0];

if flag==1
   z=z_ode;
   t=t_ode;
end