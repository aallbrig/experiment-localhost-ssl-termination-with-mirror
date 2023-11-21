FROM ubuntu:latest

# For debugging e.g. netstat -an | grep ":7777"
RUN apt-get update && \
    apt-get install -y net-tools

COPY game-server-build/      /root/game-server/
COPY entrypoint.sh           /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /root/game-server/

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
