%Lag Compensator Design
clearvars;
clear all;
clc;

% Transfer function H(s)
H = tf([30],[0.02 0.3 1 0]);

%Bode plot with Phase Margin
figure()
bode(H);
margin(H);
grid on
[Gm,Pm,Wcg,Wcp]=margin(H)

%Required phase margin is 40 degrees
%Tolerance is 5 degrees

%value is in rad/sec
pmr=0.698132;
pmt=0.0872665;
pm_new=pmr+pmt

%From Plot Gain at Pm
wm_new=3.14-pm_new

%at wg_new gain=21db hence compute beta
beta=10^(21/20)

%compute T
T=10/wm_new

pause
%substitute value of T and beta obtained above to get transfer function of Lag compensating network 
figure();
Hfinal=tf([1/beta 1/(T.*beta)],[1 1/(T.*beta)]);

bode(Hfinal)
grid on




