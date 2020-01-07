# StoryBot Makefile
#
# Author: Paul Schulz <paul@mawsonlakes.org>
#
# This Makefile is used to process individual story files into a data
# file which can be used by 'fortune' to serve a random story as
# required.

.PHONY: help story prepare list clean status

help:
	@echo "Available make targets"
	@echo "  make help    - this message (default)"
	@echo "  make story   - display a story"
	@echo "  make prepare - compile the stories into data file"
	@echo "                 (This will be run automatically, if required.)"
	@echo "  make list    - list story files"
	@echo "  make clean   - reset system by removing generated files"
	@echo "  make status  - display system status"

story: stories/delete-me-to-process-stories prepare
	@/usr/games/fortune data/merged.txt

stories/delete-me-to-process-stories:
	@rm -f data/merged.txt
	@touch stories/delete-me-to-process-stories

prepare: data/merged.txt.dat

data/merged.txt.dat: data/merged.txt
	@strfile -c % data/merged.txt data/merged.txt.dat > /dev/null

data/merged.txt:
	@scripts/merge.sh > data/merged.txt

list:
	@echo "Words Story"
	@echo "--------------------------------------"
	@ls stories/*.txt | xargs wc -w

clean:
	@rm data/*
	@rm -f stories/delete-me-to-process-stories

status:
	@echo -n "Stories: "
	@ls stories/*.txt | wc -l
	@echo "Data"
	@ls -al data | grep "txt"
	@echo "Flag"
	@ls -al stories/delete-*
