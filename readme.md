# Text corpus
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
$bzcat enwiki-latest-corpus.txt.bz2 | wc -l
677428585
```
## Size
### Unzipped
```bash
$du -sh bzcat enwiki-latest-corpus.txt
26G     enwiki-latest-corpus.txt
```
### Zipped
```bash
$du -sh enwiki-latest-corpus.txt.bz2
6.7G    enwiki-latest-corpus.txt.bz2
```
## Head of file
```bash
$bzcat enwiki-latest-corpus.txt.bz2 | head -n 5
REDIRECT Computer accessibility

short description Political philosophy and movement
Humans lived in society societies without formal hierarchies long before the establishment of formal states, realms, or empires. With the rise of organised hierarchical bodies, scepticism toward authority also rose. Although traces of anarchist thought are found throughout history, modern anarchism emerged from the Age of Enlightenment Enlightenment. During the latter half of the 19th and the first decades of the 20th century, the anarchist movement flourished in most parts of the world and had a significant role in workers struggles for emancipation. Various anarchist schools of thought formed during this period. Anarchists have taken part in several revolutions, most notably in the Paris Commune, the Russian Civil War and the Spanish Civil War, whose end marked the end of the classical era of anarchism. In the last decades of the 20th and into the 21st century, the anarchist movement has been resurgent once more, growing in popularity and influence within anti-capitalist, anti-war and anti-globalisation movements.
Anarchists employ a diversity of tactics in order to meet their ideal ends which can be broadly separated into revolutionary and evolutionary tactics; there is significant overlap between the two, which are merely descriptive. Revolutionary tactics aim to bring down authority and state, having taken a violent turn in the past, while evolutionary tactics aim to prefigure what an anarchist society would be like. Anarchist thought, criticism, and Praxis (process) praxis have played a part in diverse areas of human society.
```
## Random lines from file
```bash
$bzcat enwiki-latest-corpus.txt.bz2 | shuf -n 5
1 Oppose. Agree with Solipsist. I think a photo like what they show on the Cadbury ads would be great to illustrate chocolate. Melted chocolate with more melted chocolate being poured into it. --User:Fir0002 Fir0002 03:08, 24 Sep 2004 (UTC)
2 Category:Maritime incidents in 1915
3 Skagit Station Mount Vernon bus icon 12px Amtrak Thruway Motorcoach
4 In 1951, he was awarded an honorary Academy Award. He was never nominated for an Oscar in any competitive category.
photo3b   Vision Australia Transport Connections travel day June 2021 South Brisbane railway Grey Street South Brisbane L1170054.jpg!South Brisbane Railway Station
5 Ship name *Carolyn (1912-1941)
```