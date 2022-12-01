onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+i2s_transmitter_1 -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.i2s_transmitter_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {i2s_transmitter_1.udo}

run -all

endsim

quit -force
