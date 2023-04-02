#! /bin/bash

set -eux
cd "$(dirname "$0")"

# shellcheck source=/dev/null
. "$EMSDK"/emsdk_env.sh

curl -L  -o "PDCurses-3.9.tar.gz" "https://github.com/wmcbrine/PDCurses/archive/refs/tags/3.9.tar.gz"
tar -xvzf "PDCurses-3.9.tar.gz"
pushd PDCurses-3.9/sdl2
emmake make
popd

ln -f -s PDCurses-3.9/sdl2/pdcurses.a libpdcurses.a

curl -L -o "sl-5.02.tar.gz" "https://github.com/mtoyoda/sl/archive/refs/tags/5.02.tar.gz"
tar -xvzf "sl-5.02.tar.gz"
patch -p1 < ./sl-5.02.patch 
emmake make