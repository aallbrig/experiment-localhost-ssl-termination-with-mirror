#!/usr/bin/env sh

function run_game_server() {
  /root/game-server/tanks.game-server.x86_64 \
      -batchmode \
      -nographics \
      -logfile /dev/stdout
}

function main() {
  run_game_server
}

main
