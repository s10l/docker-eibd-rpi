FROM s10l/raspbian-stretch-minified:latest
MAINTAINER s10l <s10l@github.com>

ADD eibd.tar.xz /

# useradd replaced with ADD command, due to AMD64 build env in docker hub
# RUN useradd eibd -s /bin/false -U -M
ADD credentials.tar.xz /

EXPOSE 3671/udp
EXPOSE 6720

USER eibd

ENTRYPOINT ["/usr/local/bin/eibd"]

CMD ["-e 0.0.142", "-c", "-S", "-D", "-i", "-T", "-R", "-u", "--tpuarts-disch-reset", "--tpuarts-ack-all-group", "tpuarts:/dev/ttyAMA0"]
