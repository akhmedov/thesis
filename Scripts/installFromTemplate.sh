#!/bin/bash

iconv -f cp1251 -t utf8 Template/vakthesis.ins > vakthesis.ins
iconv -f cp1251 -t utf8 Template/vakthesis.dtx > vakthesis.dtx

latex vakthesis.ins

for i in *-*
do
    mv "$i" "`echo $i | cut -f2 -d-`"
done

# TODO: autamation file edit
# use sed shell command
# replace xample-* paths and cp1251 encoding
