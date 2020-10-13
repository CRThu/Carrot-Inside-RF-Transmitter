% halfband_filter.m
% 2020.9.30
% CRTHu

clc
close all

% Configure Filter .coe Path
COE_PATH = './coe/';
HB0_COE_OUT = 'halfband_filter_0.coe';
HB1_COE_OUT = 'halfband_filter_1.coe';

% Ap = -0.000929 ~ 0.000792 dB
% fix18_18 kaiser order=54 wc=0.415 apass=0.005
% fix18_18 kaiser order=66 wc=0.435 apass=0.0075

HB0_COE_VEC = [-8.01086425781250e-05,0,0.000305175781250000,0,-0.000751495361328125,0,0.00152587890625000,0,-0.00276565551757813,0,0.00464248657226563,0,-0.00737762451171875,0,0.0112609863281250,0,-0.0167541503906250,0,0.0246582031250000,0,-0.0366439819335938,0,0.0570716857910156,0,-0.102031707763672,0,0.316932678222656,0.499996185302734,0.316932678222656,0,-0.102031707763672,0,0.0570716857910156,0,-0.0366439819335938,0,0.0246582031250000,0,-0.0167541503906250,0,0.0112609863281250,0,-0.00737762451171875,0,0.00464248657226563,0,-0.00276565551757813,0,0.00152587890625000,0,-0.000751495361328125,0,0.000305175781250000,0,-8.01086425781250e-05];
HB0_FILTER_ORDER = length(HB0_COE_VEC)-1;
HB1_COE_VEC = [9.53674316406250e-05,0,-0.000267028808593750,0,0.000560760498046875,0,-0.00101852416992188,0,0.00169754028320313,0,-0.00265502929687500,0,0.00397109985351563,0,-0.00573730468750000,0,0.00807189941406250,0,-0.0111351013183594,0,0.0151824951171875,0,-0.0206298828125000,0,0.0282554626464844,0,-0.0397338867187500,0,0.0594482421875000,0,-0.103527069091797,0,0.317443847656250,0.499996185302734,0.317443847656250,0,-0.103527069091797,0,0.0594482421875000,0,-0.0397338867187500,0,0.0282554626464844,0,-0.0206298828125000,0,0.0151824951171875,0,-0.0111351013183594,0,0.00807189941406250,0,-0.00573730468750000,0,0.00397109985351563,0,-0.00265502929687500,0,0.00169754028320313,0,-0.00101852416992188,0,0.000560760498046875,0,-0.000267028808593750,0,9.53674316406250e-05];
HB1_FILTER_ORDER = length(HB1_COE_VEC)-1;

%fvtool(HB0_COE_VEC);
%fvtool(HB1_COE_VEC);
%fvtool(conv(HB0_COE_VEC,HB1_COE_VEC));

filter_coe_writer([COE_PATH HB0_COE_OUT],18,HB0_COE_VEC);
filter_coe_writer([COE_PATH HB1_COE_OUT],18,HB1_COE_VEC);

figure(1);
stem(1:length(HB0_COE_VEC),HB0_COE_VEC);
figure(2);
stem(1:length(HB1_COE_VEC),HB1_COE_VEC);

[H1,w1]=freqz(HB0_COE_VEC);
[H2,w2]=freqz(HB1_COE_VEC);
[H3,w3]=freqz(conv(HB0_COE_VEC,HB1_COE_VEC));

figure(3);
subplot(2,1,1);
plot(w1/pi,db(H1),w2/pi,db(H2),w3/pi,db(H3));
axis([0 0.5 -0.005 0.005]);
legend('H1','H2','H3');
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');

subplot(2,1,2);
plot(w1/pi,db(H1),w2/pi,db(H2),w3/pi,db(H3));
axis([0 1 -150 25]);
legend('H1','H2','H3');
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');

Ap = H3(w3<0.4*pi);
Ap_mindB = db(min(Ap));
Ap_maxdB = db(max(Ap));

fprintf('Ap = %.6f ~ %.6f dB\n',Ap_mindB,Ap_maxdB);

% test signals
fs = 4096;
N = fs;
t = 0:1/N:1/fs*(N-1);

f1 = 0.08;   
f2 = 0.27;
f3 = 0.39;
a1 = 0;
a2 = 0.85;
a3 = 0.32;

% interpolation value
INTERP_VAL = 2;

% display
DISPLAY_LEN = 100;

figure(4);
% Time
subplot(3,2,1);
sin1 = a1*sin(2*pi*f1*fs*t);
sin2 = a2*sin(2*pi*f2*fs*t);
sin3 = a3*sin(2*pi*f3*fs*t);
sin_sum = sin1+sin2+sin3;
plot(t(1:DISPLAY_LEN),sin_sum(1:DISPLAY_LEN));

% Spectrum
subplot(3,2,2);
sins_fft = fft(sin_sum);
mag_fft = abs(sins_fft)*2/N;
freq_fft = t;
plot(freq_fft(1:N/2+1),mag_fft(1:N/2+1));

% interpolation (I*INTERP_VAL)
signal1_interp = zeros(1,length(sin_sum)*INTERP_VAL);
for i=1:length(sin_sum)
    signal1_interp(1+(i-1)*INTERP_VAL) = sin_sum(i);
end

% Filter 1
filter1_out = filter(HB0_COE_VEC,1,signal1_interp);

% Time
subplot(3,2,3);
plot(t(1:DISPLAY_LEN*INTERP_VAL),filter1_out(1:DISPLAY_LEN*INTERP_VAL));

% Spectrum
subplot(3,2,4);
sins_fft2 = fft(filter1_out);
mag_fft2 = abs(sins_fft2)*2/N;
freq_fft2 = t;
plot(freq_fft2(1:N/2+1),mag_fft2(1:N/2+1));


% interpolation (I*INTERP_VAL)
signal2_interp = zeros(1,length(filter1_out)*INTERP_VAL);
for i=1:length(filter1_out)
    signal2_interp(1+(i-1)*INTERP_VAL) = filter1_out(i);
end

% Filter 2
filter2_out = filter(HB1_COE_VEC,1,signal2_interp);

% Time
subplot(3,2,5);
plot(t(1:DISPLAY_LEN*INTERP_VAL*2),filter2_out(1:DISPLAY_LEN*INTERP_VAL*2));
xlabel('Time (sample)');

% Spectrum
subplot(3,2,6);
sins_fft3 = fft(filter2_out);
mag_fft3 = abs(sins_fft3)*2/N;
freq_fft3 = t;
plot(freq_fft3(1:N/2+1),mag_fft3(1:N/2+1));
xlabel('Normalized Frequency (\times\pi rad/sample)');

% EOF