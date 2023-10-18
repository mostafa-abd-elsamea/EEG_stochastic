%this program take input for subject n as c3c4fc1fc2 channels this file is generated from polyman  in txt file and
%read them to be copyed later in excel file after spiliting them to
%to,t1,t2 
clear all;
clc;
Fs=160;
index=1; %the general  index moving around the data
t0_index=1;%the index for each t0t1t2
t1_index=1;
t2_index=1;
t0_count=0;
t1_count=0;
t2_count=0;
jj=1; % to elemenate the error of first run
scale=30;
%%
%reading the txt file contains raw c3c4f7f8
subject="sub3";
run="r12";
%dont forget to change the name of the main txt file which contain the all
%data of the sub\round e.g:sub3r12_c34fc12.txt 
%dataset1_1 = readtable(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\dataset\txt_format\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'\s3r6_c3c4f7f8.txt']);%change here the text file name
dataset1_1 = readtable(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'\sub3r12_c34fc12.txt']);%change here the text file name
%%
%spiliting the data to channels
fc1=dataset1_1.Var5(1:end);
fc2=dataset1_1.Var6(1:end);
c3=dataset1_1.Var7(1:end);
c4=dataset1_1.Var8(1:end);
%%
%spiliting each channel to t0t1t2 according to order
%note each sub has different order and duration
%below change the order and duration for each subject
order=["T0","T2","T0","T1","T0","T2","T0","T1","T0","T1","T0","T2","T0","T1","T0","T2","T0","T2","T0","T1","T0","T1","T0","T2","T0","T1","T0","T2","T0","T1"];%change here the order as u cal from site manulay
t0_duration=4.2*Fs;%change here 
t1_duration=4.1*Fs;%change here
t2_duration=4.1*Fs;%change here
for i=1:30%change value of 30 if number of t's different
    if order(i)== "T0" 
        fc1t0(t0_index:t0_index+t0_duration-jj)=fc1(index:index+t0_duration-jj);
        fc2t0(t0_index:t0_index+t0_duration-jj)=fc2(index:index+t0_duration-jj);
        c3t0(t0_index:t0_index+t0_duration-jj)=c3(index:index+t0_duration-jj);
        c4t0(t0_index:t0_index+t0_duration-jj)=c4(index:index+t0_duration-jj);
        index=index+t0_duration;
        t0_index=t0_index+t0_duration;
        t0_count=t0_count+1;
    elseif order(i)== "T1"
        fc1t1(t1_index:t1_index+t1_duration-jj)=fc1(index:index+t1_duration-jj);
        fc2t1(t1_index:t1_index+t1_duration-jj)=fc2(index:index+t1_duration-jj);
        c3t1(t1_index:t1_index+t1_duration-jj)=c3(index:index+t1_duration-jj);
        c4t1(t1_index:t1_index+t1_duration-jj)=c4(index:index+t1_duration-jj);
        index=index+t1_duration;
        t1_index=t1_index+t1_duration;
        t1_count=t1_count+1;
    else
        fc1t2(t2_index:t2_index+t2_duration-jj)=fc1(index:index+t2_duration-jj);
        fc2t2(t2_index:t2_index+t2_duration-jj)=fc2(index:index+t2_duration-jj);
        c3t2(t2_index:t2_index+t2_duration-jj)=c3(index:index+t2_duration-jj);
        c4t2(t2_index:t2_index+t2_duration-jj)=c4(index:index+t2_duration-jj);
        index=index+t2_duration;
        t2_index=t2_index+t2_duration;
        t2_count=t2_count+1;
    end
