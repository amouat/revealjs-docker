#!/bin/sh
docker rm -f revealjs || true
docker run --name revealjs -d -p 8000:8000 -p 35729:35729 -v $PWD/pres:/revealjs/pres amouat/revealjs
