FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y software-properties-common python curl && \
    add-apt-repository -y ppa:iconnor/zoneminder && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y zoneminder && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install --no-cache-dir confp && \
    apt-get clean

RUN a2enconf zoneminder && \
    a2enmod cgi && \
    a2enmod rewrite

WORKDIR /zm

COPY cmd.sh confp.yml zm.conf.j2 ./

CMD ["./cmd.sh"]
