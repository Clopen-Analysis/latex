COMPILER := latexmk -cd -interaction=batchmode -time -bibtex

.PHONY: clean output-revision

clopen_analysis.pdf: clopen_analysis.tex *.bib packages/*.sty chapters/*.tex revision
ifdef only
	$(COMPILER) clopen_analysis.tex -pdf -usepretex="\includeonly{$(only)}" $(args)
else
	$(COMPILER) clopen_analysis.tex -pdf $(args)
endif

clean:
	rm -fv notebook.pdf
	rm -fv {,src/}*.{aux,log,out,fls,toc} # latex
	rm -fv {,src/}*.fdb_latexmk # latexmk
	rm -fv {,src/}*.{bbl,bcf,blg,run.xml} # biber
	rm -fv {,src/}*.{idx,ilg,ind} # makeindex

output-revision:
	git --no-pager log -1 --date=short --decorate=short --pretty=format:"%h (%cd)" HEAD > revision
