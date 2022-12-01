onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.i2s_transmitter_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {i2s_transmitter_1.udo}

run -all

quit -force
