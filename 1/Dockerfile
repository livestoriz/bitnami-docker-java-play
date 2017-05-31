FROM bitnami/minideb-extras:jessie-r16-buildpack
LABEL maintainer "Bitnami <containers@bitnami.com>"



# Install required system packages and dependencies
RUN install_packages ghostscript imagemagick libbz2-1.0 libc6 libgcc1 libmysqlclient18 libncurses5 libreadline6 libsqlite3-0 libssl1.0.0 libstdc++6 libtinfo5 zlib1g
RUN bitnami-pkg install node-6.10.3-0 --checksum 07bb05274dd2cf71ebdd92ff00925bf1ff16588664e24f59a3b5ecfce7dce238
RUN bitnami-pkg install activator-1.3.12-0 --checksum 70d033cb398bcc7c5ac7786a27152df9fa44b2f8ddee232a721b9f6d611dba31
RUN echo 'deb http://http.debian.net/debian jessie-backports main' >> /etc/apt/sources.list && apt-get update && apt-get install -y --no-install-recommends ca-certificates-java/jessie-backports openjdk-8-jdk-headless openjdk-8-jdk && apt-get clean && rm -rf /var/lib/apt /var/cache/apt/archives/*

COPY rootfs /

ENV BITNAMI_APP_NAME="java-play" \
    BITNAMI_IMAGE_VERSION="1.3.12-r2" \
    PATH="/opt/bitnami/node/bin:/opt/bitnami/activator/bin:$PATH" \
    PLAY_PROJECT_NAME="myapp" \
    PLAY_PROJECT_PORT="9000" \
    PLAY_TEMPLATE="play-java"




EXPOSE 9000

WORKDIR /app
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["activator","-Doffline=true","-Dhttp.address=0.0.0.0","-Dhttp.port=9000","~run"]
