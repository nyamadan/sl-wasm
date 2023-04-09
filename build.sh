#! /bin/bash

set -eux
cd "$(dirname "$0")"

# shellcheck source=/dev/null
. "$EMSDK"/emsdk_env.sh

curl -L  -o "PDCurses-3.9.tar.gz" "https://github.com/wmcbrine/PDCurses/archive/refs/tags/3.9.tar.gz"
tar -xvzf "PDCurses-3.9.tar.gz"
git apply ./PDCurses-3.9.patch 
pushd PDCurses-3.9/sdl2
emmake make
popd

curl -L -o "sl-5.02.tar.gz" "https://github.com/mtoyoda/sl/archive/refs/tags/5.02.tar.gz"
tar -xvzf "sl-5.02.tar.gz"
git apply ./sl-5.02.patch 
emmake make