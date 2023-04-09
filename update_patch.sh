#! /bin/sh
set -eux
git diff c326a67d315356c741dc38643b7b12a90601588d lib -- sl-5.02 > sl-5.02.patch
git diff c326a67d315356c741dc38643b7b12a90601588d lib -- PDCurses-3.9 > PDCurses-3.9.patch