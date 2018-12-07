FROM s10l/raspbian-stretch-minified:latest
MAINTAINER s10l <s10l@github.com>

ADD eibd.tar.xz /

RUN useradd eibd -s /bin/false -U -M
EXPOSE 3671:3671/udp

USER eibd
ENTRYPOINT ["/usr/local/bin/eibd"]
CMD ["-e 0.0.142", "-c", "-S", "-D", "-i", "-T", "-R", "-u", "--tpuarts-disch-reset", "--tpuarts-ack-all-group", "tpuarts:/dev/ttyAMA0"]
