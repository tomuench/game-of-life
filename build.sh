#!/bin/bash
docker build . -t tomuench-gol
docker run -d -p 3000:3000 --name tomuench-gol-container tomuench-gol