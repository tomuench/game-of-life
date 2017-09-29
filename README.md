# README
## 1. Motivation
Dieses Projekt von Game-Of-Life hat die Intention das Game-Of-Life mit einen Ruby-On-Rails-Stack abzubilden. Dabei steht
nicht die Performance im Vordergrund sondern die Wartbarkeit.

## 2. Technologiestack
- Ruby on Rails 5.1.1.
- Jquery
- Docker

## 3. Objektstruktur
Es gibt werden die Models Game und Cell realisiert, welche den kompletten Systemumfang realisieren. Dabei werden die Prinzipien
Seperate of Concerns (SoC) und Don't Repeat Yourself (DRY) berücksichtigt.

## 4. Installation & Start
Das Projekt ist mit Hilfe von Docker gekapselt und wird mit Hilfe von diesen installiert und gestartet. Zum Starten sollte
folgender Befehl im Projekt-Verzeichnis ausgewählt werden.

```
./build.sh
``` 