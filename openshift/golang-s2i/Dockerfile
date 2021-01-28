FROM golang:1.15

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOCACHE=/tmp \
    GO111MODULE=on \
    SOURCE_DIR=/go/src/app \
    GOPATH=/go

COPY ./s2i/bin/ /usr/libexec/s2i

RUN mkdir -p $SOURCE_DIR && chmod 0777 $SOURCE_DIR

WORKDIR $SOURCE_DIR
USER 1001

CMD ["/usr/libexec/s2i/run"]
