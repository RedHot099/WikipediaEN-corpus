#!/bin/bash

# Download the latest Wikipedia dump file
#wget https://dumps.wikimedia.org/enwiki/latest/enwiki-latest-pages-articles.xml.bz2

# Extract the text from the dump file using native Bash commands
bzcat enwiki-latest-pages-articles.xml.bz2 | \
	sed -n '/<text/,/<\/text>/p' | \
	sed -e 's/<[^>]*>//g' | \
	sed '/^{{/d; /^$/d; /\t{{/d; s/|/ /g; s/=/ /g; /&.*;/d' | \
	sed '/^\s*$/d; /^$/d' | \
	sed 's/^[[:space:]]*//' | \
	tr -d "'[]{}" > \
	enwiki-latest-corpus.txt

# Clean up
#rm enwiki-latest-pages-articles.xml.bz2
