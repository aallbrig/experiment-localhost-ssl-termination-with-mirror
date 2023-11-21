#!/usr/bin/env sh

GAME_SERVER_LINUX_ROOT=/root/game-server
GAME_SERVER_LINUX_BINARY=tanks.game-server.x86_64
GAME_SERVER_LINUX_BINARY_PATH=${GAME_SERVER_LINUX_ROOT}/${GAME_SERVER_LINUX_BINARY}

function run_game_server() {
  ${GAME_SERVER_LINUX_BINARY_PATH} \
      -batchmode \
      -nographics \
      -logfile /dev/stdout
}

function main() {
  run_game_server
}

main
