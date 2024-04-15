#!/bin/bash

# First create the wordlist which contains pair-value keys. 
# --> A_parse_wordlist.sh
# --> B_KeyValuePair.sh
#Then use the Mainscript
# Can be cleaned up and made to look nicer into one single script probably

./alphabetic_scrambled.sh
./match_keyvaluepair.sh
./unscramble.sh


