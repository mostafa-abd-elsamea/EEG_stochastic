%intialization
clear all;
clc;
kkk="sub1";%here************************8
%insert the parameters here
x=[-14.7972785663023,0.359983829666387,6.07867115846379,14.4548875857045];%here************************8
xi2=0;
xi6=1;%',sprintf('%s',k) '
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
w=2*pi*x(2);
n=80;
delta_f=Fs/n;
%dw
qq=readtable('C:\Users\Mustafa\Downloads\hs71_MATLAB\sigma.txt');
qq=qq.randomfn(1:160);%:end
dw=(sqrt(delta))*qq;

%%
%reading data
dataset_d = readmatrix(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\',sprintf('%s',kkk) '/c3t0_lpf_d.txt']);
dataset_abs = readmatrix(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\',sprintf('%s',kkk) '/c3t0_lpf_d_f_abs.txt']);
%%
datasetfft=fft(dataset_d(:,1),80);
for j=1:n
    sin_fn_c3t0(j)=(xi6*sin((2*pi*x(2)*delta*t(j))+x(3)));
end
%amp_stocastic for c3 and t0
amp_stocastic_c3t0(1)=1.53654474847667;%-0.205136407;%Here********************
for i=1:n-1
    amp_stocastic_c3t0(i+1)=amp_stocastic_c3t0(i)+x(1)*(xi2-amp_stocastic_c3t0(i))*delta+x(4)*dw(i+1);
end
x_bar_c3=amp_stocastic_c3t0.*sin_fn_c3t0;%x'(t)
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
     err_f_c3(i)=((dataset_abs(i,1))-(f_spc_c3(i)))^2;%here*******************8
  end
f1=sum(err_f_c3);
snr_t0=10*log10(sum(f_spc_c3(1:5))/f1);
%%
%plot
%%plot (dataset_d_s(:,5));
%%hold on;
%%plot (dataset_abs_s(:,5));
%%hold off;
plot (dataset_abs(1:5,1));%here******************************8
hold on;
plot (f_spc_c3(1:5));
hold off;