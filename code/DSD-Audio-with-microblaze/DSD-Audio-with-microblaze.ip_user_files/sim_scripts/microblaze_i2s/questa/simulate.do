onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib microblaze_i2s_opt

do {wave.do}

view wave
view structure
view signals

do {microblaze_i2s.udo}

run -all

quit -force
