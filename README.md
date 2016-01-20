RevealJS-Docker
===============

A dockerized version of the [Reveal JS](http://lab.hakim.se/reveal-js/#/) presentation software. To try it out, just do:

    docker run -d -p 8000:8000 amouat/revealjs:latest

And open a browser to `http://localhost:8000` (use the IP of your VM if
using boot2docker, which can be found by running `boot2docker ip`).

To use your own slides, replace `/revealjs/pres/slides.md` with your own slides
in Markdown format. The easiest way to do this is with the `-v` flag e.g:

    docker run -d -p 8000:8000 -v /path/to/my/slides.md:/revealjs/pres/slides.md amouat/revealjs:latest

You can use the the [test slides](https://raw.githubusercontent.com/amouat/revealjs-docker/master/test_slides.md) to get an idea for the formatting.

If you want to use straight HTML for the slides, mount the html at `/revealjs/index.html`.

If you need to include other files e.g. images, keep them with the presentation file and just mount the directory e.g:

    docker run -d -p 8000:8000 -v /my/slide/dir:/revealjs/pres amouat/revealjs:latest

This project is *heavily* based on [Peter Parente's revealjs](https://github.com/parente/dockerfiles/tree/master/revealjs). This differences are that this version has an updated Dockerfile which uses the NodeJS official image and removes a problematic VOLUME command. 

## Stable Version

Currently, the Dockerfile just grabs the newest version of everything, which
means it could potentially break at any point. I intend to add another branch
which has pegged versions of everything.
