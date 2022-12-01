onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib axi_traffic_gen_1_opt

do {wave.do}

view wave
view structure
view signals

do {axi_traffic_gen_1.udo}

run -all

quit -force
