
function zplus=Jumpmap(t,z,GL_DIM)      

r1 = z(1);   v1 = z(2);                         
r2 = z(3);   v2 = z(4);                         
r3 = z(5);   v3 = z(6);                         
r4 = z(7);   v4 = z(8);                       

q1 = r1 + r2 - r3 - r4;                         
q2 = r4;                                        
q3 = -r3;                                       
q4 = r2; % DEPENDS                           

M = GL_DIM(1);  m = GL_DIM(2); c = GL_DIM(3);   
I = GL_DIM(4);  g = GL_DIM(5); l = GL_DIM(6);   
w = GL_DIM(7);  r = GL_DIM(8); d = GL_DIM(9);   
gam = GL_DIM(10);                                                      

M11 = 2*c^2*m-2*m*l*w*sin(q3)-2*m*d*w*sin(-q3+q2)-2*m*l*c*cos(q3)+M*l^2+2*I+2*w^2*m+2*l^2*m-4*m*d*l*cos(q2)+2*m*d*c*cos(q2)-2*m*d*w*sin(q2)+M*d^2+2*m*d^2+2*m*r^2-2*c*l*m-2*M*d*l*cos(q2)+M*r^2-4*m*r*l*cos(q1+q2)+4*m*r*d*cos(q1)+2*m*r*c*cos(q1+q2)-2*m*r*w*sin(q1+q2)+2*m*r*c*cos(-q3+q1+q2)-2*m*r*w*sin(-q3+q1+q2)-2*M*r*l*cos(q1+q2)+2*M*r*d*cos(q1)+2*m*d*c*cos(-q3+q2); 
M13 = m*d*w*sin(-q3+q2)+m*l*c*cos(q3)+m*l*w*sin(q3)+m*r*w*sin(-q3+q1+q2)-m*r*c*cos(-q3+q1+q2)-m*d*c*cos(-q3+q2)-c^2*m-w^2*m-I; 

M31 = -m*l*w*sin(q3)+m*c^2+m*w^2-m*l*c*cos(q3)+m*c*d*cos(-q3+q2)-m*w*d*sin(-q3+q2)+m*c*cos(-q3+q1+q2)*r-m*w*sin(-q3+q1+q2)*r+I; 
M33 = -m*c^2-m*w^2-I; 

RHS1 = m*((-d*sin(-r3+r1+r2-r4)+l*sin(-r3+r1+r2)-c*sin(-r3+r1+r2)-w*cos(-r3+r1+r2))*((-d*sin(r1)+l*sin(r1+r2))*v1+l*sin(r1+r2)*v2+(-v3+v1+v2)*(-c*sin(-r3+r1+r2)-w*cos(-r3+r1+r2)))-(r+d*cos(-r3+r1+r2-r4)-l*cos(-r3+r1+r2)+c*cos(-r3+r1+r2)-w*sin(-r3+r1+r2))*((l*cos(r1+r2)-d*cos(r1)-r)*v1+l*cos(r1+r2)*v2-(-v3+v1+v2)*(c*cos(-r3+r1+r2)-w*sin(-r3+r1+r2))))+m*((-d*sin(-r3+r1+r2-r4)+l*sin(-r3+r1+r2)-c*sin(r1+r2)-w*cos(r1+r2))*((-d*sin(r1)+l*sin(r1+r2))*v1+l*sin(r1+r2)*v2+(v1+v2)*(-c*sin(r1+r2)-w*cos(r1+r2)))-(r+d*cos(-r3+r1+r2-r4)-l*cos(-r3+r1+r2)+c*cos(r1+r2)-w*sin(r1+r2))*((l*cos(r1+r2)-d*cos(r1)-r)*v1+l*cos(r1+r2)*v2-(v1+v2)*(c*cos(r1+r2)-w*sin(r1+r2))))+M*((-d*sin(-r3+r1+r2-r4)+l*sin(-r3+r1+r2))*((-d*sin(r1)+l*sin(r1+r2))*v1+l*sin(r1+r2)*v2)-(r+d*cos(-r3+r1+r2-r4)-l*cos(-r3+r1+r2))*((l*cos(r1+r2)-d*cos(r1)-r)*v1+l*cos(r1+r2)*v2))+I*(2*v1+2*v2-v3); 
RHS3 = m*c*v1*d*cos(r2)-m*w*v1*d*sin(r2)-m*l*v1*c-m*l*v2*c+m*c^2*v2+m*c^2*v1+m*w^2*v1+m*w^2*v2+m*r*v1*c*cos(r1+r2)-m*r*v1*w*sin(r1+r2)+I*v1+I*v2; 

MM = [M11 M13; M31 M33];                             

RHS = [RHS1; RHS3];                      

X = MM \ RHS;                                    

u1 = X(1);                                       
u2 = 0;                                       
u3 = X(2);                                       
u4 = 0;       %DEPENDS                       

zplus = [q1 u1 q2 u2 q3 u3 q4 u4]; 