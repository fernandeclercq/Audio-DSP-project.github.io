# Smart Tegel 





### Hoofdtegel

<p>De hoofdtegel is het startpunt voor de Smart Wagen en de verantwoordelijk om de nodige behandelingen te doen met een USB-PowerDelivery oplader zodat VBus (USB Power rail) 20V wordt.<br>
Het negotiëren van de correcte USB PD-programma wordt behandeld door: "FUSB302BMPX" IC. Deze IC is een programmeerbare USB PD controller IC die via I²C een microcontroller de mogelijkheid geeft om de registers binnen deze IC aan te passen en op deze manier de juiste PD-spanning bekomen wordt.<br>
Aangezien het interpreteren van usb data en het wegschrijven van de correcte waarden in de correcte register afhankelijk van de USB Power Delivery Protocol is, maak ik gebruik van de volgende library:<br>

- <a href="./assets/example-code/usb-c-demo.zip">PD Example for ESP8266</a> 
    (Geschreven door <a href="https://github.com/ReclaimerLabs"     target="_blank">Reclaimer Labs</a>)<br>

Meer informatie over de USB Power Delivery Protocol:
- <a href="https://www.usb.org/taxonomy/term/60" target="_blank">USB Power Delivery</a>

Als microcontroller maak ik gebruik van een ESP8266 waardoor ik de mogelijkheid heb om de PD-spanning vanop afstand te veranderen.

</p>



### 3D Viewer

<iframe src="https://student61053.autodesk360.com/shares/public/SH35dfcQT936092f0e43e8c75f7ce9bcbb82?mode=embed" width="640" height="640" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>

### Schakelingschema 

<div class="pdf-schema">
<object data="./assets/pdfs/smart-tegel_schematic.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/smart-tegel_schematic.pdf">to the PDF!</a></p>
</object>
</div>

### Pcbschema

<div class="pdf-board">
<object data="./assets/pdfs/smart-tegel_pcb.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/smart-tegel_pcb.pdf">to the PDF!</a></p>
</object>
</div>
<br><br><br>

### PCB-fotos

<div class="pcbs-fotos">
    <div class="no-components">
        <img src="./assets/pcb-fotos/smart-tegel-v1_front.jpg">
        <img src="./assets/pcb-fotos/smart-tegel-v1_back.jpg">
    </div>
    <div class="with-components">
        <img src="./assets/pcb-fotos/smart-tegel-v1_front_finished.jpg">
        <img src="./assets/pcb-fotos/smart-tegel-v1_back_finished.jpg">
    </div>
</div>