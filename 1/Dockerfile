FROM bitnami/minideb-extras:jessie-r13-buildpack

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=java-play \
    BITNAMI_IMAGE_VERSION=1.3.12-r0 \
    PATH=/opt/bitnami/activator/bin:/opt/bitnami/node/bin:$PATH \
    TERM=xterm

# Install related packages
RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates-java/jessie-backports openjdk-8-jdk-headless openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt /var/cache/apt/archives/*

# Install Play dependencies
RUN bitnami-pkg install node-6.6.0-1 --checksum 36f42bb71b35f95db3bb21d088fbd9438132fb2a7fb4d73b5951732db9a6771e

# Install Java/Play (Activator) module
RUN bitnami-pkg install activator-1.3.12-0 --checksum 70d033cb398bcc7c5ac7786a27152df9fa44b2f8ddee232a721b9f6d611dba31

COPY rootfs/ /

ENV PLAY_PROJECT_NAME="myapp" \
    PLAY_TEMPLATE="play-java" \
    PLAY_PROJECT_PORT="9000"

WORKDIR /app

EXPOSE 9000

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["activator", "-Doffline=true", "-Dhttp.address=0.0.0.0 -Dhttp.port=9000", "~run"]
