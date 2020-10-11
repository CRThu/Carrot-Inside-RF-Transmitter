% halfband_filter.m
% 2020.9.30
% CRTHu

clc
close all

% ap = 0.001db
% fix18 kaiser order=54 wc=0.415 apass=0.005
% fix18 kaiser order=66 wc=0.435 apass=0.0075

COEFFICIENT_VEC = [-8.39233398437500e-05,0,0.000305175781250000,0,-0.000747680664062500,0,0.00152587890625000,0,-0.00276184082031250,0,0.00464630126953125,0,-0.00737762451171875,0,0.0112609863281250,0,-0.0167541503906250,0,0.0246582031250000,0,-0.0366439819335938,0,0.0570678710937500,0,-0.102027893066406,0,0.316932678222656,0.500000000000000,0.316932678222656,0,-0.102027893066406,0,0.0570678710937500,0,-0.0366439819335938,0,0.0246582031250000,0,-0.0167541503906250,0,0.0112609863281250,0,-0.00737762451171875,0,0.00464630126953125,0,-0.00276184082031250,0,0.00152587890625000,0,-0.000747680664062500,0,0.000305175781250000,0,-8.39233398437500e-05];
FILTER_ORDER = length(COEFFICIENT_VEC)-1;
COEFFICIENT_VEC2 = [9.15527343750000e-05,0,-0.000267028808593750,0,0.000556945800781250,0,-0.00102233886718750,0,0.00169372558593750,0,-0.00265502929687500,0,0.00397491455078125,0,-0.00573730468750000,0,0.00807189941406250,0,-0.0111389160156250,0,0.0151824951171875,0,-0.0206298828125000,0,0.0282516479492188,0,-0.0397338867187500,0,0.0594482421875000,0,-0.103530883789063,0,0.317443847656250,0.500000000000000,0.317443847656250,0,-0.103530883789063,0,0.0594482421875000,0,-0.0397338867187500,0,0.0282516479492188,0,-0.0206298828125000,0,0.0151824951171875,0,-0.0111389160156250,0,0.00807189941406250,0,-0.00573730468750000,0,0.00397491455078125,0,-0.00265502929687500,0,0.00169372558593750,0,-0.00102233886718750,0,0.000556945800781250,0,-0.000267028808593750,0,9.15527343750000e-05];
FILTER_ORDER2 = length(COEFFICIENT_VEC2)-1;

%fvtool(COEFFICIENT_VEC);
%fvtool(COEFFICIENT_VEC2);
%fvtool(conv(COEFFICIENT_VEC,COEFFICIENT_VEC2));

[H1,w1]=freqz(COEFFICIENT_VEC);
[H2,w2]=freqz(COEFFICIENT_VEC2);
[H3,w3]=freqz(conv(COEFFICIENT_VEC,COEFFICIENT_VEC2));

figure(1);
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

fprintf('ap = %.6fdB\n',max(db(H3)));

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

figure(2);
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
filter1_out = filter(COEFFICIENT_VEC,1,signal1_interp);

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
filter2_out = filter(COEFFICIENT_VEC2,1,signal2_interp);

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