onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xpm -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L fir_compiler_v7_2_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.fir_compiler_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {fir_compiler_0.udo}

run -all

quit -force
