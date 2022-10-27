# ESP32 programmer v2

De ESP32-programmer is een handige tool om ons embedded programma's te uploaden naar de microcontroller.<br>
Deze tweede versie van de ESP32-programmer is gebaseerd op de heel bekende USB-to-Serial IC: **CP2102** maar in deze tweede versie hebben wij de nodige protectie tegen ESD voor de USB-datalijnen, namelijk:
- SMF05CT1G
Deze ic is een array van 5 tvs-diode die vaak gebruikt worden in de bescherming van gevoelige I/O-pinnen voor ESD.<br>
Daarnaast staat er op deze boord de nodige JST-SH connector om de verbinding tussen de ESP32-programmer en de target pcb te realiseren.
En tenslotte, is er een knop om de ESP32 te laten resetten, als het nodig zou zijn.

### 3D Viewer

<iframe src="https://student61053.autodesk360.com/shares/public/SH35dfcQT936092f0e43fc6bf55af2858994?mode=embed" width="640" height="640" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>

### Schakelingschema 

<div class="pdf-schema">
<object data="./assets/pdfs/esp32-prog-v2_schema.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/esp32-prog-v2_schema.pdf">to the PDF!</a></p>
</object>
</div>

### Pcbschema

<div class="pdf-board">
<object data="./assets/pdfs/esp32-prog-v2_board.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/esp32-prog-v2_schema.pdf">to the PDF!</a></p>
</object>
</div>
<br><br><br>

### PCB-fotos

<div class="pcbs-fotos">
    <div class="no-components">
        <img src="./assets/pcb-fotos/pcb_esp32-prog-v2_front.png">
        <img src="./assets/pcb-fotos/pcb_esp32-prog-v2_back.png">
    </div>
    <div class="with-components">
        <img src="./assets/pcb-fotos/assembled-pcb_esp32-prog-v2_front.png">
        <img src="./assets/pcb-fotos/assembled-pcb_esp32-prog-v2_back.png">
    </div>
</div>