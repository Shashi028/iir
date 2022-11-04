clc
close all
clear all
Ap=0.8;
As=0.2;
Rp=-20*log10(Ap);
Rs=-20*log10(As);
omegap=0.28*pi;
omegas=0.68*pi;
[N,omegac]=buttord(omegap/pi,omegas/pi,Rp,Rs);
[b,a]=butter(N,omegac);
sys=tf(b,a,[],'variable','z')
[H,omega]=freqz(b,a,2048);
figure(1)
subplot(omega/pi,abs(H));
title('Magnitude Response(linear Scale)')
ylim([0,1])
xlim([0,1])
subplot(212)
plot(Omega/pi,20*log10(abs(H)));
title('Magnitude response in dB')
ylim([-80,5])
xlim([0,1])
