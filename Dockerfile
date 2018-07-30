FROM ubuntu:18.04

ARG VERSION=1.0.0-rc4
ARG DISTRIBUTION=https://github.com/oracle/graal/releases/download/vm-${VERSION}/graalvm-ce-${VERSION}-linux-amd64.tar.gz

RUN apt-get update \
    && apt-get install -y build-essential libc6-dev zlib1g-dev wget \
    && mkdir -p /usr/local/graalvm \
    && wget -q -O - ${DISTRIBUTION} | tar -xzC /usr/local/graalvm --strip-components=1 \
    && rm -f /usr/local/graalvm/src.zip

ENV GRAALVM_HOME /usr/local/graalvm
ENV JAVA_HOME ${GRAALVM_HOME}
ENV PATH ${GRAALVM_HOME}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["java", "-version"]