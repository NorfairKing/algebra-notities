dir=$(dirname $1)
cd $dir
basename=$(basename $1)
filename="${basename%.*}"
pdflatex --shell-escape --interaction nonstopmode $basename  || true
makeglossaries "$filename"  || true
makeindex "$filename"  || true
pdflatex --shell-escape --interaction nonstopmode $basename  || true
bibtex "$filename"  || true
makeglossaries "$filename"  || true
makeindex "$filename"  || true
pdflatex --shell-escape --interaction nonstopmode $basename  || true
bibtex "$filename"  || true
pdflatex --shell-escape --interaction nonstopmode $basename  || true
pdflatex --shell-escape --interaction nonstopmode $basename  || true
rm -f *.aux *.out *.log *.bbl *.blg *.lst *.idx *~ *.*~* *.backup *.nav *.snm *.toc *.xwm
