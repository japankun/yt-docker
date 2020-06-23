FROM ubuntu:latest

ENV PEERCAST_PASSWORD=71447144

WORKDIR /tmp

RUN apt update && \
  apt install -y make g++ binutils-gold ruby ruby-dev curl python3 librtmp-dev && \
  gem install fileutils json && \
  curl -OL https://github.com/plonk/peercast-yt/archive/v0.3.2.tar.gz && \
  tar xvf v0.3.2.tar.gz && \
  cd peercast-yt-0.3.2/ui/linux && \
  make && \
  cp -R ./peercast-yt /tmp && \
  rm -rf /tmp/peercast-yt-0.3.2 && \
  rm /tmp/v0.3.2.tar.gz && \
  apt remove -y make g++ binutils-gold ruby ruby-dev curl && \
  apt clean all

EXPOSE 7144

WORKDIR /tmp/peercast-yt

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
