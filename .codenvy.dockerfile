FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r8

MAINTAINER Bitnami <containers@bitnami.com>

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list
RUN apt-get update && apt-get install -t jessie-backports -y ca-certificates-java openjdk-8-jdk-headless
RUN install_packages git subversion openssh-server rsync
RUN mkdir /var/run/sshd && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV BITNAMI_APP_NAME=che-java-play \
    BITNAMI_IMAGE_VERSION=1.3.10-r8 \
    PATH=/opt/bitnami/activator/bin:/opt/bitnami/node/bin:$PATH

RUN bitnami-pkg install node-6.4.0-0 --checksum 41d5a7b17ac1f175c02faef28d44eae0d158890d4fa9893ab24b5cc5f551486f

# Install Java/Play (Activator) module
RUN bitnami-pkg install activator-1.3.10-4 --checksum 77fa565ff8d55cd9b21dc66405a4f4e9a089bd8fe231a61dd4ac9d0dcad0f3ac -- --applicationDirectory /projects

EXPOSE 9000

# Set up Codenvy integration
LABEL che:server:9000:ref=play che:server:9000:protocol=http

USER bitnami
WORKDIR /projects

ENV TERM=xterm

CMD sudo /usr/sbin/sshd -D && tail -f /dev/null
