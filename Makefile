PREFIX = $(HOME)
BINDIR = $(PREFIX)/bin
SCRIPTS = $(wildcard bin/*[^~])
STYLE ?= -t --stylesheet-dirs=$(ROOTSYS)/RootNimosScripts/etc
CLEAN = README.html $(addprefix master,.aux .log .fdb_latexmk .fls .nav .out .pdf .snm .toc .vrb)

info:
	@echo "Available targets:"
	@echo "- install: install scripts to $(BINDIR)"
	@echo "- uninstall: remove scripts from $(BINDIR)"
	@echo "- doc: create README.html and master.pdf"
	@echo "- info: print this information"

install: $(SCRIPTS)
	install -m 755 $+ $(BINDIR)/

uninstall: | $(wildcard $(addprefix $(BINDIR)/,$(notdir $(SCRIPTS))))
	$(if $|,rm -f $|)

doc: README.html master.pdf

master.pdf: master.tex $(wildcard figures/*.jpg)
	latexmk $< && latexmk -c $<

clean:
	$(if $(wildcard $(CLEAN)),$(RM) $(wildcard $(CLEAN)))

md_to_rst_to_html = pandoc -t rst $< | rst2html -t $(STYLE) - $@

%.html : %.md
	$(if $(shell which pandoc),$(if $(shell which rst2html),$(md_to_rst_to_html),\
	$(info Please install 'python-docutils' to create html documentation.)))


.PHONY: all doc test install uninstall clean info
