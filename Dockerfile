FROM alpine:3

ARG PEERCAST_PASSWORD 71447144

RUN apk update
RUN apk add make g++ binutils-gold ruby ruby-dev
RUN gem install fileutils json

WORKDIR /tmp
RUN wget https://github.com/plonk/peercast-yt/archive/v0.2.9.tar.gz && \
  tar xvf v0.2.9.tar.gz && \
  cd peercast-yt-0.2.9/ui/linux && \
  make
RUN cp -R peercast-yt-0.2.9/ui/linux/peercast-yt /tmp &&\
  rm -rf /tmp/peercast-yt-0.2.9
  
RUN echo -e "[Privacy]\npassword = $PEERCAST_PASSWORD" > /tmp/peercast-yt/peercast.ini

EXPOSE 7144

WORKDIR /tmp/peercast-yt

CMD ["./peercast"]
