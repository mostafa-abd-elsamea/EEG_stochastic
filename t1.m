function f2=t1(y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this program take input for subject n as c3c4f7f8 channels in txt file and
%read them to be copyed later in excel file after spiliting them to
%to,t1,t2 
global iteration;
global kkk;global snr_t1;global run;
xi2=0;
xi6=1;
Fs=160;%sample frequency;
%itration=5;%change here for itterations
%%
%reading the txt file contains raw c3c4f7f8
dataset1 = readmatrix(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',kkk),'\',sprintf('%s',run) , '/c3t1_d.txt']);
dataset2 = readmatrix(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',kkk),'\',sprintf('%s',run) , '/c3t1_d_f_abs.txt']);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%final brain data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_cal=dataset1(:,iteration);
data_cal_abs=dataset2(:,iteration);
n=80;
delta_f=Fs/n;
%%
%%%%%%%%%%%%%%%%%%%%%start stocastic%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L_f=160;%to avoid error in function
pi=22/7;
Fs=160;%sample frequency;
L=160;%how many points in the data
T=1/Fs;
tmax=L*T;
t=0:T:tmax-T;
d=Fs*(0:(L/2))/L;
delta=.00625;%dt
t(1:end)=(0:L_f-1);
w=2*pi*y(2);
delta_f=Fs/n;
%dw
qq=readtable('C:\Users\Mustafa\Downloads\hs71_MATLAB\sigma.txt');
qq=qq.randomfn(1:160);%:end
dw=(sqrt(delta))*qq;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5error sum%%%%%%%%%%%%%%%%%%%%%%5
for j=1:n
    sin_fn_c3t0(j)=(xi6*sin((2*pi*y(2)*delta*t(j))+y(3)));
end
%amp_stocastic for c3 and t0
amp_stocastic_c3t0(1)=y(5);%data_cal(1);%-0.205136407;
for i=1:n-1
    amp_stocastic_c3t0(i+1)=amp_stocastic_c3t0(i)+y(1)*(xi2-amp_stocastic_c3t0(i))*delta+y(4)*dw(i+1);
end

x_bar_c3=amp_stocastic_c3t0.*sin_fn_c3t0;%x'(t)
x_bar_c3(1)=0;
x_bar_c3=x_bar_c3';

f_spc_c3(1)=0;
for jj=1:10
    f0=jj*delta_f;
    for s=1:n
        cos_x1_c3(jj,s)= x_bar_c3(s)*cos(2*pi*f0*delta*s);
        sin_x1_c3(jj,s)=-x_bar_c3(s)*sin(2*pi*f0*delta*s);    
    end
 cos_x1_sum_c3(jj)=sum(cos_x1_c3(jj,:));
 sin_x1_sum_c3(jj)=sum(sin_x1_c3(jj,:));
 f_spc_c3(jj+1)=10*log10(sqrt(cos_x1_sum_c3(jj)^2+sin_x1_sum_c3(jj)^2));   
 end 
  
for i=1:5
    err_f_c3(i)=((data_cal_abs(i))-(f_spc_c3(i)))^2;
  end
f2=sum(err_f_c3);
snr_t1(iteration)=10*log10(sum(f_spc_c3(1:5))/f2);
end