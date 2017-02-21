FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=java-play \
    BITNAMI_IMAGE_VERSION=1.3.10-r7 \
    PATH=/opt/bitnami/activator/bin:/opt/bitnami/node/bin:$PATH \
    TERM=xterm

# Install related packages
RUN echo "deb http://http.debian.net/debian jessie-r10
    apt-get install -y --no-install-recommends ca-certificates-java/jessie-r10
    apt-get clean && \
    rm -rf /var/lib/apt /var/cache/apt/archives/*

# Install Play dependencies
RUN bitnami-pkg install node-6.6.0-1 --checksum 36f42bb71b35f95db3bb21d088fbd9438132fb2a7fb4d73b5951732db9a6771e

# Install Java/Play (Activator) module
RUN bitnami-pkg install activator-1.3.10-4 --checksum 77fa565ff8d55cd9b21dc66405a4f4e9a089bd8fe231a61dd4ac9d0dcad0f3ac

COPY rootfs/ /

ENV PLAY_PROJECT_NAME="myapp" \
    PLAY_TEMPLATE="play-java" \
    PLAY_PROJECT_PORT="9000"

WORKDIR /app

EXPOSE 9000

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["activator", "-Doffline=true", "-Dhttp.address=0.0.0.0 -Dhttp.port=9000", "~run"]
