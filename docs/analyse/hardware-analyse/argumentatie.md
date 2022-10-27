## Argumentatie
<table>
    <thead>
        <tr>
            <th><strong>Component</strong></th>
            <th>Argumentatie</th>
            <th>Voordelen</th>
            <th>Nadelen</th>
        </tr>  
    </thead>
    <tbody>
        <tr>
            <td>ESP-WROVER-I<br>µC</td>
            <td></td>
            <td>
                <ul>
                    <li>Goedkoop</li>
                    <li>Gemakkelijk om te programmeren en/of implementeren</li>
                    <li>Meerdere mogelijkheden voor communicatie</li>
                    <li>Meerdere slaapmodi beschikbaar</li>
                    <li>Capacitieve sensor beschikbaar</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Vereist externe spanningsregelaar</li>
                    <li>Nood aan WiFi-verbinding</li>
                    <li>Tien aanraakpinnen zijn te weinig voor grote input aantallen</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>LM2734XMK/NOPB<br>Buck-converter IC</td>
            <td></td>
            <td>
                <ul>
                    <li>Goedkoop en in grote hoeveelheden beschikbaar</li>
                    <li>Makkelijk om te implementeren</li>
                    <li>Vereist niet zo veel extra onderdelen</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Klein footprint daardoor niet zo gemakkelijk om te solderen</li>
                    <li>Kan maximaal 1.2A</li>
                    <li>Ingangsspanning kan maximaal 24V worden</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>L293DD/SN754410NE<br>Motoraansturing IC</td>
            <td></td>
            <td>
                <ul>
                    <li>Aparte spanningssingang voor logische gedeelte en motoraansturingsgedeelte</li>
                    <li>"Enable"-pin beschikbaar</li>
                    <li>Kan tot 4 motoren aansturen bij enkel voorwaarts of enkel achterwaars rijden</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>4.5V minimale spanning voor de logische gedeelte</li>
                    <li>Vereist een goede verbinding met de massa voor koeling</li>
                    <li>Maximaal 2 motoren aanstuurbaar bij voorwaarts & achterwaarts rijden</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>RM-ESMO-04X<br>Micromotor met encoder ingebouwd</td>
            <td></td>
            <td>
                <ul>
                    <li>Encodersuitgang beschikkar</li>
                    <li>Aparte spanning voor logische gedeelte</li>
                    <li>Klein formaat</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Lage RPM(98RPM) bij maximale ingangsspanning(6V)</li>
                    <li>JST type SH niet zo gemakkelijk om te interfacen</li>
                    <li>(voorlopig)Voorraad enkel beschikbaar in VS</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>