%This the tutorial of cruise control of a car.
%Author : Varun Pawar
%Email : varunpwr897@gmail.com
%% Example 1 : Position Control
M = 1500;%mass of car in kg
b = 5;%Damping coefficient
%p controller
k = 1;
A  = [-b/M -k/M ; 1 0];
B = [0 k;0 0];
C = [0 1]; 
D = [0 0];
sys = ss(A,B,C,D);
figure('Name','Cruise controller')
step(sys);%step response of p controller
%PD controller
kd = 1;
kp = 1;
A  = [-(b+kd)/M -kp/M ; 1 0];
B = [kd kp;0 0];
C = [0 1]; 
D = [0 0];
sys = ss(A,B,C,D);
figure('Name','Cruise controller v2')
step(sys);%step response of p controller
%% Example 2 : PID Controller
s = tf('s');%Frequency variable
P_car = k/(M*s^2 + s*b);
Kp = 75;
Ki = 1;
Kd = 1;
C = pid(Kp,Ki,Kd);
sys_cl = feedback(C*P_car,1);
figure
step(sys_cl,0:1:200);
grid
%title('Step Response with Proportional Control')
         
