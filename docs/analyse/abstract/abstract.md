# Abstracte oplossing
Hieronder vindt u onzo oplossing voor de deelproblemen in textvorm.

* ## Smart Tegels
    * #### Hoofdtegel & Gewone tegel
    Zowel de hoofdtegel als de gewone tegel zullen voorzien worden van een internet connectie via WiFi aan de hand van de ESP32.
    Om het gewicht van de code ,die voor de communicatie gaat zorgen, zo klein mogelijk te houden, zal men MQTT als de communicatie protocol gebruiken tussen elke tegel en de servers.<br>
    Afhankelijk van het type tegel het is, bv. een tegel die geconfigureerd is als een kruispunt, dan gaat men die tegel met een slagboom of een stoplicht voorzien zodat deze het verkeerd kan controleren. De slagboom zal in dit geval aangestuurd worden door een servo motor.<br>
    In het geval van de voeding, zal de hoofdtegel de verantwoordelijk zijn om een 20V 5A max. vermogen te behandelen aan de hand van een USB 3 Power Delivery IC, namelijk: STUSB4500.
    Wanneer deze IC gebruikt wordt in combinatie met een compatibele USB 3 Oplader, kan deze IC de oplader zijn spanning laten veranderen van een 5V spanning naar een 20V spanning.
    Eenmaal een spanning van 20V bekomen is, wordt deze ook gevoed naar de andere tegels die met de hoofdtegel verbonden zijn.<br>
    Andere tegels moeten een Buck-Boost-converter hebben zodat ze deze 20V spanning naar een bruikbare spanning omvormen zonder dat er veel energie in de vorm van warmte verspild wordt.

* ## Smart Wagens
Net zoals bij de Smart tegels, zal de Smart wagen ook voorzien worden van een ESP32 zodat deze met de server kan communiceren, code via het internet geüpload kan krijgen en aangestuurd van op afstand kan worden.<br>
De wagen zal ook aangedreven worden door 2 motors die elk voorzien zijn van een decoder. Hiermee kan er gemakkelijk de afstand berekend worden aan de hand van de data afkomstig uit de decoders.<br>
Ook zal er een Ultrasonic sensor aanwezig zijn zodat de wagen ook kan weten wanneer tegen een bepaald object rijdt(Bv. tegen de slagboom).<br>
In het geval van een stoplicht, zal men beter een zogenaamd "kleursensor" gebruiken zodat de wagen de huidige status van het stoplicht kan bepalen.<br>
Aangezien de wagen wat vrij kan rondrijden, gaan wij gebruik van een LiPo-batterij maken met de nodige batterijbescherming en boost-buck-converters voor de verschillende spanningen die nodig zullen zijn.



* ## WebApp
De Webapp moet aan de gebruiker basiscontrols om de wagen handmatig aan te sturen. Daarnaast zal de webapp ook een zone ter beschikking hebben zodat er code geüpload kan worden om elke wagen of tegel te kunnen programmeren.
Deze draadloze manier van code uploaden zal gekoppeld zijn aan een database waar vorige versie van code bewaard zullen worden.<br>
In het geval van foutieve code, kan men op een gemakkelijke manier de vorige of een van de vorige versies van de code laten uploaden naar de wagen/tegel.
Alle verbonden toestellen(al dan wagens of tegels) zullen apart een tablad krijgen in de webapp zodat deze gemakkelijk beheerd kunnen worden.

