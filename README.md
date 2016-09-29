RevealJS-Docker
===============

A dockerized version of the [Reveal JS](http://lab.hakim.se/reveal-js/#/) presentation software. To try it out, just do:

```
  docker-compose up -d
```

And open a browser to `http://localhost:8000` (use the IP of your VM ifusing boot2docker, which can be found by running
`boot2docker ip`).

To use your own slides, replace `/slides/slides.md` with your own slides in Markdown format.

If you need to include other files e.g. images, keep them with the presentation file and add them in the `slides`
directory.

If you need to change some options or change the theme, update the files in the `docker/revealjs-files` directory and rebuild the image:

```
  docker-compose build
```

This project is *heavily* based on [Peter Parente's revealjs](https://github.com/parente/dockerfiles/tree/master/revealjs). This differences are that this version has an updated Dockerfile which uses the NodeJS official image and removes a problematic VOLUME command.

[![](https://images.microbadger.com/badges/image/amouat/revealjs.svg)](https://microbadger.com/images/amouat/revealjs "Get your own image badge on microbadger.com")
