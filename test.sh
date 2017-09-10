#!/bin/bash

CHARGEN=./index.js
NEW_JSON=new-char.json
REF_JSON=test-char.json
OUTPUT=test-result.txt

if [ "$1" = "regen" ]; then
    rm $REF_JSON
    (echo 2; echo 2; echo Fred; echo 2; echo str dex int spi) \
	| $CHARGEN $REF_JSON > $OUTPUT
else
    if [ ! -f $REF_JSON ]; then
	echo Please run \"$0 regen\" to generate reference output first.
	exit 1
    fi
    rm $NEW_JSON
    if (echo 2; echo 2; echo Fred; echo 2; echo str dex int spi) \
	   | $CHARGEN $NEW_JSON | diff -u - $OUTPUT; then
	if diff -u $NEW_JSON $REF_JSON; then
	    echo OK
	else
	    echo CHARGEN FAILED: output OK
	fi
    else
	echo OUTPUT FAILED
    fi
fi
