#!/bin/bash

#count comas & spaces
echo "Ammount of comas"
bzcat $1 | tr '[:upper:]' '[:lower:]' | tr -cd ',' | wc -c
echo "Ammount of dots"
bzcat $1 | tr '[:upper:]' '[:lower:]' | tr -cd '.' | wc -c
echo "Ammount of white spaces"
bzcat $1 | tr '[:upper:]' '[:lower:]' | tr -cd ' ' | wc -c
echo "Ammount of line breaks"
bzcat $1 | tr '[:upper:]' '[:lower:]' | tr -cd '\n' | wc -c

#calculate no occurances of each word
echo "calculate no occurances of each word"
bzcat $1 | tr -s '[:punct:][:space:]' '\n' | grep -E "^[^\x00-\x7F]*[[:alpha:]][^\x00-\x7F]*$" | sort | uniq -c | sort -nr > word_freq.txt

# Convert text to lowercase and replace non-alphabetic characters with spaces, then use awk to print bigrams
echo "calculate bigrams frequency in text"
bzcat $1 | tr '[:upper:]' '[:lower:]' | tr -cs '[:alpha:]' ' ' | fold -w 1000 | sed -e 's/\b\s\+\b/ /g' | awk '{for(i=1;i<NF;i++)print $i,$(i+1)}' | sort | uniq -c > bigram_freq.txt

#calculate no occurances of words depending on length
echo "calculate no occurances of words depending on length"
bzcat $1 | tr -cs '[:alnum:]' ' ' | tr ' ' '\n' | awk '{print length}' | sort -n | uniq -c > len_freq.txt