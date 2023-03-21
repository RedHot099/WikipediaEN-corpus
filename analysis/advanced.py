from matplotlib import pyplot as plt
from math import log
def log_rang_log_freq(vals: list[int], fname: str = "fig.png"):
    plt.figure().clear()
    plt.plot([log(x) for x in range(1, len(vals)+1)], [log(y) for y in vals])
    plt.savefig('../figures/'+fname)
    plt.show()
    return plt

def words_freq_dict(filename: str = "word_freq.txt") -> dict:
    words = {}
    with open(filename) as f:
        for line in f.readlines():
            try:
                occ, word = line.strip().replace('\n', '').split(' ')
                occ = int(occ)
            except:
                #words[len' '] = line.strip().replace('\n', '')
                pass
            if len(word) in words:
                if words[len(word)]['min']['count'] > occ:
                    words[len(word)]['min']['count'] = occ
                    words[len(word)]['min']['word'] = word

                if words[len(word)]['max']['count'] < occ:
                    words[len(word)]['max']['count'] = occ
                    words[len(word)]['max']['word'] = word
            else:
                words[len(word)] = {
                    'min' : {
                        'word': word,
                        'count': occ
                    },
                    'max' : {
                        'word': word,
                        'count': occ
                    }
                }

    return words


def word_len_occ(filename: str = "len_freq.txt") -> list[int]:
    word_len, word_occ = [], []
    with open(filename) as f:
        for line in f.readlines():
            occ, l = line.strip().replace('\n', ' ').split(' ')
            word_len.append(int(l))
            word_occ.append(int(occ))
    return word_len[1:], word_occ[1:]


def bigram_len_occ(filename: str = "bigram_freq.txt") -> list[int]:
    bigram_len, bigram_occ = [], []
    with open(filename) as f:
        for line in f.readlines():
            occ, l1, l2 = line.strip().replace('\n', ' ').split(' ')
            bigram_len.append(len(l1) + len(l2))
            bigram_occ.append(int(occ))
    return bigram_len[1:], bigram_occ[1:]



#Zpif law figure
log_rang_log_freq(word_len_occ()[1], 'zipf-words.png')

#Zipf law for bigram figure
log_rang_log_freq(bigram_len_occ()[1], 'zipf-bigrams.png')

#Most & least frequent words from text
def disturbing_words():
    words = words_freq_dict()
    for i, w in sorted(words.items()):
        if(w['min']['word'] != w['max']['word']):
            print(f'{i}  - {w}')