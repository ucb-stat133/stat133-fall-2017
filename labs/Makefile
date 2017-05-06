# input files
RMDS = $(wildcard *.Rmd)

# output files
MDS = $(patsubst %.Rmd, %.md, $(RMDS))
PDFS = $(patsubst %.Rmd, %.pdf, $(RMDS))
HTMLS = $(patsubst %.Rmd, %.html, $(RMDS))


.PHONY: mds pdfs htmls clean


mds: $(MDS)


pdfs: $(PDFS)


htmls: $(HTMLS)


%.md: %.Rmd
	Rscript -e "library(rmarkdown); render('$<', output_format = 'github_document')"


%.pdf: %.Rmd
	Rscript -e "library(rmarkdown); render('$<', output_format = 'pdf_document')"


%.html: %.Rmd
	Rscript -e "library(rmarkdown); render('$<', output_format = 'html_document')"


clean:
	rm -rf *.md *.pdf *.html
