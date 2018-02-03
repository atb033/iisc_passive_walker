function J=partialder(FUN,z,GL_DIM)
pert=1e-5;
 
%%% Using central difference, accuracy quadratic %%%
for i=1:length(z)
    ztemp1=z; ztemp2=z;
    ztemp1(i)=ztemp1(i)+pert; 
    ztemp2(i)=ztemp2(i)-pert; 
    J(:,i)=(feval(FUN,ztemp1,GL_DIM)-feval(FUN,ztemp2,GL_DIM)) ;
end
J=J/(2*pert);