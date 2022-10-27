clc
clear
close all

n=-100:100;
w0=0.33*2*pi;
w=0.05*2*pi;

bn=(2*w/pi)*(sin(w*n)./(pi*n)).*cos(w0*n);
bn(101)=w/pi;%Hopital

NoiseBn=awgn(bn,40);

DS_NoiseBn=NoiseBn(1:2:end);

Hw_N=fft(NoiseBn);

DS_Hw_N=fft(DS_NoiseBn);

f=-1:1/((length(Hw_N)-1)/2):1;
f2=-1:1/((length(DS_NoiseBn)-1)/2):1;

subplot(4,1,1),stem(n,NoiseBn);
title('Impulse Response With Noise')
subplot(4,1,2),plot(f,abs(Hw_N))
title('Frequency Response With Noise')

subplot(4,1,3),stem(n(1:2:end),DS_NoiseBn);
title('Impulse Response With Decimation')
subplot(4,1,4),plot(f2,abs(DS_Hw_N))
title('Frequency Response With Decimation')