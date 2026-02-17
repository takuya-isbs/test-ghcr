FROM ubuntu:24.04

RUN apt-get update && apt-get install -y gosu && rm -rf /var/lib/apt/lists/*
COPY ./src/entrypoint.sh /entrypoint.sh
COPY ./src/test.sh /test.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["/bin/sh", "-c", "cd && exec /bin/bash"]
