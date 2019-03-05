OUTDIR=build

all: build/phd_mnoethe.pdf



$(OUTDIR)/phd_mnoethe.pdf: FORCE
	latexmk \
		--lualatex \
		--interaction=nonstopmode \
		--halt-on-error \
		--output-directory=$(OUTDIR) \
		phd_mnoethe.tex

$(OUTDIR)/pdfa_compliance.xml: $(OUTDIR)/phd_mnoethe.pdf
	verapdf --flavour 3u $^ | tee $@ | grep -Poh 'isCompliant="true"'


FORCE:

clean:
	rm -rf $(OUTDIR)


.PHONY: all clean FORCE
	
