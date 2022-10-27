# Testplan Smart Wagen - Main board v1
### Belangrijke signalen op de main-board-v1 zijn de volgende:
##### 1. POWER-RAILS
    - +3.3V
    - +5V
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
    - RESET/RESET-CONFIG KNOP
    - Motor aansturing:
        - Richting LED's
        - +5V
        - GND
        - Rechtse motor signaal(kanaal A & B)
        - Linkse motor signaal (kanaal A & B)

#### Interactive HTML BOM
- Om het testwerk en het assembleren van de PCB's gemakkelijker te maken, heb ik gebruikt gemaakt van het volgende tool:
    - <a href="https://github.com/openscopeproject/InteractiveHtmlBom?fbclid=IwAR2e5xDyZ1AHobQOF2mJyeeRvGXaS-iPvZZbMUqJnvotiJ2qEeXGnqT2VdU"> 
        Interactive HTML BOM
        </a>
- Deze add-on is vooral bedoeld voor KiCad gemaakt maar er bestaat een ULP-script om dit compatibel te maken met Eagle:
    - <a href="https://github.com/Funkenjaeger/brd2json?fbclid=IwAR3I2avqAAi-3Fv7DlKl71UZM7MKphXxi8-ZV9mPc6_-hZDC3z_Rkof_lU8">brd2json</a>

<a href="./assets/interactive boms/sw-main-board-v1-bom.html" target="_blank">Open interactive BOM in new tab</a>
<iframe frameborder="2" height="800" width="750" scrolling="yes" src="./assets/interactive boms/sw-main-board-v1-bom.html" title="ESP323 Interactive BOM"></iframe>

### Testresultaten
- [OK] Visuele inspectie van de PCB
- [OK] Continuïteit tussen 2 punten van belangrijke signalen
- [OK] Geen korsluiting na bestukken en solderen van componenten op PCB
- [OK] Juiste spanningen voor belangrijke signalen
- [OK] Programmer-signalen:
    - [OK] TX
    - [OK] RX
    - [OK] EN
    - [OK] BOOT
    - [NOK] +3.3V
        - Deze +3.3V was niet verbonden met de +3.3V laag(Binnenste laag 2), waardoor de microcontroller niet kon opstarten. Oplossing:
            - a.d.h.v. een jumper-kabel, heb ik een connectie gemaakt tussen de +3.3V pin van de JST-SH connector en een beschikbare +3.3V pin
        - Resultaat:
            - ESP32 kan nu correct gevoed worden met een +3.3V
    - [OK] GND
- [OK] Status LED's:
    - [NOK]  STATUS_LED_0
        - Massa van de weerstand was niet correct verbonden met de rest van de massalaag.<br>Dit was veroorzaakt door andere tracks die rondom deze via geplaatst zijn waardoor deze geen connectie kon maken met de andere massalaag.
        - Oplossing: 
            - Soldermask van via blootstellen door deze te verwijderen met een scherpe mes en aan de hand van een jumper-kabel deze via verbinden met een andere beschikbare massa.
        - Resultaat:
            - STATUS_LED_0 werkt nu naar behoren.
    - [OK] STATUS_LED_1
- [OK]  RESET/RESET-CONFIG KNOP
- [OK]  Motor aansturing:
    - [OK] Richting LED's
    - [OK] +5V
    - [OK] GND
    - [OK] Rechtse motor signaal(kanaal A & B)
    - [OK] Linkse motor signaal (kanaal A & B)