# Smart Wagen

Het "Smart Wagen" bestaat voornamelijk uit 2 schakelingen, namelijk:
- Een voeding 
- Een main-board

De functie van de voeding is om de wagen te voorzien van de juiste spanningen. De main-board, waar de ESP32 en de IC's voor de aansturing van de motors te vinden zijn, hebben 2 verschillende spanningen nodig, namelijk:
- ESP32 en logische gedeelte: +3.3V
- Motor aansturing en motors: +5V

Deze 2 spanningen worden bekomen door middel van een Buck-converter(SMPS) die de 7.4V van de batterij verlaagt. Uiteraard kan men hetzelfde resultaat bekomen door een LDO-lineaire spanningsregelaar te gebruiken maar dan is het nadeel dat wij deze schakeling enkel en alleen gebruiken als de ingangsspanning niet groter wordt dan 15V(de absolute maximum van z'n LDO-spanningsregelaar).<br>
Door een Swichting Mode schakeling te gebruiken, kunnen wij dezelfde voedingschakeling gebruiken voor de voeding van elk "Smart Tegel".

### Voeding

<iframe src="https://student61053.autodesk360.com/shares/public/SH35dfcQT936092f0e438371a2744cf91672?mode=embed" width="640" height="640" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>

### Schakelingschema 

<div class="pdf-schema">
<object data="./assets/pdfs/sw-voeding-v1_schema.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/sw-voeding-v1_schema.pdf">to the PDF!</a></p>
</object>
</div>

### Pcbschema

<div class="pdf-board">
<object data="./assets/pdfs/sw-voeding-v1_board.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/sw-voeding-v1_board.pdf">to the PDF!</a></p>
</object>
</div>

### PCB-foto's

<div class="pcbs-fotos">
    <div class="no-components">
        <img src="./assets/pcb-fotos/pcb_sw-voeding-v1_front.png">
        <img src="./assets/pcb-fotos/pcb_sw-voeding-v1_back.png">
    </div>
    <div class="with-components">
        <img src="./assets/pcb-fotos/assembled-pcb_sw-voeding-v1_front.png">
        <img src="./assets/pcb-fotos/assembled-pcb_sw-voeding-v1_back.png">
    </div>
</div>
<br><br><br>


### Main-board

De twee belangrijkste componenten op de main-board van de Smart-wagen zijn:
- Een ESP32
- Twee SN754410NE( 4 Kanaal H-brug IC)

Op deze pcb is de ESP32 verantwoordelijk voor de aansturen van de IC's voor de motoraansturing, het verzenden van data naar het internet en het ontvangen van data uit het internet.<br>
Tot nu toe was de bedoeling om klein motoren aan te sturen(maximaal 6V en 0.2A) maar als het nodig zou zijn, kan de SN754410NE eventueel kractige motoren aansturen (maximaal 36V en 1A per kanaal).<br>

Verder, zijn er JST-ZH connectoren voorzien voor het aansluiten van de 4 motoren. Er zijn nog 4 JST-PH en complimentaire schakeling voorzien om 4 IR-sensors te kunnen implementeren in de toekomst.<br>

Ten slotte, is er een JST-SH connector voorzien voor de programmer.

<iframe src="https://student61053.autodesk360.com/shares/public/SH35dfcQT936092f0e43b3a617b6976c7f36?mode=embed" width="640" height="640" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>


<div class="pdf-schema">
<object data="./assets/pdfs/sw-main-board-v1_schema.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/sw-main-board-v1_schema.pdf">to the PDF!</a></p>
</object>
</div>

### Pcbschema

<div class="pdf-board">
<object data="./assets/pdfs/sw-main-board-v1_board.pdf#page=1" type="application/pdf" width="100%" height="100%">
  <p>Alternative text - include a link <a href="./assets/pdfs/main-board-v1_board.pdf">to the PDF!</a></p>
</object>
</div>

### PCB-foto's

<div class="pcbs-fotos">
    <div class="no-components">
        <img src="./assets/pcb-fotos/pcb_sw-main-board-v1_front.png">
        <img src="./assets/pcb-fotos/pcb_sw-main-board-v1_back.png">
    </div>
    <div class="with-components">
        <img src="./assets/pcb-fotos/assembled-pcb_sw-main-board-v1_front.png">z
        <img src="./assets/pcb-fotos/assembled-pcb_sw-main-board-v1_back.png">
    </div>
</div>
<br><br><br>


### Volledig Smart Wagen

Als zowel de voeding als de main board pcb zouden monteren op de wagen, dan zou dit er zo uit zien:

<iframe src="https://student61053.autodesk360.com/shares/public/SH35dfcQT936092f0e43782d2beab57a1a12?mode=embed" width="640" height="640" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"  frameborder="0"></iframe>

### Smart Wagen - foto's

<div class="pcbs-fotos">
    <div class="no-components">
        <img src="./assets/img/assembled_sw-wagen_side.png">
        <img src="./assets/img/assembled_sw-wagen_front.png">
        <img src="./assets/img/assembled_sw-wagen_above.png">
    </div>
</div>