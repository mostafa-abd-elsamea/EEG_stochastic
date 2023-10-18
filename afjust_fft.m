% for adjusting the fft
Fs = 160;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 160;             % Length of signal
t = (0:L-1)*T;        % Time vector
kkk="sub1";
%S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);%original signal
%X = S + 2*randn(size(t));%add noise
dataset_d = readmatrix(['C:\Users\Mustafa\Desktop\my_thesis_4oct_2022\mat1s\data_txt\',sprintf('%s',kkk) '/f7t01.txt']);
X=dataset_d(:,1);
%S=detrend(S);
%plot
plot(1000*t(1:160),X(1:160))
title("Signal Corrupted with Zero-Mean Random Noise")
xlabel("t (milliseconds)")
ylabel("X(t)");
%fft
Y = fft(X);
P3 = abs(Y/L);
P2=10*log10(abs(Y));
plot(P2);hold on;plot(P3);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")