# README
## 1. Motivation
Dieses Projekt von Game-Of-Life hat die Intention das Game-Of-Life mit einen Ruby-On-Rails-Stack abzubilden. Dabei steht
nicht die Performance im Vordergrund sondern die Wartbarkeit. Die Berechnung wird dabei auf Serverseite durchgeführt, wobei
die HTML5-UI nur zur Anzeige da ist.

## 2. Funktionen
- Mehrere Spiele verwalten
- Spiele erstellen (Zufallsspielfeld)
- Zellen in Spielfeld veränderbar durch klick
- Eine Evolutionsstufe weiter per Klick
- Automatische Evolution starten per Klick

## 3. Technologiestack
- Ruby on Rails 5.1.1.
- Jquery
- Docker

## 4. Objektstruktur
Es gibt werden die Models Game und Cell realisiert, welche den kompletten Systemumfang realisieren. Dabei werden die Prinzipien
Seperate of Concerns (SoC) und Don't Repeat Yourself (DRY) berücksichtigt.

## 5. Installation & Start
Das Projekt ist mit Hilfe von Docker gekapselt und wird mit Hilfe von diesen installiert und gestartet. Zum Starten sollte
folgender Befehl im Projekt-Verzeichnis ausgewählt werden.

```
git clone https://github.com/tomuench/game-of-life.git
cd game-of-life
./build.sh
``` 

Alternativ kann auch direkt das Docker-Image genutzt werden.
```
docker run -d -p 3000:3000 --name tomuench-gol-container tomuench/game-of-life
``` 


Danach kann die Applikation über http://localhost:3000 geöffnet werden.