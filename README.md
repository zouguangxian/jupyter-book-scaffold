# jupyter-book-scaffold

# Setup
````
apt-get update
./setup-for-build.sh
tlmgr install `cat texlive-packages.txt`
````
# Build
## HTML
````
jupyter-book build .
````
## PDF
````
jupyter-book build . --builder latex
latexmk -r _build/latex/latexmkrc -cd  -xelatex -C _build/latex/main
latexmk -r _build/latex/latexmkrc -cd  -xelatex -pdf _build/latex/main
````
