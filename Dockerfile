FROM alpine:latest

LABEL "com.github.actions.name"="github-actions"
LABEL "com.github.actions.description"="GitHub Actions for Exoscale repositories"
LABEL "com.github.actions.icon"="hash"
LABEL "com.github.actions.color"="green"

COPY scripts/* /usr/local/bin/

COPY entrypoint.sh /

RUN \
  set -e -x; \
  apk add --no-cache \
    bash \
    curl \
    git \
    jq \
  ; \
  chmod a+rx \
    /usr/local/bin/* \
    entrypoint.sh \
  ;

ENTRYPOINT ["/entrypoint.sh"]
