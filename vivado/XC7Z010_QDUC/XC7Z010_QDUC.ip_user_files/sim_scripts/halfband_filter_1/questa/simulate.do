onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib halfband_filter_1_opt

do {wave.do}

view wave
view structure
view signals

do {halfband_filter_1.udo}

run -all

quit -force
