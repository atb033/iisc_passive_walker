function zdot = dynamics(t,z,GL_DIM);

q1=z(1);
u1=z(2);
q2=z(3);
u2=z(4);
q3=z(5);
u3=z(6);
q4=z(7);
u4=z(8);

Ta=0;
Th=0;
Thip=0;

M = GL_DIM(1);  m = GL_DIM(2); c = GL_DIM(3);   
I = GL_DIM(4);  g = GL_DIM(5); l = GL_DIM(6);   
w = GL_DIM(7);  r = GL_DIM(8); d = GL_DIM(9);   
gam = GL_DIM(10);                                       

M11 = 2*M*d*l*cos(q2)-2*I-2*m*l^2-2*m*w^2-2*m*d*c*cos(-q3+q2)+2*m*d*w*sin(-q3+q2)+2*m*l*c*cos(q3)+2*m*l*w*sin(q3)-M*r^2-2*m*r^2-M*l^2-M*d^2-2*m*d^2+2*m*l*c-2*m*r*c*cos(-q3+q1+q2)+2*m*r*w*sin(-q3+q1+q2)-4*m*r*d*cos(q1)+4*m*r*l*cos(q1+q2)-2*m*r*c*cos(q1+q2)+2*m*r*w*sin(q1+q2)-2*M*r*d*cos(q1)+2*M*r*l*cos(q1+q2)+4*m*d*l*cos(q2)-2*m*d*c*cos(q2)+2*m*d*w*sin(q2)-2*m*c^2; 
M13 = I+m*r*c*cos(-q3+q1+q2)-m*d*w*sin(-q3+q2)-m*l*w*sin(q3)-m*l*c*cos(q3)-m*r*w*sin(-q3+q1+q2)+m*w^2+m*c^2+m*d*c*cos(-q3+q2); 

M31 = -I+m*l*w*sin(q3)+m*l*c*cos(q3)-m*c^2-m*w^2-m*c*d*cos(-q3+q2)+m*w*d*sin(-q3+q2)-m*c*cos(-q3+q1+q2)*r+m*w*sin(-q3+q1+q2)*r; 
M33 = m*w^2+m*c^2+I; 

RHS1 = -m*g*((d*sin(q1)-l*sin(q1+q2)+c*sin(q1+q2)+w*cos(q1+q2))*cos(gam)-(r+d*cos(q1)-l*cos(q1+q2)+c*cos(q1+q2)-w*sin(q1+q2))*sin(gam))-m*g*((d*sin(q1)-l*sin(q1+q2)+c*sin(-q3+q1+q2)+w*cos(-q3+q1+q2))*cos(gam)-(r+d*cos(q1)-l*cos(q1+q2)+c*cos(-q3+q1+q2)-w*sin(-q3+q1+q2))*sin(gam))-M*g*((d*sin(q1)-l*sin(q1+q2))*cos(gam)-(r+d*cos(q1)-l*cos(q1+q2))*sin(gam))+m*((-d*sin(q1)+l*sin(q1+q2)-c*sin(q1+q2)-w*cos(q1+q2))*(((-d*cos(q1)+l*cos(q1+q2))*u1+l*cos(q1+q2)*u2)*u1+(l*cos(q1+q2)*u1+l*cos(q1+q2)*u2)*u2-(u1+u2)^2*(c*cos(q1+q2)-w*sin(q1+q2)))-(r+d*cos(q1)-l*cos(q1+q2)+c*cos(q1+q2)-w*sin(q1+q2))*(((d*sin(q1)-l*sin(q1+q2))*u1-l*sin(q1+q2)*u2)*u1+(-l*sin(q1+q2)*u1-l*sin(q1+q2)*u2)*u2-(u1+u2)^2*(-c*sin(q1+q2)-w*cos(q1+q2))))+m*((-d*sin(q1)+l*sin(q1+q2)-c*sin(-q3+q1+q2)-w*cos(-q3+q1+q2))*(((-d*cos(q1)+l*cos(q1+q2))*u1+l*cos(q1+q2)*u2)*u1+(l*cos(q1+q2)*u1+l*cos(q1+q2)*u2)*u2-(-u3+u1+u2)^2*(c*cos(-q3+q1+q2)-w*sin(-q3+q1+q2)))-(r+d*cos(q1)-l*cos(q1+q2)+c*cos(-q3+q1+q2)-w*sin(-q3+q1+q2))*(((d*sin(q1)-l*sin(q1+q2))*u1-l*sin(q1+q2)*u2)*u1+(-l*sin(q1+q2)*u1-l*sin(q1+q2)*u2)*u2-(-u3+u1+u2)^2*(-c*sin(-q3+q1+q2)-w*cos(-q3+q1+q2))))+M*((-d*sin(q1)+l*sin(q1+q2))*(((-d*cos(q1)+l*cos(q1+q2))*u1+l*cos(q1+q2)*u2)*u1+(l*cos(q1+q2)*u1+l*cos(q1+q2)*u2)*u2)-(r+d*cos(q1)-l*cos(q1+q2))*(((d*sin(q1)-l*sin(q1+q2))*u1-l*sin(q1+q2)*u2)*u1+(-l*sin(q1+q2)*u1-l*sin(q1+q2)*u2)*u2)); 
RHS3 = -m*g*c*sin(-gam-q3+q1+q2)-m*g*w*cos(-gam-q3+q1+q2)-Th+Thip-m*w*l*u2^2*cos(q3)-2*m*w*u1*l*u2*cos(q3)+m*c*l*u1^2*sin(q3)+m*c*u1^2*d*sin(-q3+q2)-m*w*l*u1^2*cos(q3)+m*c*l*u2^2*sin(q3)+m*w*u1^2*d*cos(-q3+q2)+2*m*c*u1*l*u2*sin(q3); 

MM = [M11 M13; M31 M33];                             

RHS = [RHS1; RHS3];                      

X = MM \ RHS;                                    

ud1 = X(1);                                       
ud2 = 0;                                       
ud3 = X(2);                                       
ud4 = 0;                                        

zdot = [u1 ud1 u2 ud2 u3 ud3 u4 ud4]';