FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r3

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=java-play \
    BITNAMI_IMAGE_VERSION=1.3.10-r4 \
    PATH=/opt/bitnami/activator/bin:/opt/bitnami/node/bin:$PATH

# Install Java module
RUN bitnami-pkg install java-1.8.0_91-0 --checksum 64cf20b77dc7cce3a28e9fe1daa149785c9c8c13ad1249071bc778fa40ae8773

# Install Java/Play dependencies
RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && apt-get update && \
    apt-get -y install --no-install-recommends openjdk-8-jdk && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt /var/cache/apt/archives/* /tmp/*

RUN bitnami-pkg install node-6.4.0-0 --checksum 41d5a7b17ac1f175c02faef28d44eae0d158890d4fa9893ab24b5cc5f551486f

# Install Java/Play (Activator) module
RUN bitnami-pkg install activator-1.3.10-4 --checksum 77fa565ff8d55cd9b21dc66405a4f4e9a089bd8fe231a61dd4ac9d0dcad0f3ac -- --applicationDirectory /projects

EXPOSE 9000

# Set up Codenvy integration
LABEL che:server:9000:ref=play che:server:9000:protocol=http

USER bitnami
WORKDIR /projects

ENV TERM=xterm

CMD ["/entrypoint.sh", "tail", "-f", "/dev/null"]
