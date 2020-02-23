#!/bin/sh
#
# Handles various arguments passed in to docker container which should be one of
# the following:
#
# - if nothing is specified then show help for kiwix-serve
# - if the single argument generate-library then run generate-library command
# - if '--library somefile' is specified run kiwix-serve with that
# - if 'somefile.zim' then run kiwix-serve with that
#
#

set -e
set -u

kiwix_serve_cmd="/usr/local/bin/kiwix-serve --port 80"

if [ $# -eq 1 ]; then
    if [ "${1}" = "generate-library" ]; then
        # docker run [...] generate-library
        exec /usr/local/bin/generate-library
    else
        # docker run [...] somefile.zim
        exec ${kiwix_serve_cmd} "${1}"
    fi
elif [ $# -eq 2 ] && [ "${1}" = "--library" ]; then
    # docker run [...] --library somefile.xml
    exec ${kiwix_serve_cmd} --library "${2}"
else
    # docker run [...] somefile1.zim somefile2.zim ...
    # docker run [...]
    exec ${kiwix_serve_cmd} $*
    exit 1
fi
