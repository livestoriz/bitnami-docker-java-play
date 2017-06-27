FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r8

MAINTAINER Bitnami <containers@bitnami.com>

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list
RUN install_packages git subversion openssh-server rsync
RUN mkdir /var/run/sshd && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV BITNAMI_APP_NAME=che-java-play \
    BITNAMI_IMAGE_VERSION=1.3.12-r3 \
    PATH=/opt/bitnami/activator/bin:/opt/bitnami/node/bin:$PATH

# Install related packages
RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates-java/jessie-backports openjdk-8-jdk-headless openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt /var/cache/apt/archives/*

RUN bitnami-pkg install node-6.11.0-0 --checksum 203d22e3357eb5e8573c8d95691f01e1a2a3badcfc2baee0bf83b3ad91dfeb86

# Install Java/Play (Activator) module
RUN bitnami-pkg install activator-1.3.12-1 --checksum 02826d6da33fd24bd3007240d5d32d4779a1968d7ef8b075950a2c82109709fc

EXPOSE 9000

# Set up Codenvy integration
LABEL che:server:9000:ref=play che:server:9000:protocol=http

USER bitnami
WORKDIR /projects

ENV TERM=xterm

CMD sudo /usr/sbin/sshd -D