end
 fc1t0=fc1t0';fc1t1=fc1t1';fc1t2=fc1t2'; %to make array vertical;
 fc2t0=fc2t0';fc2t1=fc2t1';fc2t2=fc2t2'; %to make array vertical;
 c3t0=c3t0';c3t1=c3t1';c3t2=c3t2'; %to make array vertical;
 c4t0=c4t0';c4t1=c4t1';c4t2=c4t2'; %to make array vertical;

 
 %% spilliting each event to set of iterations in matrix
 fc1t01=reshape(fc1t0,t0_duration,t0_count); fc1t11=reshape(fc1t1,t1_duration,t1_count); fc1t21=reshape(fc1t2,t2_duration,t2_count);
 fc2t01=reshape(fc2t0,t0_duration,t0_count); fc2t11=reshape(fc2t1,t1_duration,t1_count); fc2t21=reshape(fc2t2,t2_duration,t2_count);
 c3t01=reshape(c3t0,t0_duration,t0_count); c3t11=reshape(c3t1,t1_duration,t1_count); c3t21=reshape(c3t2,t2_duration,t2_count);
 c4t01=reshape(c4t0,t0_duration,t0_count); c4t11=reshape(c4t1,t1_duration,t1_count); c4t21=reshape(c4t2,t2_duration,t2_count);
 %% %triming the extra of 640 (4 seconds)
 fc1t00(1:640,:)=fc1t01(1:640,:);fc1t10(1:640,:)=fc1t11(1:640,:);fc1t20(1:640,:)=fc1t21(1:640,:);
 fc2t00(1:640,:)=fc2t01(1:640,:);fc2t10(1:640,:)=fc2t11(1:640,:);fc2t20(1:640,:)=fc2t21(1:640,:);
 c3t00(1:640,:)=c3t01(1:640,:);c3t10(1:640,:)=c3t11(1:640,:);c3t20(1:640,:)=c3t21(1:640,:);
 c4t00(1:640,:)=c4t01(1:640,:);c4t10(1:640,:)=c4t11(1:640,:);c4t20(1:640,:)=c4t21(1:640,:);
 %% splitting to seconds
 fc1t000=reshape(fc1t00,160,t0_count*4);fc1t100=reshape(fc1t10,160,t1_count*4);fc1t200=reshape(fc1t20,160,t2_count*4);
 fc2t000=reshape(fc2t00,160,t0_count*4);fc2t100=reshape(fc2t10,160,t1_count*4);fc2t200=reshape(fc2t20,160,t2_count*4);
 c3t000=reshape(c3t00,160,t0_count*4);c3t100=reshape(c3t10,160,t1_count*4);c3t200=reshape(c3t20,160,t2_count*4);
 c4t000=reshape(c4t00,160,t0_count*4);c4t100=reshape(c4t10,160,t1_count*4);c4t200=reshape(c4t20,160,t2_count*4);
 %% detrending and scaling of the original signal
