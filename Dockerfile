FROM node

MAINTAINER Adrian Mouat <adrian@adrianmouat.com>

RUN git clone https://github.com/hakimel/reveal.js.git /revealjs
RUN mkdir -p /revealjs/md

WORKDIR /revealjs

RUN npm install -g grunt-cli && npm install
RUN sed -i Gruntfile.js -e 's/port: port,/port: port, hostname: "",/'
ADD index.html /revealjs/
ADD custom.css /revealjs/css/
ADD title.js /revealjs/plugin/
ONBUILD ADD slides.md /revealjs/md/

EXPOSE 8000
CMD ["grunt", "serve"]
