#
# makefile for chirp user's guide
#

users_guide: users_guide.pdf

users_guide.pdf: users_guide.tex crisdefs.tex Makefile
	pdflatex users_guide.tex -interaction nonstopmode || \
	rm users_guide.pdf 2> /dev/null || true

show: users_guide.pdf
	evince users_guide.pdf > /dev/null 2>&1 &

clean:
	rm *.aux *.log *.nav *.out *.snm *.toc *.vrb 2> /dev/null || true


chirp_prod: chirp_prod.pdf

chirp_prod.pdf: chirp_prod.tex crisdefs.tex Makefile
	pdflatex chirp_prod.tex -interaction nonstopmode || \
	rm chirp_prod.pdf 2> /dev/null || true

