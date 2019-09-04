#!/bin/bash

BLUEIRIS_EXE="/root/prefix32/drive_c/Program Files/Blue Iris 4/BlueIris.exe"
PREFIX_DIR="/root/prefix32"
INSTALL_EXE="/root/blueiris.exe"

if [ ! -d "$PREFIX_DIR/drive_c" ]; then
    mv /root/prefix32_original/* /root/prefix32
fi

chown -R root:root /root/prefix32

if [ ! -e "$BLUEIRIS_EXE" ] ; then
    if [ ! -e "$INSTALL_EXE" ] ; then
        wget http://www.blueirissoftware.com/blueiris_48603.exe
    fi
    wine blueiris.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
    rm blueiris.exe
fi

wine "$BLUEIRIS_EXE"
