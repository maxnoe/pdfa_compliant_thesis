# PDF/A compliant thesis

Producing pdf/a compliant documents
directly from LaTeX is not straight forward.


For this to work, also all input files need to be pdf/a compliant.

This basically means:

* They must contain correct color profiles
* Fonts must be embedded
* Metadata must be set for the main document

A lot of help comes from the documentation of the `pdfx` LaTeX package,
which also covers `PDF/A` standards.


Most importantly, the resulting PDF file is checked for compliance using
`verapdf`, download here <https://verapdf.org/software/>.

Make sure this in your `$PATH`, e.g. by unpacking into `$HOME/.local/verapdf`
and doing `ln -s $HOME/.local/verapdf/verapdf $HOME/.local/bin`.

If the pdf is not compliant, make will fail. 
The report with the found issues is in `build/pdfa_compliance.xml`.

This repo also contains the necessary settings to produce PDF/A compliant 
`matplotlib` plots using the `pgf` backend.


Important resources:

* `pdfx` documentation: http://mirrors.ctan.org/macros/latex/contrib/pdfx/pdfx.pdf
* Important option for lualatex: https://tex.stackexchange.com/questions/474197/pdfx-incomplete-cidset-in-some-fonts/474336#474336
