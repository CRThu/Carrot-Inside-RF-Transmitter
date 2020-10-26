% cic_filter.m
% 2020.10.26
% CRTHu

clc
close all

% CIC Filter Configure
CIC_R = 4;      % Rate Change
CIC_N = 3;      % Number of Stages
CIC_M = 1;      % Differential Delay

% test signals
fs = 64;
Nsample = fs;
t = 0:1/Nsample:1/fs*(Nsample-1);

f2 = 0.18;
a2 = 85;

sin2 = a2*sin(2*pi*f2*fs*t);
sin_sum = sin2;

figure(1);
stairs(floor(sin_sum));

% CIC Filter
% --> Comb -> ... -> Comb --> ¡ÁR --> Int -> ... -> Int -->
DATA_IN = floor(sin_sum);
comb_net = zeros(1,CIC_N);
comb_reg = zeros(1,CIC_N);
comb_data_out = zeros(1,length(DATA_IN));

% N Stages Comb
for i=1:length(DATA_IN)
    comb_net(1) = DATA_IN(i);
    for j=1:CIC_N-1
        comb_net(j+1) = comb_net(j) - comb_reg(j);
    end
    % Comb Output
    comb_data_out(i) = comb_net(CIC_N) - comb_reg(CIC_N);
    % Clock Posedge, Update Register of [z^(-M)].
    comb_reg(1:CIC_N) = comb_net(1:CIC_N);
    
    %fprintf('i = %d.\n',i);
    %display(comb_reg);
end

figure(2);
stairs(comb_data_out);

% EOF