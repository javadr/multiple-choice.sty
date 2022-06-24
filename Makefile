PKG=multiple-choices

all: doc clean

doc:
	pdflatex $(PKG)-doc
	evince $(PKG)-doc.pdf &

clean:
	-rm *.aux *.log *.toc *.idx *.hd *~ *.out

ctan: clean
	-rm -rfv $(PKG)
	-rm -rfv $(PKG).zip
	mkdir -p $(PKG)/doc $(PKG)/tex
	cp -v README        $(PKG)
	cp -v $(PKG).sty    $(PKG)/tex
	cp -v $(PKG)-doc.* $(PKG)/doc
	zip -r $(PKG).zip $(PKG)
	# mv -fv $(PKG).zip ..
	rm -rfv $(PKG)
	# mv -fv $(PKG) ..
