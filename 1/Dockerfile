FROM bitnami/minideb-extras:jessie-r19-buildpack
LABEL maintainer "Bitnami <containers@bitnami.com>"



# Install required system packages and dependencies
RUN echo "deb http://http.debian.net/debian jessie-backports main" >>/etc/apt/sources.list
RUN install_packages ca-certificates-java/jessie-backports ghostscript imagemagick libbz2-1.0 libc6 libgcc1 libmysqlclient18 libncurses5 libreadline6 libsqlite3-0 libssl1.0.0 libstdc++6 libtinfo5 openjdk-8-jdk openjdk-8-jdk-headless zlib1g
RUN bitnami-pkg install node-6.11.0-0 --checksum 203d22e3357eb5e8573c8d95691f01e1a2a3badcfc2baee0bf83b3ad91dfeb86
RUN bitnami-pkg install activator-1.3.12-1 --checksum 02826d6da33fd24bd3007240d5d32d4779a1968d7ef8b075950a2c82109709fc

COPY rootfs /

ENV BITNAMI_APP_NAME="java-play" \
    BITNAMI_IMAGE_VERSION="1.3.12-r3" \
    PATH="/opt/bitnami/node/bin:/opt/bitnami/activator/bin:$PATH" \
    PLAY_PROJECT_NAME="myapp" \
    PLAY_PROJECT_PORT="9000" \
    PLAY_TEMPLATE="play-java"




EXPOSE 9000

WORKDIR /app
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["activator","-Doffline=true","-Dhttp.address=0.0.0.0","-Dhttp.port=9000","~run"]
