#!/bin/sh
FILENAME="/your/location/your-file"


if [ -f "$FILENAME".4.gz ]; then
    rm -f "$FILENAME".4.gz
fi
if [ -f "$FILENAME".3.gz ]; then
    mv -f "$FILENAME".3.gz "$FILENAME".4.gz
fi

if [ -f "$FILENAME".2.gz ]; then
    mv -f "$FILENAME".2.gz "$FILENAME".3.gz
fi

if [ -f "$FILENAME".1.gz ]; then
    mv -f "$FILENAME".1.gz "$FILENAME".2.gz
fi
if [ -f "$FILENAME" ]; then
    gzip -c "$FILENAME" > "$FILENAME".1.gz
    echo -n "" > "$FILENAME"
fi
