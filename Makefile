PUBLIC = "../../../MastersThesisPresentation"

all: slides

slides: slides.adoc
	asciidoctor-revealjs slides.adoc -o index.html

copy:
	cp index.html $(PUBLIC)
	cp slides.adoc $(PUBLIC)
	cp Makefile $(PUBLIC)
	cp -r images $(PUBLIC)

	@# copy supporting dirs
	cp -r css $(PUBLIC)
	cp -r reveal.js.3.9.2 $(PUBLIC)

public: copy
	@# push latest files to public github repo
	cd $(PUBLIC) && git add -A && git commit -m "latest build" -a && git push