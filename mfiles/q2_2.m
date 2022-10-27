clc
clear
close all

n=-100:100;
w0=0.33*2*pi;
w=0.05*2*pi;
w2=0.01*2*pi;

bn=(2*w/pi)*(sin(w*n)./(pi*n)).*cos(w0*n);
bn(101)=w/pi;%Hopital

bn2=(2*w2/pi)*(sin(w2*n)./(pi*n)).*cos(w0*n);
bn2(101)=w2/pi;%Hopital

subplot(4,1,1),stem(n,bn)
title('Impulse Response')


Hw=fft(bn);

Hw2=fft(bn2);

f=-1:1/((length(Hw)-1)/2):1;
subplot(4,1,2), plot(f,abs(Hw))
title('Frequency Response')
xlabel('Frequency * pi')

subplot(4,1,3),stem(n,bn2)
title('Impulse ResponseWith Decrease BW')

subplot(4,1,4), plot(f,abs(Hw2))
title('Frequency Response With Decrease BW')
xlabel('Frequency * pi')