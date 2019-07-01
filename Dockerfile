FROM ubuntu as builder

RUN apt-get update && \
    apt-get install -y \
        git \
        build-essential \
        autoconf

ARG GIFSICLE_BRANCH="v1.92"
RUN git clone --branch $GIFSICLE_BRANCH https://github.com/kohler/gifsicle.git /gifsicle
WORKDIR /gifsicle
RUN autoreconf -i
RUN ./configure --disable-gifview --disable-gifdiff
RUN make


FROM node

COPY --from=builder /gifsicle /gifsicle
RUN cd /gifsicle && \
    make install

RUN set -ex && \
  apt-get update && \
  apt-get -y install ffmpeg imagemagick curl

# install gifify
RUN npm i -g gifify

# run gifify in /data (requires user to mount their source folder in /data)
WORKDIR /data

ENTRYPOINT ["gifify"]
