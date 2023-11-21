FROM ubuntu:latest

# Libs debugging e.g.
# netstat -an | grep ":7778"
# curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: localhost:7778" -H "Origin: https://localhost:8080" -H "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkQI==" -H "Sec-WebSocket-Version: 13" http://localhost:7778/
RUN apt-get update && \
    apt-get install -y net-tools curl

COPY game-server-build/      /root/game-server/
COPY entrypoint.sh           /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /root/game-server/

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
