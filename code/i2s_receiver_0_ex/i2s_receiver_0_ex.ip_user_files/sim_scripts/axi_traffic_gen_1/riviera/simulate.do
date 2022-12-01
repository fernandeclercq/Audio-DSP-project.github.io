onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+axi_traffic_gen_1 -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_traffic_gen_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axi_traffic_gen_1.udo}

run -all

endsim

quit -force
