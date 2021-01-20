FROM golang:1.15

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOCACHE=/tmp \
    SOURCE_DIR=/go/src

COPY ./s2i/bin/ /usr/libexec/s2i

RUN mkdir -p $SOURCE_DIR \
      && chmod 0777 $SOURCE_DIR

WORKDIR $SOURCE_DIR
USER 1001

