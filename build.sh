#!/bin/bash
docker build . -t tomuench/game-of-life
docker run -d -p 3000:3000 --name tomuench-gol-container tomuench/game-of-life