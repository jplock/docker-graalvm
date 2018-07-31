FROM ubuntu:18.04

ARG VERSION=1.0.0-rc4
ARG DISTRIBUTION=https://github.com/oracle/graal/releases/download/vm-${VERSION}/graalvm-ce-${VERSION}-linux-amd64.tar.gz

LABEL name="graalvm-ce" version=$VERSION

WORKDIR /usr/local/graalvm-ce

RUN apt-get update \
    && apt-get install -y build-essential libc6-dev zlib1g-dev wget \
    && wget -q -O - ${DISTRIBUTION} | tar -xz --strip-components=1 \
    && rm -f /usr/local/graalvm-ce/src.zip

ENV GRAALVM_HOME /usr/local/graalvm-ce
ENV GRAALVM_VERSION ${VERSION}
ENV JAVA_HOME ${GRAALVM_HOME}
ENV PATH ${GRAALVM_HOME}/bin:${PATH}

CMD ["java", "-version"]