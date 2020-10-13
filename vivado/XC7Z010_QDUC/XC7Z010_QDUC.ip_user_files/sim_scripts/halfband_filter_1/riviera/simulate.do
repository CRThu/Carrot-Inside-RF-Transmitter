onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+halfband_filter_1 -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L fir_compiler_v7_2_13 -L xil_defaultlib -L secureip -O5 xil_defaultlib.halfband_filter_1

do {wave.do}

view wave
view structure

do {halfband_filter_1.udo}

run -all

endsim

quit -force
