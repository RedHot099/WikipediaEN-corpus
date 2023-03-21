#!/bin/bash
#calculate no occurances of each word
bzcat $1 | tr -s '[:punct:][:space:]' '\n' | grep -E "^[^\x00-\x7F]*[[:alpha:]][^\x00-\x7F]*$" | sort | uniq -c | sort -nr > word_freq.txt