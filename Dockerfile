FROM ubuntu:latest

ENV PEERCAST_PASSWORD=71447144

RUN apt update
RUN apt install -y make g++ binutils-gold ruby ruby-dev curl python3
RUN gem install fileutils json

WORKDIR /tmp
RUN curl -OL https://github.com/plonk/peercast-yt/archive/v0.2.9.tar.gz && \
  tar xvf v0.2.9.tar.gz && \
  cd peercast-yt-0.2.9/ui/linux && \
  make

RUN cp -R peercast-yt-0.2.9/ui/linux/peercast-yt /tmp && \
  rm -rf /tmp/peercast-yt-0.2.9 && \
  rm /tmp/v0.2.9.tar.gz

EXPOSE 7144

WORKDIR /tmp/peercast-yt

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
