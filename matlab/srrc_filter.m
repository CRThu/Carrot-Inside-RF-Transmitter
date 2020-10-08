% srrc_filter.m
% 2020.9.30
% CRTHu

clc
close all

% use functions in utility folder
addpath(genpath('./utility'))

% test vector
SPECIFY_VEC = ['416C7068610D0A427261766F0D0A436861726C69650D0A44656C74610D0A4563'];
VEC_LEN = 64;

% srrc order=24 wc=0.25 alpha=0.25
COEFFICIENT_VEC = [-0.00881958007812500,0.00143432617187500,0.0156402587890625,0.0227355957031250,0.0129089355468750,-0.0134735107421875,-0.0419311523437500,-0.0491638183593750,-0.0159454345703125,0.0592346191406250,0.155181884765625,0.235687255859375,0.267074584960938,0.235687255859375,0.155181884765625,0.0592346191406250,-0.0159454345703125,-0.0491638183593750,-0.0419311523437500,-0.0134735107421875,0.0129089355468750,0.0227355957031250,0.0156402587890625,0.00143432617187500,-0.00881958007812500];
FILTER_ORDER = 24;
FILTER_DELAY = (FILTER_ORDER + 1)/2;
FILTER_DELAY_ADD_SAMPLES = ceil(FILTER_DELAY/4);

% display length
DISPLAY_ALL = VEC_LEN*4+FILTER_DELAY_ADD_SAMPLES;
%DISPLAY_LEN = DISPLAY_ALL;
DISPLAY_LEN = 80;

%fvtool(COEFFICIENT_VEC);

% h(t)
figure(2);
stem(1:length(COEFFICIENT_VEC),COEFFICIENT_VEC);

% test vector to signal_in
data_in_vec = SPECIFY_VEC;
data_in_bits = de2bi(hex2dec(data_in_vec.'),'left-msb');
signal_in = reshape(double(data_in_bits).',1, VEC_LEN*4);

% normalized
signal_in_n = signal_in.*32767-16384;

% add zeros after signal_in
signal_in_n = [signal_in_n zeros(1,FILTER_DELAY_ADD_SAMPLES)];

% interpolation (L*4)
signal_in_interp = zeros(1,length(signal_in_n)*4);
for i=1:length(signal_in_n)
    signal_in_interp(1+(i-1)*4) = signal_in_n(i);
end

% Filter
signal_out = filter(COEFFICIENT_VEC,1,signal_in_interp);

% Fixed->Signed
signal_out = signal_out.*2;
signal_out = fix(signal_out);

% Display Figures
f=figure(3);
subplot(2,1,1);
stairs(1:DISPLAY_LEN,signal_in_n(1:DISPLAY_LEN));
title('SRRC FILTER SIGNAL IN');
subplot(2,1,2);
stairs(1:DISPLAY_LEN*4,signal_out(1:DISPLAY_LEN*4));
title('SRRC FILTER SIGNAL OUT');

% Override Y Label
OverrideYLabel(f,0);
set(f,'SizeChangedFcn',@OverrideYLabel);
% Override Cursor
OverrideCursor();

% EOF