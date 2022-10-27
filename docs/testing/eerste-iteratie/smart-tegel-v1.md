# Testplan Smart Tegel v1
### Belangrijke signalen op de Smart Tegel v1 zijn de volgende:
##### 1. POWER-RAILS
    - +3.3V (Buck-converter)
    - +Vbus
    - GND
    
##### 2. Signalen
    - Programmer-signalen:
        - TX
        - RX
        - EN
        - BOOT
        - +3.3V
        - GND
    - Status LED's:
        - STATUS_LED_0
        - STATUS_LED_1
    - PD Config Button
##### 3. Functionaliteit
    - Sketch uploaden
    - PD Spanning veranderen
    

#### Interactive HTML BOM
- Om het testwerk en het assembleren van de PCB's gemakkelijker te maken, heb ik gebruikt gemaakt van het volgende tool:
    - <a href="https://github.com/openscopeproject/InteractiveHtmlBom?fbclid=IwAR2e5xDyZ1AHobQOF2mJyeeRvGXaS-iPvZZbMUqJnvotiJ2qEeXGnqT2VdU"> 
        Interactive HTML BOM
        </a>
- Deze add-on is vooral bedoeld voor KiCad gemaakt maar er bestaat een ULP-script om dit compatibel te maken met Eagle:
    - <a href="https://github.com/Funkenjaeger/brd2json?fbclid=IwAR3I2avqAAi-3Fv7DlKl71UZM7MKphXxi8-ZV9mPc6_-hZDC3z_Rkof_lU8">brd2json</a>

<a href="./assets/interactive boms/smart-tegel-v1-bom.html" target="_blank">Open interactive BOM in new tab</a>
<iframe frameborder="2" height="800" width="750" scrolling="yes" src="./assets/interactive boms/smart-tegel-v1-bom.html" title="ESP323 Interactive BOM"></iframe>

### Testresultaten
- [X] Visuele inspectie van de PCB
- [X] Continuïteit tussen 2 punten van belangrijke signalen
- [X] Geen korsluiting na bestukken en solderen van componenten op PCB
- [X] Juiste spanningen voor belangrijke signalen
- [X] Power Rails
    - [X] +3.3V (afkomstig uit stepdown-converter)
    - [X] VBus = +5V bij opstart
- [X] Programmer Signalen
    - [X] Alle signalen werken correct
- [X] Status LED's
    - Alle LED's werken correct
- [NOK] PD Config Button
    - [NOK] knop aangesloten aan verkeerde pin van de ESP-12E
    - [X] Gefixed door deze track af te breken en met een jumperkabel de connectie te maken met andere pin -> GPIO14
- [NOK] Sketch Uploaden
    - [NOK] Door verkeerde PCB-layout "EN" pin was aangesloten met GND waardoor ESP-12E niet geactiveerd was.
    - [X] Gefixed door deze pin met +3.3V aan te sluiten
- [X] PD spanning veranderen