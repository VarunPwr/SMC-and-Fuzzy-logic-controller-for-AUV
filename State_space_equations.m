%This is a tutorial covering basics of Control System Toolbox on Matlab for
%the course EE 650 : Modern Control Theory
%Author : Varun Pawar
%Email : varunpwr897@gmail.com

%% #1. Analysis of First order system 
k = 5;
tc = 10;
u = 2;
s = tf('s');
G = k/(tc*s+1);
sys = u * G;
figure('Name','Step response')
step(sys);%step response
figure('Name','Impulse response')
impulse(sys);%impulse response
figure('Name','Bode plot')
bode(G);%Bode plot
figure('Name','Root Locus')
rlocus(sys)%root locus

%% #2. Analysis of Second order system 
k = 1;
wn = 10;
zeta = 0.2;

s = tf('s');
sys1 = k*wn^2/(s^2 + 2*zeta*wn*s + wn^2);
figure('Name','Pole Zero map')
pzmap(sys1);
axis([-3 1 -15 15]);
figure('Name','Step response')
step(sys1),%step response
axis([0 3 0 2])