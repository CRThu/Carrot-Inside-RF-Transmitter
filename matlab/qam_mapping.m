% qam_mapping.m
% 2020.9.25
% CRTHu

clc
close all

% bus length
DATA_WIDTH = 8;
ANALOG_WIDTH = 16;

% testbench vector symbol length
TEST_SYMBOL_VEC_LEN = 16;
USE_RAND_VEC = 0;
SPECIFY_VEC = ['A337666075EF9992BF7DE1DD110BDC92'];
%SPECIFY_VEC = ['776F2E1A538E3BE8D10B7ED023199554'];

% display label control
DISPLAY_LABEL = 1;

% Configure LUT .coe Path
DATA_PATH = './data/';
LUT_FILE_OUT = 'quantized_level_lut.coe';
TEST_VEC_OUT = 'qam_mapping.txt';   % qam_mapping.txt

% calculate parameters
DATA_IQ_WIDTH = DATA_WIDTH/2;
DATA_IQ_MAX = power(2,DATA_WIDTH/2)-1;
DAC_MIN = -power(2,ANALOG_WIDTH-1);
DAC_MAX = power(2,ANALOG_WIDTH)-1;
POS_MAX = power(2,DATA_IQ_WIDTH)-1;

if USE_RAND_VEC == 1
    % generate rand data
    rand_data_bin = round(randi([0 1],1,TEST_SYMBOL_VEC_LEN * DATA_WIDTH));
    rand_data_bits = reshape(double(rand_data_bin).',4,TEST_SYMBOL_VEC_LEN * DATA_WIDTH/4).';
    rand_data_hex = bi2de(rand_data_bits,'left-msb');
    data_in_vec = dec2hex(rand_data_hex)';
else
    % specify vector
    data_in_vec = SPECIFY_VEC;
    rand_bits = de2bi(hex2dec(data_in_vec.'),'left-msb');
    rand_data_bin = reshape(double(rand_bits).',1,TEST_SYMBOL_VEC_LEN * DATA_WIDTH);
end

% generate test vec file
test_vec_fid = fopen([DATA_PATH TEST_VEC_OUT],'w');

fprintf('%dQAM MAPPING\n',power(2,DATA_WIDTH));
fprintf('data_in_vec = %s\n',data_in_vec);
fprintf(test_vec_fid,'%dQAM MAPPING\n',power(2,DATA_WIDTH));
fprintf(test_vec_fid,'data_in_vec = %s\n',data_in_vec);

I_out_vec = zeros(1,TEST_SYMBOL_VEC_LEN);
Q_out_vec = zeros(1,TEST_SYMBOL_VEC_LEN);
label_out_vec = cell([1,TEST_SYMBOL_VEC_LEN]);

for i=1:TEST_SYMBOL_VEC_LEN
    % get data
    rand_data_i = rand_data_bin((i-1)*DATA_WIDTH+1:(i-1)*DATA_WIDTH+DATA_WIDTH);
    data = bin2dec(num2str(rand_data_i')');
    
    % calculate data_H and L bits
    %fprintf('DATA:%s\t',dec2bin(data,DATA_WIDTH));
    data_H = bitand(bitshift(data, -DATA_IQ_WIDTH),DATA_IQ_MAX);
    data_L = bitand(data, DATA_IQ_MAX);
    if mod(DATA_IQ_WIDTH,4) == 0
        fprintf('DATA:0x%s%s\t',dec2hex(data_H,DATA_IQ_WIDTH/4),dec2hex(data_L,DATA_IQ_WIDTH/4));
        fprintf(test_vec_fid,'DATA:0x%s%s\t',dec2hex(data_H,DATA_IQ_WIDTH/4),dec2hex(data_L,DATA_IQ_WIDTH/4));
    else
        fprintf('DATA:%s%s\t',dec2bin(data_H,DATA_IQ_WIDTH),dec2bin(data_L,DATA_IQ_WIDTH));
        fprintf(test_vec_fid,'DATA:%s%s\t',dec2bin(data_H,DATA_IQ_WIDTH),dec2bin(data_L,DATA_IQ_WIDTH));
    end
    
    % relative position
    I_pos = DATA_IQ_MAX - bin2dec(gray2bin(dec2bin(data_L)));
    Q_pos = DATA_IQ_MAX - bin2dec(gray2bin(dec2bin(data_H)));
    %fprintf('I_pos:%2d  Q_pos:%2d\t',I_pos,Q_pos);

    % quantized level
    I_out = fix(DAC_MIN + DAC_MAX / POS_MAX * I_pos);
    Q_out = fix(DAC_MIN + DAC_MAX / POS_MAX * Q_pos);
    fprintf('I:%6d  Q:%6d\n',I_out,Q_out);
    fprintf(test_vec_fid,'I:%6d  Q:%6d\n',I_out,Q_out);

    % storage data
    I_out_vec(i) = I_out;
    Q_out_vec(i) = Q_out;
    label_out_vec(i) = {[dec2bin(data_H,DATA_IQ_WIDTH) dec2bin(data_L,DATA_IQ_WIDTH)]};
end
fclose(test_vec_fid);

% display scatter
scatter(I_out_vec,Q_out_vec,'x');

% display label
if DISPLAY_LABEL == 1
    text(I_out_vec,Q_out_vec,label_out_vec);
end

% quantized level LUT .coe generate
coe_fid = fopen([DATA_PATH LUT_FILE_OUT],'w');
quantized_level_lut = zeros(1,DATA_IQ_MAX+1);
fprintf(coe_fid,'memory_initialization_radix=10;\n');
fprintf(coe_fid,'memory_initialization_vector=\n');
ch = [',' char(10)];
for i=0:DATA_IQ_MAX
    quantized_level_lut(i+1) = fix(DAC_MIN + DAC_MAX / POS_MAX * i);
    if i == DATA_IQ_MAX
        ch = ';';
    end
    fprintf(coe_fid,'%d%s',quantized_level_lut(i+1),ch);
end
fclose(coe_fid);
fprintf([LUT_FILE_OUT ' Write file succeed.\n']);

% display quantized level
fprintf('quantized level: ');
fprintf('%d ',quantized_level_lut);
fprintf('\n');

% gray2bin test
%for i=0:1:15
%    fprintf('%04s %04s\n',dec2bin(i),gray2bin(dec2bin(i)))
%end

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

% EOF