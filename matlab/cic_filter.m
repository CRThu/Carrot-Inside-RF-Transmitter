% cic_filter.m
% 2020.10.26
% CRTHu

clc
close all

% use functions in utility folder
addpath(genpath('./utility'));

% Configure Filter .coe Path
COE_PATH = './coe/';
CICCOMP0_COE_OUT = 'cic_filter_comp_0.coe';

% COE width
COE_WIDTH = 16;

% CIC Filter Configure
CIC_R = 8;      % Rate Change
CIC_N = 5;      % Number of Stages
CIC_M = 1;      % Differential Delay

% h(t)
ht_ZEROS = 10;
%ht_CIC = [1,5,15,35,70,126,210,330,490,690,926,1190,1470,1750,2010,2226,2380,2460,2460,2380,2226,2010,1750,1470,1190,926,690,490,330,210,126,70,35,15,5,1];
ht_CIC = [];

% test signals
fs = 64;
Nsample = fs;
t = 0:1/Nsample:1/fs*(Nsample-1);

f2 = 0.18;
a2 = 85;

sin2 = a2*sin(2*pi*f2*fs*t);
sin_sum = sin2;

% CIC Filter
% --> Comb -> ... -> Comb --> ¡ÁR --> Int -> ... -> Int -->

% RUN TWICE
% 1. calc h(t)
% 2. calc signal
for run_cnt=1:2
    if run_cnt == 1
        ht_GEN = 1;     % 1:h(t);
    else
        ht_GEN = 0;     % 0:Signal
    end
    
    % DATA
    if ht_GEN == 0
        DATA_IN = floor(sin_sum);
    else
        DATA_IN = [1,zeros(1,ht_ZEROS)];
    end

    DATA_LEN = length(DATA_IN);

    DISPLAY_LEN = DATA_LEN;
    %DISPLAY_LEN = 128;

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
    
    % Display h(t)
    if ht_GEN == 1
        ht_CIC = int_data_out(int_data_out~=0);
        fprintf('h(t) = ');
        fprintf('%d;',ht_CIC);
        fprintf('\n');
        %fprintf('\nPlease Update ht_CIC in .m file.\n');
    end
end

% CIC Compensator Filter
% Reference: https://ww2.mathworks.cn/help/dsp/ref/fdesign.ciccomp.html
h_ciccomp = fdesign.ciccomp;
set(h_ciccomp, 'NumberOfSections', CIC_N, 'DifferentialDelay', CIC_M);
set(h_ciccomp, 'ap', 0.1, 'ast' , 40);
set(h_ciccomp, 'fp', 0.5, 'fst' , 0.7);
cicComp = design(h_ciccomp,'equiripple','SystemObject',true);
ht_CIC_Comp = cicComp.Numerator;
%fvtool(ht_CIC_Comp)

% Write COE Fiile
filter_coe_writer([COE_PATH CICCOMP0_COE_OUT],COE_WIDTH,ht_CIC_Comp);

% Freq Response
[H1,w1]=freqz(ht_CIC);
[H2,w2]=freqz(ht_CIC_Comp);
w2_len = length(w2);
w2_ext = [w2;zeros(w2_len*(CIC_R-1),1)];
H2_ext = [H2;zeros(w2_len*(CIC_R-1),1)];
for i=1:CIC_R-1
    w2_ext(w2_len*i+1:w2_len*(i+1)) = w2+pi*i;
    if mod(i,2)==0
        H2_ext(w2_len*i+1:w2_len*(i+1)) = H2;
    else
        H2_ext(w2_len*i+1:w2_len*(i+1)) = flipud(H2);
    end
end
max_H1_dB = db(max(H1));
figure(1);
subplot(2,1,1);
plot(w1.*CIC_R/pi,db(H1)-max_H1_dB,w2_ext/pi,db(H2_ext));
axis([0 0.65 -10 7.5]);
grid on;
ylabel('Normalized Magnitude (dB)');
legend('CIC Interpolator','CIC Compensator');
subplot(2,1,2);
plot(w1.*CIC_R/pi,db(H1)-max_H1_dB,w2_ext/pi,db(H2_ext));
axis([0 CIC_R -150 7.5]);
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Normalized Magnitude (dB)');
legend('CIC Interpolator','CIC Compensator');

% Display Signal
f=figure(2);
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