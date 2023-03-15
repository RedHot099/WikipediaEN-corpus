# Text corbus
based on Wikipedia EN Latest Articles -- enwiki-latest-pages-articles.xml.bz2
created with wiki.sh script

# Code
 - include only article text in between <text> marks
 - exclude lines without alphabet letters 
 - clear excessive white spaces 
 - remove special characters
 - remove unintentional empty lines

# Stats
## No lines
```bash
wc -l

```
## Size
```bash
du -sh enwiki-latest-corpus.txt.bz2

```
## Head of file
```bash
bzcat enwiki-latest-corpus.txt.bz2 | head -n 5

```
## Random lines from file
```bash
bzcat enwiki-latest-corpus.txt.bz2 | shuf -n 5

```