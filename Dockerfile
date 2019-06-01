FROM alpine:3.9

ENV PATH="/google-cloud-sdk/bin:${PATH}"
WORKDIR /

RUN apk add --no-cache --update make ca-certificates openssl python && \
    update-ca-certificates && \
    wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
    tar zxf google-cloud-sdk.tar.gz && \
    /google-cloud-sdk/install.sh --usage-reporting=false --path-update=true --quiet && \
    gcloud --quiet components update && \
    gcloud --quiet components install beta alpha && \
    rm -rf google-cloud-sdk.tar.gz /google-cloud-sdk/.install/ && \
    mkdir /google-cloud-sdk/.install && \
    for i in `find /google-cloud-sdk/ -name "*.pyc"`; do rm $i; done

