clc
clear
close all

n=-100:100;
w0=0.33*2*pi;
w=0.05*2*pi;

bn=(2*w/pi)*(sin(w*n)./(pi*n)).*cos(w0*n);
bn(101)=w/pi;%Hopital

NoiseBn=awgn(bn,40);

subplot(3,1,1),stem(n,bn);
title('Impulse Response')
subplot(3,1,2),stem(n,NoiseBn)
title('Impulse Response With Noise')

 Hw=fft(NoiseBn);

f=-1:1/((length(Hw)-1)/2):1;
subplot(3,1,3), plot(f,abs(Hw))
title('Frequency Response')
xlabel('Frequency * pi')