# Testplan Smart Wagen - Voeding v1
### Belangrijke signalen op de voeding-v1 zijn de volgende:
##### 1. POWER-RAILS
    - +3.3V
    - +5V
    - GND
    - Vin(van 7.4 tot 20V)
    
##### 2. Signalen
    - BUCK_Feedback(Typ. 0.8V)
        - meting tussen Massa en pin 3 van LM2734X
    - BUCK_Boost( tussen 3V tot 6V max)
        - meting tussen SW(pin 6) en Boost(pin 1) van LM2734X
    - Reverse Polarity Protection:
        - Vgs meting => moet maximaal 5.6V zijn (begrensd door zener-diode)
        - Vg (meting tussen massa en pin 1 van P-mosfet)
        - Testen van functionaliteit
            - Verkeerd sluiten van ingangsspanning. 
##### 3. Vermogen verbruik
- Meten van deze parameter is essentiëel ins onze toepassing om ervoor te zorgen dat zo optimaal mogelijk de lading van de batterij lang gebruik kan worden.
    - Meten van stroom verbruik bij iddle
    - Meten van stroom verbruik 

#### Interactive HTML BOM
- Om het testwerk en het assembleren van de PCB's gemakkelijker te maken, heb ik gebruik gemaakt van het volgende tool:
    - <a href="https://github.com/openscopeproject/InteractiveHtmlBom?fbclid=IwAR2e5xDyZ1AHobQOF2mJyeeRvGXaS-iPvZZbMUqJnvotiJ2qEeXGnqT2VdU"> 
        Interactive HTML BOM
        </a>
- Deze add-on is vooral bedoeld voor KiCad gemaakt maar er bestaat een ULP-script om dit compatibel te maken met Eagle:
    - <a href="https://github.com/Funkenjaeger/brd2json?fbclid=IwAR3I2avqAAi-3Fv7DlKl71UZM7MKphXxi8-ZV9mPc6_-hZDC3z_Rkof_lU8">brd2json</a>

<a href="./assets/interactive boms/sw-voeding-v1-bom.html" target="_blank">Open interactive BOM in new tab</a>
<iframe frameborder="2" height="800" width="750" scrolling="yes" src="./assets/interactive boms/sw-voeding-v1-bom.html" title="ESP323 Interactive BOM"></iframe><br><br>

### Testresultaten
- [OK] Visuele inspectie van de PCB
- [OK] Continuïteit tussen 2 punten van belangrijke signalen
- [OK] Geen korsluiting na bestukken en solderen van componenten op PCB
- [OK] Juiste spanningen voor belangrijke signalen
    - [NOK] +3.3V 
        - Door het gebrek aan de specifieke weerstandenwaarden, heb ik de feedback-weerstanden veranderd: (origineel Rf=10k en 27k+3.9k)
            - Nieuwe verhouding: Rf=12k en 33k+2.2k => Vout = +3.15V
    - [OK] +5V
        - Dit test is goed afgelopen, de uitgangsspanning was on-point +5V.<br>
            Deze spanning zal gebruikt worden voornamelijk voor de motoren maar door het feit dat de motoren tot +6V kunnen verdragen, heb ik besloten om de weerstanden van de feedback van de buck-converter ook te vervangen.
            - Origineel FB-weerstanden => Rf=10k en 50k+2.2k
            - Nieuwe verhouding: Rf=10k en 33k+33k
                - Hierdoor is de uitgangspanning +6.2V geworden.
    - [OK] BUCK_Feedback
    - [OK] BUCK_Boost
    - [OK] Reverse polarity Protection
- [NOK] Quiescentstroom (volgens datasheet 2.5mA)
    - **Gemeten I_Q = 80mA !**
        - Genomen stappen om deze waarde naar beneden te halen:
            1. **Alle led-stroomweerstanden veranderd van 1k naar 10k**
                - Led's zullen niet zo helder branden maar deze led's worden gebruikt voor het laten zien dat de +5V en +3.3V spanningsuitgangen werken.
                - Een andere mogelijk zou zijn om led's met een lagere "forward current" of een hogere "luminocity".<br>In het laatste geval kunnen wij dan een wat grotere weerstandwaarde plaatsen als stroomweerstand voor de led.
            2. **Weerstand aan de Gate van de P-CH mosfet( origineel : 220 ohm):**
                - Deze weerstand wordt gebruikt om ervoor te zorgen dat de zener-diode aan de gate van de mosfet binnen zijn werkingstroombereik blijft.
                - Aangezien de gate van de mosfet praktisch geen stroom verbruikt(in de µA bereik), heb ik besloten om deze weerstand te vervangen door een **1k weerstand**
            3. **Weerstand voor de zener-diode aan de BUCK_BOOST: (origineel : 100ohm)**
                - Zoals hierboven vermeld, wordt deze weerstand gebruikt om de zener-diode binnen zijn werkingsstroombereik.
                - Aangezien de BOOST-pin van de buck-converter niet zo veel stroom vraagt( volgens datasheet maximaal 3.5mA), <br>
                heb ik besloten om deze weerstand ook te vervangen door een **1k weerstand**.
    - **Gemeten I_Q na aanpassingen = 12mA**

### Mogelijke verbeteringen aan de PCB(2de iteratie)
 - Footprint diode van switching regulator aanpassen:
    - Momenteel is de footprint voor deze diode te groot
 - Labellen van de kathode en anode van de diode's:
    - Op het moment van deze dioden te solderen op de PCB, heb ik veel tijd gebruikt aan het onderzoeken van de richting om deze te kunnen solderen a.d.h.v. de PCB schema
 - Grotere uitvoering voor de P-mosfet van de reverse polarity protection:
    - Momenteel heb ik nog geen problemen gehad met het dissiperen van de gewenste vermogen(1A max).<br>
        Maar het zou beter zijn voor de toekomst om een mosfet in een D-PAK uitvoering te gebruiken zodat hogere stroom door de schakeling naar de belasting gevoed kan worden.