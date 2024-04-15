#!/bin/bash
  
#grep -f scrambledA.txt wordlistC.txt | cut -d'-' -f2 > scrambledB.txt

while IFS= read -r term; do grep -F "${term}" wordlistC.txt || echo "not found: ${term}"; done < scrambledA.txt | cut -d'-' -f2 > unscrambledA.txt