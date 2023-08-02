#!/bin/sh

if [ ! -f "uv6swre.zip" ]
then
  wget http://simh.trailing-edge.com/kits/uv6swre.zip
  unzip uv6swre.zip
fi

pdp11 pdp11.ini
