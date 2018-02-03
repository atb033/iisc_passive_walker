clc
clear all
close all
format long

%% Initializing Variables
M = 1000; m = 1.0; I = 0.00; l = 1.0; w = 0.0; 
c = 1.0;  r = 0.0; d = 0.00; g = 1.0; gam = 0.01; 

steps=5;

DIM = [M m c I g l w r d gam];

q10=.2; u10=-.2;
q20=pi; u20=0;
q30=.4; u30=-.4;
q40=pi; u40=0;

z0=[q10 u10 q20 u20 q30 u30 q40 u40];


%% Root finding, Period one giat
options = optimset('TolFun',1e-6,'TolX',1e-6,'Display','off');
[zstar,fval,exitflag,output,jacob] = fsolve(@fixedpt,z0,options,DIM);
if exitflag == 1
    disp('Fixed points are');
    zstar
else
    error('Root finder not converged, change guess or change system parameters')
end

%% Stability Analysis

J=partialder(@onestep,zstar,DIM);
disp('EigenValues for linearized map are');
Eigen = eig(J)
flag11 = 0;
for i = 1:length(Eigen)
if norm(Eigen) > 1
    display('The walker is unstable');
    flag11 = 1;
    break;
end
end
if flag11 == 0
    display('The walker is stable');
end
%% Plotting 
[z,t]=onestep(zstar,DIM,steps);

q1 = z(:,1);
q2 = z(:,3); 
q3 = z(:,5);
q4 = z(:,7);


%Plotting
figure(1);
axis([-2 2 -2 2]);

for i=1:length(t)

xh=l*sin(q1(i)+q2(i))-d*sin(q1(i))-r*q1(i);
yh=-l*cos(q1(i)+q2(i))+d*cos(q1(i))+r;
xa1=xh-sin(q1(i)+q2(i));
ya1=yh+cos(q1(i)+q2(i));

xa2=xh+l*sin(q3(i)-q1(i)-q2(i));
ya2=yh+l*cos(q3(i)-q1(i)-q2(i));
figure(1)
plot([xh xa1],[yh ya1]);%plots the right half of the walker
hold on;
plot([xh xa2],[yh ya2]);% plots the left half
plot([xh-1 xh+1],[0 0],'black')%plots the ground line
%plot(xh,yh,'ko-','LineWidth',3)

axis([xh-1 xh+1 -1 1.5]);
axis off;
hold off;
end

figure(2)
hold on
plot(t,q1,'r');
plot(t,q3,'b');
xlabel('Time (s)');
ylabel('Angle (rad)');
legend('Stance Angle','Swing Angle')
hold off