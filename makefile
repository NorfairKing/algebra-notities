.PHONY: assets

OUTPUT_NAME = algebra-notities
MAIN_NAME = main

LATEX = ./makepdf.sh

all:
	make assets
	make text

text: $(OUTPUT_NAME).pdf

$(OUTPUT_NAME).pdf:
	$(LATEX) $(MAIN_NAME).tex
	cp $(MAIN_NAME).tex $(OUTPUT_NAME).pdf

