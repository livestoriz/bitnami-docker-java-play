FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=java-play \
    BITNAMI_IMAGE_VERSION=1.3.10-r3 \
    PATH=/opt/bitnami/activator/bin:/opt/bitnami/node/bin:$PATH

# Install Java module
RUN bitnami-pkg install java-1.8.0_91-0 --checksum 64cf20b77dc7cce3a28e9fe1daa149785c9c8c13ad1249071bc778fa40ae8773

# Install Java/Play dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get -y install --no-install-recommends openjdk-8-jdk && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt /var/cache/apt/archives/* /tmp/*

RUN bitnami-pkg install node-6.4.0-0 --checksum 41d5a7b17ac1f175c02faef28d44eae0d158890d4fa9893ab24b5cc5f551486f

# Install Java/Play (Activator) module
RUN bitnami-pkg install activator-1.3.10-3 --checksum c53b4981e56365c8ff247d2ebb6914a0a8f69e8e34c00f2da9d2196919bc6fd3 -- --applicationDirectory /projects

EXPOSE 9000

# Set up Codenvy integration
LABEL che:server:9000:ref=play che:server:9000:protocol=http

USER bitnami
WORKDIR /projects

ENV TERM=xterm

CMD ["/entrypoint.sh", "tail", "-f", "/dev/null"]
