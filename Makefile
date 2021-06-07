#
# makefile for chirp user guide
#

user_guide: user_guide.pdf

user_guide.pdf: user_guide.tex crisdefs.tex figures/*.pdf \
	field_tables/chirp_1330.dims_t.tex \
	field_tables/chirp_1330.attrs_t.tex \
	field_tables/chirp_1330_var_t.tex \
	figures/*.png user_guide.bib Makefile
	pdflatex user_guide.tex -interaction nonstopmode && \
	bibtex user_guide && \
	pdflatex user_guide.tex -interaction nonstopmode && \
	pdflatex user_guide.tex -interaction nonstopmode || \
	rm user_guide.pdf 2> /dev/null || true

show: user_guide.pdf
	evince user_guide.pdf > /dev/null 2>&1 &

clean:
	rm *.aux *.log *.nav *.out *.snm *.toc *.vrb 2> /dev/null || true

