% cic_filter.m
% 2020.10.26
% CRTHu

clc
close all

% use functions in utility folder
addpath(genpath('./utility'));

% CIC Filter Configure
CIC_R = 8;      % Rate Change
CIC_N = 5;      % Number of Stages
CIC_M = 1;      % Differential Delay

DISPLAY_LEN = 128;

% test signals
fs = 1024;
Nsample = fs;
t = 0:1/Nsample:1/fs*(Nsample-1);

f2 = 0.18;
a2 = 85;

sin2 = a2*sin(2*pi*f2*fs*t);
sin_sum = sin2;

% CIC Filter
% --> Comb -> ... -> Comb --> ¡ÁR --> Int -> ... -> Int -->

% DATA
DATA_IN = floor(sin_sum);
DATA_LEN = length(DATA_IN);

% N Stages Comb
comb_net = zeros(1,CIC_N+1);
comb_reg = zeros(CIC_M,CIC_N);
comb_reg_tmp = zeros(CIC_M+1,CIC_N);
comb_data_out = zeros(1,DATA_LEN);
for i=1:DATA_LEN
    % Update Nets
    comb_net(1) = DATA_IN(i);
    for j=1:CIC_N
        comb_net(j+1) = comb_net(j) - comb_reg(CIC_M,j);
    end
    % Comb Output
    comb_data_out(i) = comb_net(CIC_N+1);
    
    % Clock Posedge, Update Register of [z^(-M)].
    comb_reg_tmp = [comb_net(1:CIC_N);comb_reg];
    comb_reg = comb_reg_tmp(1:CIC_M,:);
    
    %fprintf('i = %d.\n',i);
    %display(comb_reg);
end

% Interpolation (¡ÁR)
interp_data_out = [comb_data_out;zeros(CIC_R-1,DATA_LEN)];
interp_data_out = interp_data_out(:).';

% N Stages Integrator
int_data_out = zeros(1,DATA_LEN*CIC_R);
int_net = zeros(1,CIC_N+1);
int_reg = zeros(1,CIC_N);
for i=1:DATA_LEN*CIC_R
    % Update Nets
    int_net(1) = interp_data_out(i);
    for j=1:CIC_N
        int_net(j+1) = int_net(j) + int_reg(j);
    end
    % Int Output
    int_data_out(i) = int_net(CIC_N+1);
    
    % Clock Posedge, Update Register of [z^(-1)].
    int_reg = int_net(2:CIC_N+1);
    
    %fprintf('i = %d.\n',i);
    %display(int_reg);
end

% Display
f=figure(1);
subplot(3,1,1);
stairs(DATA_IN(1:DISPLAY_LEN));
subplot(3,1,2);
stairs(comb_data_out(1:DISPLAY_LEN));
subplot(3,1,3);
stairs(int_data_out(1:DISPLAY_LEN*4));
xlabel('Samples');

% Override Y Label
OverrideYLabel(f,0);
set(f,'SizeChangedFcn',@OverrideYLabel);
% Override Cursor
OverrideCursor(f);

% EOF