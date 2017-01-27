FROM node:6-slim


# Install packages.
# Not happy with python and gcc!
RUN apt-get update \
    && apt-get install -y --no-install-recommends bzip2 python make g++\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN groupadd -r slides && useradd -r -g slides slides

COPY Dockerfile /Dockerfile

# Grab reveal.js code
ENV VERSION=3.3.0 \
    REPO=https://github.com/hakimel/reveal.js \
    SHA=45dc8caeb1a1a81d74293552ea3a408bc463dc3e
RUN curl -o /tmp/reveal.js.tar.gz -sSL $REPO/archive/$VERSION.tar.gz && \
    echo "$SHA /tmp/reveal.js.tar.gz" | sha1sum --check - && \
    tar -xzf /tmp/reveal.js.tar.gz -C / && \
    rm -f /tmp/reveal.js.tar.gz && \
    mv reveal.js-$VERSION /revealjs

# Switch to the reveal.js directory.
WORKDIR /revealjs

# Prepare the reveal.js installation.
RUN npm install -g grunt-cli && npm install
RUN sed -i Gruntfile.js -e "s/files: \[ 'index\.html'\]/files: [ 'slides\/**' ]/"

COPY revealjs-files/ /revealjs/

RUN chown -R slides /revealjs
USER slides

EXPOSE 8000 35729
CMD ["grunt", "serve"]

ARG VCS_REF 
ARG BUILD_DATE
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/amouat/revealjs-docker" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"
