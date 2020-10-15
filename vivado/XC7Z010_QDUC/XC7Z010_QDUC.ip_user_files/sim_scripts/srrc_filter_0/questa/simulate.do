onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib srrc_filter_0_opt

do {wave.do}

view wave
view structure
view signals

do {srrc_filter_0.udo}

run -all

quit -force
