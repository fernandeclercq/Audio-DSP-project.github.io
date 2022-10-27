# Deelproblemen
Hieronder vindt u een verzameling van de deel problemen die onderdeel uitmaken van de Smart City Tiles opdracht.

* ## Smart Tegels
    * #### Hoofdtegel
    Deze tegel zal o.a. de volgende functionaliteit moeten hebben:
      * Startpunt van de wagen
      * Distributie van voeding afkomstig van een USB 3 PD (Power Delivery) Oplader.
      * Eventuele master-rol in communicatie met andere tegels.
      * Verzender van informatie over eigen status en status van andere tegels die online zijn.

    * #### Gewone tegel
    Deze type tegels zijn hoofdtegels niet en ze hebben bijgevolg geen van de bovenvermelde functionaliteit.<br>
    Deze tegels kunnen wel een ander soort tegel worden met een specifieke functionaliteit, bijvoorbeeld:
      * Tegels van het type “Kruispunt” kunnen het verkeer controleren aan de hand van slagbomen of stoplichten. 
      * Elke tegel gaat een bepaalde ID hebben waarmee het type van de tegel achterhaald kan worden.
	    * Elke tegel gaat via een bedrade/draadloze manier communiceren met de hoofdtegel/server om informatie door te kunnen sturen.
	    * Elke tegel gaat een manier moeten hebben om de voeding afkomstig van de hoofdtegel of hun buren te ontvangen en te omvormen naar een bruikbare niveau.


* ## Smart Wagens
De "Smart" wagen zal een microcontroller zodanig ingesteld hebben dat een geprogrammeerde route kan ontvangen zonder dat deze ergens aangesloten moet worden.<br>
Net zoals in het geval van de Smart Tegels, stuurt de wagen informatie over o.a. de huidige positie, snelheid, enzovoort naar een server waarin al deze informatie verwerkt zal worden en getoond in de WebApp.<br>
De Smart wagen zal ook in staat moeten zijn om obstakels te detecteren bij het afleggen van de geprogrammerde route en op een correcte manier deze te behandelen(zoals een slagboom die gesloten is).<br>
Bij een eventuele uitval van de connectie tussen de server en wagen of in het geval dat de wagen buiten de geprogrammeerde route zou geraken, zou het handig zijn als deze terug naar het startpunt zou gaan en opnieuw vertrekken of wachten totdat de connectie terug in orde is.


* ## WebApp
De webapp gaat een grafische interface bieden aan de gebruiker waardoor deze van op afstand zowel de wagen(s) en/of tegel(s) gaat kunnen aansturen, programmeren en de status ervan kan bekijken.


