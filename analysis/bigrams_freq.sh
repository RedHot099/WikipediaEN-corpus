#!/bin/bash

# Convert text to lowercase and replace non-alphabetic characters with spaces, then use awk to print bigrams
bzcat $1 | tr '[:upper:]' '[:lower:]' | tr -cs '[:alpha:]' ' ' | fold -w 1000 | sed -e 's/\b\s\+\b/ /g' | awk '{for(i=1;i<NF;i++)print $i,$(i+1)}' | sort | uniq -c > bigram_freq.txt