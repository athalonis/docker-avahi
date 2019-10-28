FROM debian:buster-slim

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer bb@halonis.de

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker Avahi" \
      org.label-schema.url="https://github.com/athalonis/docker-avahi/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/athalonis/docker-avahi.git" \
      org.label-schema.vcs-type="Git"

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
    avahi-daemon \
    avahi-utils \
    libnss-mdns && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

ENTRYPOINT ["avahi-daemon"]
