onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib i2s_receiver_0_opt

do {wave.do}

view wave
view structure
view signals

do {i2s_receiver_0.udo}

run -all

quit -force
