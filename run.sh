#!/bin/sh
docker run --name revealjs -d -p 8000:8000 -p 35729:35729 -v $PWD/pres:/reveajs/pres amouat/revealjs
