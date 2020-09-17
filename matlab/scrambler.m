% scrambler.m
% 2020.9.9
% CRTHu

clc
close all

% generate Primitive polynomial
%primpoly(16,5)

% Configure Primitive polynomial
GEN_PLOY_NUM = 145;                     % (145) S(x)=D^7+D^4+1
%GEN_PLOY_NUM = 65593;                   % (65593) S(x)=D^16+D^5+D^4+D^3+1
if isprimitive(GEN_PLOY_NUM)
    disp('Primitive polynomial check passed.');
else
    disp('Primitive polynomial check failed.');
end

GEN_POLY = de2bi(GEN_PLOY_NUM,'left-msb');

% D^MSB + ... + D^LSB + 1
%GEN_POLY = [1 0 0 1 0 0 0 1];           % (145) S(x)=D^7+D^4+1

% Configure Data Path
DATA_PATH = './data/';
%FILE_IN = 'test_string_40bits.txt';	% Simple Cases
FILE_IN = 'test_string_1512bits.txt';	% General Cases
%FILE_IN = 'test_string_1904bits.txt';  % Extreme Cases

N_BIT = length(GEN_POLY) - 1;
GEN_PLOY_INDEX = N_BIT + 1 - find(GEN_POLY(1:N_BIT));

% initial 0
%seq_len = 2^N_BIT - 1;
%s_in = zeros(seq_len,1).';
%s_out = zeros(seq_len,1).';

% file to bits
text_str = fileread([DATA_PATH,FILE_IN]);
text_bits_mat = de2bi(int8(text_str),8,'left-msb');
seq_len = size(text_bits_mat,1)*size(text_bits_mat,2);
s_in = reshape(double(text_bits_mat).',seq_len,1).';
s_out = zeros(seq_len,1).';

%disp('s_in = ');
%disp(s_in);

% initial
m = ones(N_BIT,1).';

% scrambler
for i = 1:1:seq_len
    % calc mod
    reg = 0;
    for j = 1:1:length(GEN_PLOY_INDEX)
        reg = reg + m(GEN_PLOY_INDEX(j));
    end
    reg = mod(reg, 2);
    % shift
    m(2:N_BIT) = m(1:N_BIT - 1);
    m(1) = reg;
    % encrypt
    s_out(i) = mod(s_in(i) + reg,2);
end

% initial
m = ones(N_BIT,1).';
s_decrypt = zeros(seq_len,1).';

% descrambler
for i = 1:1:seq_len
    % calc mod
    reg = 0;
    for j = 1:1:length(GEN_PLOY_INDEX)
        reg = reg + m(GEN_PLOY_INDEX(j));
    end
    reg = mod(reg, 2);
    % shift
    m(2:N_BIT) = m(1:N_BIT - 1);
    m(1) = reg;
    % decrypt
    s_decrypt(i) = mod(s_out(i) + reg,2);
end

%disp('s_out = ');
%disp(s_out);

%disp('s_decrypt = ');
%disp(s_decrypt);

% calc mean of datay
fprintf('s_in.mean = %.6f\n',mean(s_in));
fprintf('s_out.mean = %.6f\n',mean(s_out));

% draw bits
if length(s_in) > 100
    draw_bits_len = 100;
else
    draw_bits_len = length(s_in);
end
figure(1);
subplot(3,1,1);
stairs(1:draw_bits_len,s_in(1:draw_bits_len));
title('Raw')
ylim([-0.25 1.25])
subplot(3,1,2);
stairs(1:draw_bits_len,s_out(1:draw_bits_len));
title('Scrambler')
ylim([-0.25 1.25])
subplot(3,1,3);
stairs(1:draw_bits_len,s_decrypt(1:draw_bits_len));
title('Descrambler')
ylim([-0.25 1.25])

% calc psd
figure(2);
hold on;
title('Power Spectral Density')
[psd_pxx,psd_w] = pwelch(s_in-mean(s_in));
plot(psd_w/pi,psd_pxx);
[psd_pxx,psd_w] = pwelch(s_out-mean(s_out));
plot(psd_w/pi,psd_pxx);
xlabel('\omega / \pi')
legend('Raw','Scrambler');
hold off;

% check raw and descrambler
if isequal(s_in,s_decrypt)
    disp('Decrypt Succeed.')
else
    disp('Decrypt Fail.')
end

% write s_in hex file
write_hex_file(s_in,seq_len,[DATA_PATH,'s_in_hex_',FILE_IN]);

% write s_out hex file
write_hex_file(s_out,seq_len,[DATA_PATH,'s_out_hex_',num2str(GEN_PLOY_NUM),'_',FILE_IN]);

% write hex file function
function write_hex_file(bits,len,path)
    bits_mat = reshape(double(bits).',8,len/8).';
    bits_hex = bi2de(bits_mat,'left-msb');
    fid = fopen(path,'w+');
    if fid == -1
        disp('fopen failed');
    else
        for i=1:length(bits_hex)
            % write data
            fprintf(fid,'%02X ',bits_hex(i));
            % \r\n
            if mod(i-1,16) == 15
                fprintf(fid,'\r\n');
            end
        end
        fclose(fid);
    end
end

% EOF