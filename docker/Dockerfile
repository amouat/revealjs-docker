FROM node:4.4-slim

MAINTAINER Adrian Mouat <adrian@adrianmouat.com>

# Install packages.
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \

    git  \

  # Clean up.
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Clone reveal.js.
RUN git clone -b 3.3.0 https://github.com/hakimel/reveal.js.git /revealjs

# Switch to the reveal.js directory.
WORKDIR /revealjs

# Prepare the reveal.js installation.
RUN npm install -g grunt-cli
RUN npm install
RUN sed -i Gruntfile.js -e "s/files: \[ 'index\.html'\]/files: [ 'pres\/**' ]/"

COPY revealjs-files/ /revealjs/

EXPOSE 8000 35729
CMD ["grunt", "serve"]
