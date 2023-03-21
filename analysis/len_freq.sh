#!/bin/bash
#calculate no occurances of words depending on length
bzcat $1 | tr -cs '[:alnum:]' ' ' | tr ' ' '\n' | awk '{print length}' | sort -n | uniq -c > len_freq.txt