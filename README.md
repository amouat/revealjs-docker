RevealJS-Docker
===============

A dockerized version of the Reveal JS presentation software. To run,
just do:

  docker run -d -p 8000:8000 -v PATH_TO_SLIDES_MD:/revealjs/md/slides.md amouat/reveal

Replacing PATH_TO_SLIDES_MD with the path to your slides in Markdown format. 
Then open http://localhost:8000 in your browser (use the IP of your VM if
using boot2docker, which can be found by running boot2docker ip). If you want
to use straight HTML for the slides, mount the html at "/revealjs/index.html".

This is heavily based on [Peter Parente's revealjs](https://github.com/parente/dockerfiles/tree/master/revealjs). This version has an updated Dockerfile 
which uses the NodeJS official image and removes a problematic VOLUME
command. 
