# In- & Outputs 
Hier zijn al de in- en outputs opgelijst die wij op dit moment zullen verwerken. Het is mogelijk dat deze lijst nog uitgebreid wordt naarmate het project vordert.


|  Blok  |  Data In  | Data Out  |
|--------|-----------|-----------|
|NodeRed (server) | **HTTP POST REQUEST** </br> filetype : formdata object </br> sketchVersion : Integer </br> sketchTarget : String </br> sketchBinFile : String </br> sketchBinaryLength : Integer | **HTTP GET REQUEST**</br> sketch : buffer </br> **MQTT Messages** versie : integer   |
| Database (MYSQL)| **HTTP POST REQUEST** </br> string filename => dit is de compressed bin file dat op de webpagina wordt gekozen om door te sturen naar de database  </br> mediumblob data => dit is de data van de sketch </br> string target => dit beslist waar de sketch wordt upgeload (car of tegel) </br> int version => dit is de versie van de sketch die elke keer gelezen zal worden om de firmware up to date te houden</br> | **MQTT Messages** </br>  int versie => dit is de versie van de sketch om de firmware up to date te houden  </br>  **HTTP GET REQUEST**  </br> mediumblob sketch => dit is de compressed bin file dat op de server wordt gekozen om door te sturen naar de target (car of tegel)|             
|Hoofd tegel (ESP32) |</br>(niet geimplementeerd)</br> **MQTT Message** </br> Boolean barrier[] => deze array geeft de toestand aan van de slagbomen op de tegel </br> buffer lightStates[trafficLight] => dit zijn de waarden tussen 0 -2 die de toestand van de verkeerslichten zijn | (niet geimplementeerd)</br> **MQTT Message** </br> boolean lightStates=[trafficLight] => de waarden van de verkeerslichten   int barrier=[barrierPositions] => toestand van de slagboom |
|neven tegels (atmega328p) | (niet geimplementeerd)</br> **HTTP GET REQUEST  from server** </br> Boolean barrier[] => deze array geeft de toestand aan van de slagbomen op de tegel </br> buffer lightStates[trafficLight] => dit zijn de waarden tussen 0 -2 die de toestand van de verkeerslichten zijn |(niet geimplementeerd)</br> **MQTT Message** </br> boolean lightStates=[trafficLight] => de waarden voor de verkeerslichten ,buffer barrier=[barrierPositions] => integer waarden voor de slagboom besturing  |
|Wagen (ESP32) | **HTTP GET REQUEST  from server**</br>  mediumblob sketch => dit is de compressed bin file dat wordt ingelezen van de database </br> (niet geimplementeerd) </br> **MQTT Message** </br> buffer herstelRoute[]=> beschrijving van hoe de wagen terug naar startpunt gaat | (niet geimplementeerd)</br> **MQTT Message**</br>  sensordata=[richting,snelheid] => data die wordt terug gestuurd naar de database <br/> wagenPositie=[positions] => posities van de wagen naar de database
 |