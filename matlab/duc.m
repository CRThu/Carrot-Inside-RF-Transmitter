% duc.m
% 2020.11.19
% CRTHu

clc
close all

% use functions in utility folder
addpath(genpath('./utility'));

% NCO signal
nco_width = 16;
nco_fs = 300000000; % MCLK = 300MHz
nco_Nsample = 256;
nco_t = 0:1/nco_fs:1/nco_fs*(nco_Nsample-1);

nco_f = 25000000;   % NCO = 25MHz
nco_a = power(2,nco_width-1);

nco_sinout = floor(nco_a*sin(2*pi*nco_f*nco_t));
nco_cosout = floor(nco_a*cos(2*pi*nco_f*nco_t));

% 16-QAM signal
QAM_width = 16;
QAM_SYMBOL_RATE = 7500000;   % symbol rate = 7.5MHz
QAM16_A = sqrt(10)/10;
QAM_DATA_I = power(2,QAM_width-1).*[1 -1 3 3 -3 -3 1].*QAM16_A;
QAM_DATA_Q = power(2,QAM_width-1).*[1 3 1 -3 -1 3 -1].*QAM16_A;
QAM_t_sample_I = QAM_DATA_I(mod(floor(nco_t.*QAM_SYMBOL_RATE),length(QAM_DATA_I))+1);
QAM_t_sample_Q = QAM_DATA_Q(mod(floor(nco_t.*QAM_SYMBOL_RATE),length(QAM_DATA_Q))+1);

% s(t)
truncate_width = 16;
I_OUT = nco_cosout .* QAM_t_sample_I ./ power(2,truncate_width);
Q_OUT = nco_sinout .* QAM_t_sample_Q ./ power(2,truncate_width);
S_OUT = I_OUT - Q_OUT;

% Display Signal
f1=figure(1);
subplot(2,2,1);
plot(nco_t.*1000000,nco_cosout);
hold on;
plot(nco_t.*1000000,QAM_t_sample_I);
title('I & cos\omega_0t');
subplot(2,2,2);
plot(nco_t.*1000000,nco_sinout);
hold on;
plot(nco_t.*1000000,QAM_t_sample_Q);
title('Q & sin\omega_0t');
subplot(2,2,3);
plot(nco_t.*1000000,I_OUT);
title('Icos\omega_0t');
xlabel('Time (ns)');
subplot(2,2,4);
plot(nco_t.*1000000,Q_OUT);
title('Qsin\omega_0t');
xlabel('Time (ns)');
f2=figure(2);
plot(nco_t.*1000000,S_OUT);
title('Icos\omega_0t-Qsin\omega_0t');
xlabel('Time (ns)');

% Override Y Label
OverrideYLabel(f1,0);
set(f1,'SizeChangedFcn',@OverrideYLabel);
% Override Cursor
OverrideCursor(f1);
OverrideYLabel(f2,0);
set(f2,'SizeChangedFcn',@OverrideYLabel);
% Override Cursor
OverrideCursor(f2);

% EOF