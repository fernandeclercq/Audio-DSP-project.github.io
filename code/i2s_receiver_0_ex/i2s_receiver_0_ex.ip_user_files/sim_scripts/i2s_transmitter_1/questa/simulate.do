onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib i2s_transmitter_1_opt

do {wave.do}

view wave
view structure
view signals

do {i2s_transmitter_1.udo}

run -all

quit -force
