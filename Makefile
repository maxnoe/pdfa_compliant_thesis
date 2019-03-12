NAME=thesis
OUTDIR=build
MATPLOTLIBRC=plots/matplotlibrc

all: build/$(NAME).pdf build/pdfa_compliance.xml


plots: $(addprefix $(OUTDIR)/plots/, $(addsuffix .pdf, \
	sin \
	))


$(OUTDIR)/$(NAME).pdf: plots FORCE
	latexmk \
		--lualatex \
		--interaction=nonstopmode \
		--halt-on-error \
		--output-directory=$(OUTDIR) \
		$(NAME).tex


$(OUTDIR)/pdfa_compliance.xml: $(OUTDIR)/$(NAME).pdf
	verapdf --flavour 3u $^ | tee $@ | grep -Poh 'isCompliant="true"'


$(OUTDIR)/plots/%.pdf: plots/plot_%.py plots/matplotlibrc plots/header.tex | $(OUTDIR)/plots
	TEXINPUTS=$$(pwd)/plots:$$(pwd): \
	MATPLOTLIBRC=$(MATPLOTLIBRC) \
		python $< $@ 


$(OUTDIR)/plots:
	mkdir -p $(OUTDIR)/plots


FORCE:

clean:
	rm -rf $(OUTDIR)


.PHONY: all clean FORCE
	
