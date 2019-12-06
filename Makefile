# StoryBot Makefile
#
# Author: Paul Schulz <paul@mawsonlakes.org>
#
# This Makefile is used to process individual story files into a data
# file which can be used by 'fortune' to serve a random story as
# required.

.PHONY: help story prepare list clean

help:
	@echo "make help    - this message"
	@echo "make prepare - prepare the stories into data file (for fortune)"
	@echo "make list    - list story files"
	@echo "make story   - display a story"

story: prepare
	@fortune data/merged.txt

prepare: data/merged.txt.dat

data/merged.txt.dat: data/merged.txt
	@strfile -c % data/merged.txt data/merged.txt.dat > /dev/null

data/merged.txt:
	@scripts/merge.sh > data/merged.txt

list:
	@echo "Story list"
	@echo "--------------------------------------"
	@ls stories | cat

clean:
	@rm data/*


