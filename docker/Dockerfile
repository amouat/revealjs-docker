FROM node:4.4-slim

# Install packages.
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN groupadd -r slides && useradd -r -g slides slides

# Clone reveal.js.
RUN git clone -b 3.3.0 https://github.com/hakimel/reveal.js.git /revealjs

# Switch to the reveal.js directory.
WORKDIR /revealjs

# Prepare the reveal.js installation.
RUN npm install -g grunt-cli && npm install
RUN sed -i Gruntfile.js -e "s/files: \[ 'index\.html'\]/files: [ 'pres\/**' ]/"

COPY revealjs-files/ /revealjs/

RUN chown -R slides /revealjs
USER slides

EXPOSE 8000 35729
CMD ["grunt", "serve"]
