OUTPUT_NAME = algebra-notities
MAIN_NAME = main

LATEX = latexmk -pdf

all: assets full_text

assets: 
	echo placeholder

full_text: $(OUTPUT_NAME).pdf

$(OUTPUT_NAME).pdf:
	$(LATEX) $(MAIN_NAME).tex -jobname="$(OUTPUT_NAME)"