fc1t0_d=detrend(fc1t000)/scale;fc1t1_d=detrend(fc1t100)/scale;fc1t2_d=detrend(fc1t200)/scale;
fc2t0_d=detrend(fc2t000)/scale;fc2t1_d=detrend(fc2t100)/scale;fc2t2_d=detrend(fc2t200)/scale;
c3t0_d=detrend(c3t000)/scale;c3t1_d=detrend(c3t100)/scale;c3t2_d=detrend(c3t200)/scale;
c4t0_d=detrend(c4t000)/scale;c4t1_d=detrend(c4t100)/scale;c4t2_d=detrend(c4t200)/scale;
%%
%converting to freq domain and 10l0g10 the abs
fc1t0_d_f=fft(fc1t0_d);fc1t1_d_f=fft(fc1t1_d);fc1t2_d_f=fft(fc1t2_d);
fc2t0_d_f=fft(fc2t0_d);fc2t1_d_f=fft(fc2t1_d);fc2t2_d_f=fft(fc2t2_d);
c3t0_d_f=fft(c3t0_d);c3t1_d_f=fft(c3t1_d);c3t2_d_f=fft(c3t2_d);
c4t0_d_f=fft(c4t0_d);c4t1_d_f=fft(c4t1_d);c4t2_d_f=fft(c4t2_d);
%get the signals in time domain
writematrix(fc1t0_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_d_f.txt']),'Delimiter',';');
writematrix(fc1t1_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_d_f.txt']),'Delimiter',';');
writematrix(fc1t2_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_d_f.txt']),'Delimiter',';');
writematrix(fc2t0_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_d_f.txt']),'Delimiter',';');
writematrix(fc2t1_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_d_f.txt']),'Delimiter',';');
writematrix(fc2t2_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_d_f.txt']),'Delimiter',';');
writematrix(c3t0_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_d_f.txt']),'Delimiter',';');
writematrix(c3t1_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_d_f.txt']),'Delimiter',';');
writematrix(c3t2_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_d_f.txt']),'Delimiter',';');
writematrix(c4t0_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_d_f.txt']),'Delimiter',';');
writematrix(c4t1_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_d_f.txt']),'Delimiter',';');
writematrix(c4t2_d_f,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_d_f.txt']),'Delimiter',';');

%get the abs with 10log10
fc1t0_d_f_abs=10*log10(abs(fc1t0_d_f));fc1t1_d_f_abs=10*log10(abs(fc1t1_d_f));fc1t2_d_f_abs=10*log10(abs(fc1t2_d_f));
fc2t0_d_f_abs=10*log10(abs(fc2t0_d_f));fc2t1_d_f_abs=10*log10(abs(fc2t1_d_f));fc2t2_d_f_abs=10*log10(abs(fc2t2_d_f));
c3t0_d_f_abs=10*log10(abs(c3t0_d_f));c3t1_d_f_abs=10*log10(abs(c3t1_d_f));c3t2_d_f_abs=10*log10(abs(c3t2_d_f));
c4t0_d_f_abs=10*log10(abs(c4t0_d_f));c4t1_d_f_abs=10*log10(abs(c4t1_d_f));c4t2_d_f_abs=10*log10(abs(c4t2_d_f));
%to avoid errors
fc1t0_d_f_abs(1,:)=0;fc1t1_d_f_abs(1,:)=0;fc1t2_d_f_abs(1,:)=0;
fc2t0_d_f_abs(1,:)=0;fc2t1_d_f_abs(1,:)=0;fc2t2_d_f_abs(1,:)=0;
c3t0_d_f_abs(1,:)=0;c3t1_d_f_abs(1,:)=0;c3t2_d_f_abs(1,:)=0;
c4t0_d_f_abs(1,:)=0;c4t1_d_f_abs(1,:)=0;c4t2_d_f_abs(1,:)=0;
 %% adding low pass filter
 for i=1:t0_count*4
  fc1t0_lpf(:,i)=lowpass(fc1t000(:,i),5,Fs);
  fc2t0_lpf(:,i)=lowpass(fc2t000(:,i),5,Fs);
  c3t0_lpf(:,i)=lowpass(c3t000(:,i),5,Fs);
  c4t0_lpf(:,i)=lowpass(c4t000(:,i),5,Fs);
 end
 for i=1:t1_count*4
  fc1t1_lpf(:,i)=lowpass(fc1t100(:,i),5,Fs);
  fc2t1_lpf(:,i)=lowpass(fc2t100(:,i),5,Fs);
  c3t1_lpf(:,i)=lowpass(c3t100(:,i),5,Fs);
  c4t1_lpf(:,i)=lowpass(c4t100(:,i),5,Fs);
 end
 for i=1:t2_count*4
  fc1t2_lpf(:,i)=lowpass(fc1t200(:,i),5,Fs); 
  fc2t2_lpf(:,i)=lowpass(fc2t200(:,i),5,Fs);
  c3t2_lpf(:,i)=lowpass(c3t200(:,i),5,Fs);
  c4t2_lpf(:,i)=lowpass(c4t200(:,i),5,Fs);
 end
%% adding bandpass filter to the signal
for i=1:t0_count*4
  fc1t0_bp(:,i)=bandpass(fc1t000(:,i),[8 12],Fs);
  fc2t0_bp(:,i)=bandpass(fc2t000(:,i),[8 12],Fs);
  c3t0_bp(:,i)=bandpass(c3t000(:,i),[8 12],Fs);
  c4t0_bp(:,i)=bandpass(c4t000(:,i),[8 12],Fs);
 end
 for i=1:t1_count*4
  fc1t1_bp(:,i)=bandpass(fc1t100(:,i),[8 12],Fs);
  fc2t1_bp(:,i)=bandpass(fc2t100(:,i),[8 12],Fs);
  c3t1_bp(:,i)=bandpass(c3t100(:,i),[8 12],Fs);
  c4t1_bp(:,i)=bandpass(c4t100(:,i),[8 12],Fs);
 end
 for i=1:t2_count*4
  fc1t2_bp(:,i)=bandpass(fc1t200(:,i),[8 12],Fs); 
  fc2t2_bp(:,i)=bandpass(fc2t200(:,i),[8 12],Fs);
  c3t2_bp(:,i)=bandpass(c3t200(:,i),[8 12],Fs);
  c4t2_bp(:,i)=bandpass(c4t200(:,i),[8 12],Fs);
 end
%% scaling and detrending to the lpf

fc1t0_lpf_d=detrend(fc1t0_lpf)/scale;fc1t1_lpf_d=detrend(fc1t1_lpf)/scale;fc1t2_lpf_d=detrend(fc1t2_lpf)/scale;
fc2t0_lpf_d=detrend(fc2t0_lpf)/scale;fc2t1_lpf_d=detrend(fc2t1_lpf)/scale;fc2t2_lpf_d=detrend(fc2t2_lpf)/scale;
c3t0_lpf_d=detrend(c3t0_lpf)/scale;c3t1_lpf_d=detrend(c3t1_lpf)/scale;c3t2_lpf_d=detrend(c3t2_lpf)/scale;
c4t0_lpf_d=detrend(c4t0_lpf)/scale;c4t1_lpf_d=detrend(c4t1_lpf)/scale;c4t2_lpf_d=detrend(c4t2_lpf)/scale;
%% scaling and detrending to the bp
fc1t0_bp_d=detrend(fc1t0_bp)/scale;fc1t1_bp_d=detrend(fc1t1_bp)/scale;fc1t2_bp_d=detrend(fc1t2_bp)/scale;
fc2t0_bp_d=detrend(fc2t0_bp)/scale;fc2t1_bp_d=detrend(fc2t1_bp)/scale;fc2t2_bp_d=detrend(fc2t2_bp)/scale;
c3t0_bp_d=detrend(c3t0_bp)/scale;c3t1_bp_d=detrend(c3t1_bp)/scale;c3t2_bp_d=detrend(c3t2_bp)/scale;
c4t0_bp_d=detrend(c4t0_bp)/scale;c4t1_bp_d=detrend(c4t1_bp)/scale;c4t2_bp_d=detrend(c4t2_bp)/scale;
%% converting from time domain to frequency domain in lpf
%converting to freq
fc1t0_lpf_d_f=fft(fc1t0_lpf_d);fc1t1_lpf_d_f=fft(fc1t1_lpf_d);fc1t2_lpf_d_f=fft(fc1t2_lpf_d);
fc2t0_lpf_d_f=fft(fc2t0_lpf_d);fc2t1_lpf_d_f=fft(fc2t1_lpf_d);fc2t2_lpf_d_f=fft(fc2t2_lpf_d);
c3t0_lpf_d_f=fft(c3t0_lpf_d);c3t1_lpf_d_f=fft(c3t1_lpf_d);c3t2_lpf_d_f=fft(c3t2_lpf_d);
c4t0_lpf_d_f=fft(c4t0_lpf_d);c4t1_lpf_d_f=fft(c4t1_lpf_d);c4t2_lpf_d_f=fft(c4t2_lpf_d);
%get the abs with 10log10
fc1t0_lpf_d_f_abs=10*log10(abs(fc1t0_lpf_d_f));fc1t1_lpf_d_f_abs=10*log10(abs(fc1t1_lpf_d_f));fc1t2_lpf_d_f_abs=10*log10(abs(fc1t2_lpf_d_f));
fc2t0_lpf_d_f_abs=10*log10(abs(fc2t0_lpf_d_f));fc2t1_lpf_d_f_abs=10*log10(abs(fc2t1_lpf_d_f));fc2t2_lpf_d_f_abs=10*log10(abs(fc2t2_lpf_d_f));
c3t0_lpf_d_f_abs=10*log10(abs(c3t0_lpf_d_f));c3t1_lpf_d_f_abs=10*log10(abs(c3t1_lpf_d_f));c3t2_lpf_d_f_abs=10*log10(abs(c3t2_lpf_d_f));
c4t0_lpf_d_f_abs=10*log10(abs(c4t0_lpf_d_f));c4t1_lpf_d_f_abs=10*log10(abs(c4t1_lpf_d_f));c4t2_lpf_d_f_abs=10*log10(abs(c4t2_lpf_d_f));
%to avoid errors
fc1t0_lpf_d_f_abs(1,:)=0;fc1t1_lpf_d_f_abs(1,:)=0;fc1t2_lpf_d_f_abs(1,:)=0;
fc2t0_lpf_d_f_abs(1,:)=0;fc2t1_lpf_d_f_abs(1,:)=0;fc2t2_lpf_d_f_abs(1,:)=0;
c3t0_lpf_d_f_abs(1,:)=0;c3t1_lpf_d_f_abs(1,:)=0;c3t2_lpf_d_f_abs(1,:)=0;
c4t0_lpf_d_f_abs(1,:)=0;c4t1_lpf_d_f_abs(1,:)=0;c4t2_lpf_d_f_abs(1,:)=0;
%% converting from time domain to frequency domain in bp
%converting to freq
fc1t0_bp_d_f=fft(fc1t0_bp_d);fc1t1_bp_d_f=fft(fc1t1_bp_d);fc1t2_bp_d_f=fft(fc1t2_bp_d);
fc2t0_bp_d_f=fft(fc2t0_bp_d);fc2t1_bp_d_f=fft(fc2t1_bp_d);fc2t2_bp_d_f=fft(fc2t2_bp_d);
c3t0_bp_d_f=fft(c3t0_bp_d);c3t1_bp_d_f=fft(c3t1_bp_d);c3t2_bp_d_f=fft(c3t2_bp_d);
c4t0_bp_d_f=fft(c4t0_bp_d);c4t1_bp_d_f=fft(c4t1_bp_d);c4t2_bp_d_f=fft(c4t2_bp_d);
%get the abs with 10log10
fc1t0_bp_d_f_abs=10*log10(abs(fc1t0_bp_d_f));fc1t1_bp_d_f_abs=10*log10(abs(fc1t1_bp_d_f));fc1t2_bp_d_f_abs=10*log10(abs(fc1t2_bp_d_f));
fc2t0_bp_d_f_abs=10*log10(abs(fc2t0_bp_d_f));fc2t1_bp_d_f_abs=10*log10(abs(fc2t1_bp_d_f));fc2t2_bp_d_f_abs=10*log10(abs(fc2t2_bp_d_f));
c3t0_bp_d_f_abs=10*log10(abs(c3t0_bp_d_f));c3t1_bp_d_f_abs=10*log10(abs(c3t1_bp_d_f));c3t2_bp_d_f_abs=10*log10(abs(c3t2_bp_d_f));
c4t0_bp_d_f_abs=10*log10(abs(c4t0_bp_d_f));c4t1_bp_d_f_abs=10*log10(abs(c4t1_bp_d_f));c4t2_bp_d_f_abs=10*log10(abs(c4t2_bp_d_f));
%to avoid errors
fc1t0_bp_d_f_abs(1,:)=0;fc1t1_bp_d_f_abs(1,:)=0;fc1t2_bp_d_f_abs(1,:)=0;
fc2t0_bp_d_f_abs(1,:)=0;fc2t1_bp_d_f_abs(1,:)=0;fc2t2_bp_d_f_abs(1,:)=0;
c3t0_bp_d_f_abs(1,:)=0;c3t1_bp_d_f_abs(1,:)=0;c3t2_bp_d_f_abs(1,:)=0;
c4t0_bp_d_f_abs(1,:)=0;c4t1_bp_d_f_abs(1,:)=0;c4t2_bp_d_f_abs(1,:)=0;
%% converting to txt files

writematrix(fc1t000,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t01.txt']),'Delimiter',';');
writematrix(fc1t100,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t11.txt']),'Delimiter',';');
writematrix(fc1t200,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t21.txt']),'Delimiter',';');
%original with scaling and detrend
writematrix(fc1t0_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_d.txt']),'Delimiter',';');
writematrix(fc1t1_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_d.txt']),'Delimiter',';');
writematrix(fc1t2_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_d.txt']),'Delimiter',';');
%original after f domain and abs and 10log10
writematrix(fc1t0_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_d_f_abs.txt']),'Delimiter',';');
writematrix(fc1t1_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_d_f_abs.txt']),'Delimiter',';');
writematrix(fc1t2_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_d_f_abs.txt']),'Delimiter',';');

%lowpass
writematrix(fc1t0_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_lpf.txt']),'Delimiter',';');
writematrix(fc1t1_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_lpf.txt']),'Delimiter',';');
writematrix(fc1t2_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_lpf.txt']),'Delimiter',';');
%lowpass with detrend
writematrix(fc1t0_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_lpf_d.txt']),'Delimiter',';');
writematrix(fc1t1_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_lpf_d.txt']),'Delimiter',';');
writematrix(fc1t2_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_lpf_d.txt']),'Delimiter',';');
%bandpass with detrend
writematrix(fc1t0_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_bp_d.txt']),'Delimiter',';');
writematrix(fc1t1_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_bp_d.txt']),'Delimiter',';');
writematrix(fc1t2_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_bp_d.txt']),'Delimiter',';');
%lpf in f domain after abs and l0log10
writematrix(fc1t0_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(fc1t1_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(fc1t2_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_lpf_d_f_abs.txt']),'Delimiter',';');
%bp in f domain after abs and l0log10
writematrix(fc1t0_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t0_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(fc1t1_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t1_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(fc1t2_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc1t2_bp_d_f_abs.txt']),'Delimiter',';');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%C4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writematrix(fc2t000,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t01.txt']),'Delimiter',';');
writematrix(fc2t100,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t11.txt']),'Delimiter',';');
writematrix(fc2t200,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t21.txt']),'Delimiter',';');
%original with scaling and detrend
writematrix(fc2t0_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_d.txt']),'Delimiter',';');
writematrix(fc2t1_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_d.txt']),'Delimiter',';');
writematrix(fc2t2_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_d.txt']),'Delimiter',';');
%original after f domain and abs and 10log10
writematrix(fc2t0_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_d_f_abs.txt']),'Delimiter',';');
writematrix(fc2t1_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_d_f_abs.txt']),'Delimiter',';');
writematrix(fc2t2_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_d_f_abs.txt']),'Delimiter',';');

%lowpass
writematrix(fc2t0_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_lpf.txt']),'Delimiter',';');
writematrix(fc2t1_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_lpf.txt']),'Delimiter',';');
writematrix(fc2t2_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_lpf.txt']),'Delimiter',';');
%lowpass with detrend
writematrix(fc2t0_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_lpf_d.txt']),'Delimiter',';');
writematrix(fc2t1_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_lpf_d.txt']),'Delimiter',';');
writematrix(fc2t2_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_lpf_d.txt']),'Delimiter',';');
%bandpass with detrend
writematrix(fc2t0_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_bp_d.txt']),'Delimiter',';');
writematrix(fc2t1_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_bp_d.txt']),'Delimiter',';');
writematrix(fc2t2_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_bp_d.txt']),'Delimiter',';');
%lpf in f domain after abs and l0log10
writematrix(fc2t0_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(fc2t1_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(fc2t2_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_lpf_d_f_abs.txt']),'Delimiter',';');
%bp in f domain after abs and l0log10
writematrix(fc2t0_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t0_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(fc2t1_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t1_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(fc2t2_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/fc2t2_bp_d_f_abs.txt']),'Delimiter',';');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%f7%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writematrix(c3t000,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t01.txt']),'Delimiter',';');
writematrix(c3t100,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t11.txt']),'Delimiter',';');
writematrix(c3t200,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t21.txt']),'Delimiter',';');
%original with scaling and detrend
writematrix(c3t0_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_d.txt']),'Delimiter',';');
writematrix(c3t1_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_d.txt']),'Delimiter',';');
writematrix(c3t2_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_d.txt']),'Delimiter',';');
%original after f domain and abs and 10log10
writematrix(c3t0_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_d_f_abs.txt']),'Delimiter',';');
writematrix(c3t1_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_d_f_abs.txt']),'Delimiter',';');
writematrix(c3t2_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_d_f_abs.txt']),'Delimiter',';');

%lowpass
writematrix(c3t0_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_lpf.txt']),'Delimiter',';');
writematrix(c3t1_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_lpf.txt']),'Delimiter',';');
writematrix(c3t2_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_lpf.txt']),'Delimiter',';');
%lowpass with detrend
writematrix(c3t0_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_lpf_d.txt']),'Delimiter',';');
writematrix(c3t1_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_lpf_d.txt']),'Delimiter',';');
writematrix(c3t2_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_lpf_d.txt']),'Delimiter',';');
%bandpass with detrend
writematrix(c3t0_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_bp_d.txt']),'Delimiter',';');
writematrix(c3t1_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_bp_d.txt']),'Delimiter',';');
writematrix(c3t2_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_bp_d.txt']),'Delimiter',';');
%lpf in f domain after abs and l0log10
writematrix(c3t0_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(c3t1_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(c3t2_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_lpf_d_f_abs.txt']),'Delimiter',';');
%bp in f domain after abs and l0log10
writematrix(c3t0_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t0_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(c3t1_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t1_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(c3t2_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c3t2_bp_d_f_abs.txt']),'Delimiter',';');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%f8%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writematrix(c4t000,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t01.txt']),'Delimiter',';');
writematrix(c4t100,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t11.txt']),'Delimiter',';');
writematrix(c4t200,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t21.txt']),'Delimiter',';');
%original with scaling and detrend
writematrix(c4t0_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_d.txt']),'Delimiter',';');
writematrix(c4t1_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_d.txt']),'Delimiter',';');
writematrix(c4t2_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_d.txt']),'Delimiter',';');
%original after f domain and abs and 10log10
writematrix(c4t0_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_d_f_abs.txt']),'Delimiter',';');
writematrix(c4t1_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_d_f_abs.txt']),'Delimiter',';');
writematrix(c4t2_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_d_f_abs.txt']),'Delimiter',';');

%lowpass
writematrix(c4t0_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_lpf.txt']),'Delimiter',';');
writematrix(c4t1_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_lpf.txt']),'Delimiter',';');
writematrix(c4t2_lpf,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_lpf.txt']),'Delimiter',';');
%lowpass with detrend
writematrix(c4t0_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_lpf_d.txt']),'Delimiter',';');
writematrix(c4t1_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_lpf_d.txt']),'Delimiter',';');
writematrix(c4t2_lpf_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_lpf_d.txt']),'Delimiter',';');
%bandpass with detrend
writematrix(c4t0_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_bp_d.txt']),'Delimiter',';');
writematrix(c4t1_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_bp_d.txt']),'Delimiter',';');
writematrix(c4t2_bp_d,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_bp_d.txt']),'Delimiter',';');
%lpf in f domain after abs and l0log10
writematrix(c4t0_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(c4t1_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_lpf_d_f_abs.txt']),'Delimiter',';');
writematrix(c4t2_lpf_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_lpf_d_f_abs.txt']),'Delimiter',';');
%bp in f domain after abs and l0log10
writematrix(c4t0_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t0_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(c4t1_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t1_bp_d_f_abs.txt']),'Delimiter',';');
writematrix(c4t2_bp_d_f_abs,(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\c_fc\',sprintf('%s',subject) ,'\',sprintf('%s',run) ,'/c4t2_bp_d_f_abs.txt']),'Delimiter',';');
beep;beep;beep;beep;beep;