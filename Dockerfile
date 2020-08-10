FROM alpine:3.9

ENV PATH="/google-cloud-sdk/bin:${PATH}"
WORKDIR /

COPY google-cloud-sdk /google-cloud-sdk
RUN apk add --no-cache --update make ca-certificates openssl python && \
    update-ca-certificates && \
    /google-cloud-sdk/install.sh --usage-reporting=false --path-update=true --quiet && \
    gcloud --quiet components update && \
    gcloud --quiet components install beta alpha && \
    rm -rf google-cloud-sdk.tar.gz /google-cloud-sdk/.install/ && \
    mkdir /google-cloud-sdk/.install && \
    for i in `find / -name "*.pyc"`; do rm $i; done && \
    for i in `find / -name "*.pyo"`; do rm $i; done

