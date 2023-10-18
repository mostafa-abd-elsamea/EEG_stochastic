%fminunc(gradient) is better than fminsearch(simplex search method of
%Lagarias) and also u can use fmincon
clear all;clc;
clear all;
clc;
%[alpha,f,phase/theta,sigma]
global iteration;
global kkk;
global run;
global snr_t0;
global snr_t1;
global snr_t2;
kkk="sub3";%change sub here
run="r12";%change the round here

mn=1;
tt=1;
for dd=1:60%15
    %for ss=1:4
%% for t0
iteration=dd;
%[alpha,f,theta,sigma,intial]
lb=[-30,0,0,0,-5];
ub=[30,5,2*pi,20,5];
x0 =[1,2.5,pi,10,1];
%for i=1:15
[x,fval1] = fmincon(@t0,x0,[],[],[],[],lb,ub);
x(6)=fval1;
%mn=((dd-1)*5)+1;
all(tt,mn:mn+5)=x(1:6);
%% for t1
if dd<29
y0 = [1,2.5,pi,10,1];% intial values for t1f8 %for the four parameters including sigma
[y,fval2] = fmincon(@t1,y0,[],[],[],[],lb,ub);
y(6)=fval2;
all(tt+4,mn:mn+5)=y(1:6);
end
%% for t2
if dd<29
z0 = [1,2.5,pi,10,1];% intial values for t1f8 %for the four parameters including sigma
[z,fval3] = fmincon(@t2,z0,[],[],[],[],lb,ub);
z(6)=fval3;
all(tt+8,mn:mn+5)=z(1:6);
end
tt=tt+1;
if tt>4
   tt=1;
   mn=mn+6;
end
if dd==60
   snr_t0=snr_t0';
   snr_t1=snr_t1';
   snr_t2=snr_t2';
end
end
beep;