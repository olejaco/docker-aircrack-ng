FROM kalilinux/kali-rolling:latest

RUN apt-get update && apt-get install -y git autoconf libtool pkg-config build-essential libssl-dev john

RUN git clone https://github.com/aircrack-ng/aircrack-ng
WORKDIR /aircrack-ng

RUN autoreconf -i
RUN ./configure --with-experimental --disable-libnl
RUN make
RUN make install
RUN ldconfig

ENTRYPOINT ["aircrack-ng"]
CMD ["--help"]