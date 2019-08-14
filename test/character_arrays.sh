#!/bin/bash
# Generate character arrays for unicode and latex conversion tests.

# LATEX, UNICODE and ASCII are the keywords for the respective array contents.

# MIN_COUNT entries will be filled into MIN_LATEX_ARRAY and MIN_UNICODE_ARRAY.
# ADD_COUNT entries will be filled into ADD_LATEX_ARRAY and ADD_UNICODE_ARRAY.
# ALL_COUNT entries will be filled into ALL_LATEX_ARRAY, ALL_UNICODE_ARRAY and
# ALL_ASCII_ARRAY where MIN_COUNT + ADD_COUNT = ALL_COUNT counts all characters.

# Minimum list of replacements (temporarily escape backslashes).
MIN_LATEX='
\\"{a} \\"{o} \\"{u} \\"{A} \\"{O} \\"{U}
\\^{a} \\^{e} \\^{i} \\^{o} \\^{u} \\^{s} \\^{A} \\^{E} \\^{I} \\^{O} \\^{U}
\\c{c}
\\&'

MIN_UNICODE='
ä ö ü Ä Ö Ü
â ê î ô û ŝ Â Ê Î Ô Û
ç
&'

MIN_ASCII='
ae oe ue Ae Oe Ue
a  e  i  o  u  s  A  E  I  O  U
c
&'

# Additional list of replacements (temporarily escape backslashes).
ADD_LATEX='
\\"{i} \\"{n}
\\H{o} \\H{u} \\H{O} \\H{U}
\\k{a} \\k{e} \\k{A} \\k{E}
\\r{a} \\r{A}
\\v{c} \\v{r} \\v{s} \\v{z} \\v{C} \\v{R} \\v{S} \\v{Z}
\\~{a} \\~{n} \\~{A} \\~{N}
{\\ae} {\\oe} {\\ss} {\\l} {\\L} {\\o} {\\O}'

ADD_UNICODE='
ı̈ n̈
ő ű Ő Ű
ą ę Ą Ę
å Å
č ř š ž Č Ř Š Ž
ã ñ Ã Ñ
æ œ ß ł Ł ø Ø'

ADD_ASCII='
i  n
oe ue Oe Ue
a  e  A  E
aa Aa
c  r  s  z  C  R  S  Z
a  n  A  N
ae oe ss l  L  oe Oe'

# Fill variables into arrays.
MIN_COUNT=0
for char in $(tr ' ' '\n' <<< $MIN_LATEX)
do
  MIN_COUNT=$(($MIN_COUNT + 1))
  MIN_LATEX_ARRAY[$MIN_COUNT]=$char
  ALL_LATEX_ARRAY[$MIN_COUNT]=$char
done

MIN_COUNT=0
for char in $(tr ' ' '\n' <<< $MIN_UNICODE)
do
  MIN_COUNT=$(($MIN_COUNT + 1))
  MIN_UNICODE_ARRAY[$MIN_COUNT]=$char
  ALL_UNICODE_ARRAY[$MIN_COUNT]=$char
done

MIN_COUNT=0
for char in $(tr ' ' '\n' <<< $MIN_ASCII)
do
  MIN_COUNT=$(($MIN_COUNT + 1))
  ALL_ASCII_ARRAY[$MIN_COUNT]=$char
done

ADD_COUNT=0
for char in $(tr ' ' '\n' <<< $ADD_LATEX)
do
  ADD_COUNT=$(($ADD_COUNT + 1))
  ALL_COUNT=$(($ADD_COUNT + $MIN_COUNT))
  ADD_LATEX_ARRAY[$ADD_COUNT]=$char
  ALL_LATEX_ARRAY[$ALL_COUNT]=$char
done

ADD_COUNT=0
for char in $(tr ' ' '\n' <<< $ADD_UNICODE)
do
  ADD_COUNT=$(($ADD_COUNT + 1))
  ALL_COUNT=$(($ADD_COUNT + $MIN_COUNT))
  ADD_UNICODE_ARRAY[$ADD_COUNT]=$char
  ALL_UNICODE_ARRAY[$ALL_COUNT]=$char
done

ADD_COUNT=0
for char in $(tr ' ' '\n' <<< $ADD_ASCII)
do
  ADD_COUNT=$(($ADD_COUNT + 1))
  ALL_COUNT=$(($ADD_COUNT + $MIN_COUNT))
  ALL_ASCII_ARRAY[$ALL_COUNT]=$char
done
