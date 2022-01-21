# First stage
FROM alpine:latest

ENV DCDEV /opt/toolchains/dc
ENV PATH $PATH:${DCDEV}/bin
COPY . /src


RUN apk add build-base bash gcc git make flex bison texinfo gmp-dev mpfr-dev mpc1-dev readline-dev ncurses-dev
RUN mkdir $DCDEV
RUN cd /src && ./toolchain.sh

# Second stage
FROM alpine:latest

ENV DCDEV /opt/toolchains/dc
ENV PATH $PATH:${DCDEV}/bin

COPY --from=0 ${DCDEV} ${DCDEV}
