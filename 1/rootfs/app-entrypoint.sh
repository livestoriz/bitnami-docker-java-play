#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page
check_for_updates &

PROJECT_DIRECTORY="/app/${PLAY_PROJECT_NAME}"

if [ "$1" == "activator" ] && [ "$5" == "~run" ]; then
  if [ ! -d "${PROJECT_DIRECTORY}" ]; then
    log "Creating example Play application"
    nami execute activator createProject --force "${PLAY_PROJECT_NAME}" "${PLAY_TEMPLATE}"
    log "Play app created"
  else
   log "App already created"
  fi
fi

log "activator successfully initialized"

cd "$PROJECT_DIRECTORY" || exit 1


exec tini -- "$@"
