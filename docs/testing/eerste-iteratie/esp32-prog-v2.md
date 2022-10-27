# Testplan ESP32 Programmer V2
### Belangrijke signalen op de ESP32-programmer zijn de volgende:
##### 1. POWER
    - +3.3V
    - VBus(+5V) 
    - GND
##### 2. Signalen
    - USB_D+
    - USB_D-
    - TX
    - RX
    - Autoreset-signalen:
        - ESP32_BOOT 
        - ESP32_EN
    Autoreset LUT:
        DTR     RTS ->  EN      BOOT
        1       1       1       1
        0       0       1       1
        1       0       0       1
        0       1       1       0        

<br>

#### Interactive HTML BOM
- Om het testwerk en het assembleren van de PCB's gemakkelijker te maken, heb ik gebruikt gemaakt van het volgende tool:
    - <a href="https://github.com/openscopeproject/InteractiveHtmlBom?fbclid=IwAR2e5xDyZ1AHobQOF2mJyeeRvGXaS-iPvZZbMUqJnvotiJ2qEeXGnqT2VdU"> 
        Interactive HTML BOM
        </a>
- Deze add-on is vooral bedoeld voor KiCad gemaakt maar er bestaat een ULP-script om dit compatibel te maken met Eagle:
    - <a href="https://github.com/Funkenjaeger/brd2json?fbclid=IwAR3I2avqAAi-3Fv7DlKl71UZM7MKphXxi8-ZV9mPc6_-hZDC3z_Rkof_lU8">brd2json</a>

<a href="./assets/interactive boms/esp32-prog-v2-bom.html" target="_blank">Open interactive BOM in new tab</a>
<iframe frameborder="2" height="800" width="750" scrolling="yes" src="./assets/interactive boms/esp32-prog-v2-bom.html" title="ESP323 Interactive BOM"></iframe><br>

### Testresultaten
- [OK] Visuele inspectie van de PCB
- [OK] Continuïteit tussen 2 punten van belangrijke signalen
- [OK] Geen korsluiting na bestukken en solderen van componenten op PCB
- [OK] Juiste spanningen voor belangrijke signalen
- [OK] +3.3V
- [OK] VBus(+5V)
- **Signalen**
    - [OK] USB_D+
    - [OK] USB_D-
    - [OK] TX
    - [OK] RX
    - [OK] ESP32_BOOT
    - [NOK] ESP_EN
        - In standby moet deze signaal altijd HIGH zijn(dus +3.3V), maar deze was altijd 0V.
        - De reden hiervan is een verkeerde footprint voor de reset-knop:
            - Volgens schakelingschema is pin 1 verbonden met ESP_BOOT en pin 2 met GND verbonden
            - Pin 1 en 2 zijn doorverbonden intern in de knop
        - Oplossing:
            - Pin van de knop die verbonden is met massa desolderen, afsnijden en jumper-kabel solderen met de andere kant van de knop.
    - [OK] ESP_EN
        - ESP32-programmer-v2 kan nu sketches uploaden.
        - Auto-reset schakeling werkt nu naar behoren. 