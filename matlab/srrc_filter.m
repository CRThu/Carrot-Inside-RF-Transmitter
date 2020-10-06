% srrc_filter.m
% 2020.9.30
% CRTHu

clc
close all

% test vector
SPECIFY_VEC = ['416C7068610D0A427261766F0D0A436861726C69650D0A44656C74610D0A4563'];
VEC_LEN = 64;

% srrc order=24 wc=0.25 alpha=0.25
coefficient_vec = [-0.00881958007812500,0.00143432617187500,0.0156402587890625,0.0227355957031250,0.0129089355468750,-0.0134735107421875,-0.0419311523437500,-0.0491638183593750,-0.0159454345703125,0.0592346191406250,0.155181884765625,0.235687255859375,0.267074584960938,0.235687255859375,0.155181884765625,0.0592346191406250,-0.0159454345703125,-0.0491638183593750,-0.0419311523437500,-0.0134735107421875,0.0129089355468750,0.0227355957031250,0.0156402587890625,0.00143432617187500,-0.00881958007812500];

fvtool(coefficient_vec);

% h(t)
figure(1);
stem(1:length(coefficient_vec),coefficient_vec);

% test vector to signal_in
data_in_vec = SPECIFY_VEC;
data_in_bits = de2bi(hex2dec(data_in_vec.'),'left-msb');
signal_in = reshape(double(data_in_bits).',1, VEC_LEN*4);

% interpolation (L*4)
x = 1:length(signal_in);
xq = 1:0.25:length(signal_in);
signal_in_interp = interp1(x,signal_in,xq,'previous');

% normalized
signal_in_interp_n = signal_in_interp.*65535-32768;

signal_out = filter(coefficient_vec,1,signal_in_interp_n);

%DISPLAY_LEN = length(signal_in_interp);
DISPLAY_LEN = 80*4;

figure(2);
subplot(2,1,1);
stairs(1:DISPLAY_LEN,signal_in_interp_n(1:DISPLAY_LEN));
title('IN')
subplot(2,1,2);
stairs(1:DISPLAY_LEN,signal_out(1:DISPLAY_LEN));
title('OUT')

% EOF