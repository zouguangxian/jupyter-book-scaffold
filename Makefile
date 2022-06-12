.PHONY: texlive-packages.txt latex texliveonfly pdf build

texlive-packages.txt:
	printf "texliveonfly\nlatexmk\ncollection-fontsrecommended\n" > $@

install-dependencies:
	tlmgr install `cat texlive-packages.txt`

latex:
	jb build ./ --builder latex
 
texliveonfly: latex
	cd _build/latex/ && texliveonfly -c xelatex book ; cd -

pdf: latex
	latexmk -r _build/latex/latexmkrc -cd  -xelatex -pdf _build/latex/book

build: pdf
