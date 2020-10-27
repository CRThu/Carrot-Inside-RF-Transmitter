onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L fir_compiler_v7_2_13 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.halfband_filter_1

do {wave.do}

view wave
view structure
view signals

do {halfband_filter_1.udo}

run -all

quit -force