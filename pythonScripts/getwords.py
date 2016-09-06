import random

# WORDS = ("python", "jumble", "easy", "difficult", "answer",  "xylophone")

word_file = "/usr/share/dict/words"
WORDS = open(word_file).read().splitlines()

word = random.choice(WORDS)
print word
word = random.choice(WORDS)

print word
word = random.choice(WORDS)
print word
word = random.choice(WORDS)
print word

