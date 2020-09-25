% qam_mapping.m
% 2020.9.25
% CRTHu

clc
close all

% bus length
DATA_WIDTH = 4;
ANALOG_WIDTH = 16;

data_in_vec = ['0123456789ABCDEF13579BDF02468ACE'];
I_out_vec = zeros(1,16);
Q_out_vec = zeros(1,16);
label_out_vec = strings([1,16]);

for i=1:16
% get data_L and data_H
% one byte per symbol
data = hex2dec(data_in_vec(i));
% two bytes per symbol
%data = hex2dec(data_in_vec(i*2-1:i*2));

% calculate data_H and L bits
fprintf(['DATA = %0' num2str(DATA_WIDTH) 's\n'],dec2bin(data));
data_H = bitand(bitshift(data, -DATA_WIDTH/2),power(2,DATA_WIDTH/2)-1);
data_L = bitand(data, power(2,DATA_WIDTH/2)-1);
%fprintf(['DATA = %0' num2str(DATA_WIDTH/2) 's %0' num2str(DATA_WIDTH/2) 's\n'],dec2bin(data_H),dec2bin(data_L));

% gray2bin test
%for i=0:1:15
%    fprintf('%04s %04s\n',dec2bin(i),gray2bin(dec2bin(i)))
%end

% relative position
I_pos = power(2,DATA_WIDTH/2)-1 - bin2dec(gray2bin(dec2bin(data_L)));
Q_pos = power(2,DATA_WIDTH/2)-1 - bin2dec(gray2bin(dec2bin(data_H)));
%fprintf('I_pos:%d Q_pos:%d\n',I_pos,Q_pos);

% dac mapping
DAC_MIN = -power(2,ANALOG_WIDTH-1);
DAC_MAX = power(2,ANALOG_WIDTH)-1;
POS_RANGE = power(2,DATA_WIDTH/2)-1;
I_out = DAC_MIN+DAC_MAX/POS_RANGE*I_pos;
Q_out = DAC_MIN+DAC_MAX/POS_RANGE*Q_pos;
fprintf('I_out:%d Q_out:%d\n',I_out,Q_out);

% storage data
I_out_vec(i)=I_out;
Q_out_vec(i)=Q_out;
label_out_vec(i)=num2str(data);

end

% display scatter
scatter(I_out_vec,Q_out_vec,'x');

% display label
for i=1:16
text(I_out_vec(i),Q_out_vec(i),char(label_out_vec(i)));
end

% gray2bin function
function Bin=gray2bin(Gray)
    len = length(Gray);
    Bin = '';
    Bin(1) = Gray(1);
    for i = 1 : len-1
        tmp1 = bin2dec(Bin(i));
        tmp2 = bin2dec(Gray(i+1));
        Bin(i+1) = dec2bin(xor(tmp1, tmp2));
    end
end
